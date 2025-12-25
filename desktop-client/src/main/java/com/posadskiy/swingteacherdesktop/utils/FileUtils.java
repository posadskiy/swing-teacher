package com.posadskiy.swingteacherdesktop.utils;

import lombok.extern.slf4j.Slf4j;

import javax.tools.Diagnostic;
import javax.tools.DiagnosticCollector;
import javax.tools.JavaCompiler;
import javax.tools.JavaFileObject;
import javax.tools.StandardJavaFileManager;
import javax.tools.ToolProvider;
import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.io.UncheckedIOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.util.List;
import java.util.Optional;
import java.util.stream.Collectors;

/**
 * Modern file utilities using NIO and try-with-resources.
 */
@Slf4j
public final class FileUtils {
    
    private static final String JAVA_FILE = "Answer.java";
    private static final String CLASS_FILE = "Answer.class";
    
    private FileUtils() {
        // Utility class
    }
    
    /**
     * Writes text to a file, creating it if it doesn't exist.
     */
    public static void write(String fileName, String text) {
        var path = Path.of(fileName);
        try {
            Files.writeString(path, text);
        } catch (IOException e) {
            throw new UncheckedIOException("Failed to write file: " + fileName, e);
        }
    }
    
    /**
     * Reads entire file content as a single string.
     */
    public static String read(String fileName) throws IOException {
        var path = Path.of(fileName);
        if (!Files.exists(path)) {
            throw new IOException("File not found: " + fileName);
        }
        return Files.readString(path);
    }
    
    /**
     * Reads file content as Optional, returning empty if file doesn't exist.
     */
    public static Optional<String> readOptional(String fileName) {
        try {
            return Optional.of(read(fileName));
        } catch (IOException e) {
            log.debug("Could not read file: {}", fileName, e);
            return Optional.empty();
        }
    }
    
    /**
     * Checks if file exists.
     */
    public static boolean exists(String fileName) {
        return Files.exists(Path.of(fileName));
    }
    
    /**
     * Runs compiled Answer.class file if it exists.
     */
    public static void runFile() throws ReflectiveOperationException, IOException {
        var classFile = new File(CLASS_FILE);
        if (!classFile.exists()) {
            log.warn("Class file {} does not exist", CLASS_FILE);
            return;
        }
        
        var loader = new DynamicClassLoader();
        var clazz = loader.loadClassFromFile(classFile);
        var instance = clazz.getDeclaredConstructor().newInstance();
        
        if (instance instanceof CreateFrame createFrame) {
            createFrame.createFrame();
        } else {
            log.warn("Loaded class does not implement CreateFrame");
        }
    }
    
    /**
     * Compiles user code and returns compilation errors (empty string if success).
     */
    public static String isCompileFile(String operators, String imports) throws IOException {
        // Clean up old files
        cleanupFiles(JAVA_FILE, CLASS_FILE);
        
        // Generate source code using text blocks
        var sourceCode = generateSourceCode(operators, imports);
        Files.writeString(Path.of(JAVA_FILE), sourceCode);
        
        // Compile
        return compileAndGetErrors(JAVA_FILE);
    }
    
    private static String generateSourceCode(String operators, String imports) {
        var importsSection = Optional.ofNullable(imports).orElse("");
        
        return """
            package com.posadskiy.swingteacherdesktop.utils;
            import javax.swing.*;
            import java.awt.*;
            %s
            public class Answer extends CreateFrame {
                public Answer() {
                    setTitle("Your frame");
                    %s
                    setDefaultCloseOperation(JFrame.HIDE_ON_CLOSE);
                    setPreferredSize(new Dimension(700, 400));
                    pack();
                    setLocationRelativeTo(null);
                    setVisible(true);
                }
            }
            """.formatted(importsSection, operators);
    }
    
    private static void cleanupFiles(String... fileNames) {
        for (var fileName : fileNames) {
            try {
                Files.deleteIfExists(Path.of(fileName));
            } catch (IOException e) {
                log.warn("Failed to delete file: {}", fileName, e);
            }
        }
    }
    
    private static String compileAndGetErrors(String sourceFile) throws IOException {
        var compiler = ToolProvider.getSystemJavaCompiler();
        if (compiler == null) {
            return "Java compiler not available. Please run with JDK, not JRE.";
        }
        
        var diagnostics = new DiagnosticCollector<JavaFileObject>();
        
        try (var fileManager = compiler.getStandardFileManager(diagnostics, null, null)) {
            var compilationUnits = fileManager.getJavaFileObjectsFromFiles(
                List.of(new File(sourceFile))
            );
            
            compiler.getTask(null, fileManager, diagnostics, null, null, compilationUnits).call();
            
            return diagnostics.getDiagnostics().stream()
                .map(Diagnostic::toString)
                .collect(Collectors.joining("\n"));
        }
    }
    
    /**
     * Custom class loader for dynamically loading compiled classes.
     */
    private static final class DynamicClassLoader extends ClassLoader {
        
        public Class<?> loadClassFromFile(File file) throws IOException {
            var bytes = Files.readAllBytes(file.toPath());
            return defineClass(null, bytes, 0, bytes.length);
        }
    }
}
