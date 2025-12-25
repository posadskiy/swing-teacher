package com.posadskiy.swingteacherdesktop.infrastructure.compiler;

import com.posadskiy.swingteacherdesktop.presentation.component.CreateFrame;
import lombok.extern.slf4j.Slf4j;

import javax.tools.Diagnostic;
import javax.tools.DiagnosticCollector;
import javax.tools.JavaFileObject;
import javax.tools.ToolProvider;
import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.util.List;
import java.util.Optional;
import java.util.stream.Collectors;

/**
 * Dynamic compiler for user-submitted code.
 */
@Slf4j
public final class DynamicCompiler {
    
    private static final String JAVA_FILE = "Answer.java";
    private static final String CLASS_FILE = "Answer.class";
    
    private DynamicCompiler() {
        // Utility class
    }
    
    /**
     * Compiles user code and returns compilation errors (empty string if success).
     */
    public static String compile(String operators, String imports) throws IOException {
        // Clean up old files
        cleanupFiles(JAVA_FILE, CLASS_FILE);
        
        // Generate source code
        var sourceCode = generateSourceCode(operators, imports);
        Files.writeString(Path.of(JAVA_FILE), sourceCode);
        
        // Compile
        return compileAndGetErrors(JAVA_FILE);
    }
    
    /**
     * Runs compiled Answer.class file if it exists.
     */
    public static void runCompiledCode() throws ReflectiveOperationException, IOException {
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
    
    private static String generateSourceCode(String operators, String imports) {
        var importsSection = Optional.ofNullable(imports).orElse("");
        
        return """
            package com.posadskiy.swingteacherdesktop.presentation.component;
            import javax.swing.*;
            import java.awt.*;
            %s
            public class Answer extends CreateFrame {
                public Answer() {
                    createFrame();
                }
                
                @Override
                public void createFrame() {
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

