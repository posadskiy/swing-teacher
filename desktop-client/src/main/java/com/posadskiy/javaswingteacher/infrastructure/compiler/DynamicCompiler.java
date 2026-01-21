package com.posadskiy.javaswingteacher.infrastructure.compiler;

import com.posadskiy.javaswingteacher.presentation.component.CreateFrame;
import lombok.extern.slf4j.Slf4j;

import javax.tools.Diagnostic;
import javax.tools.DiagnosticCollector;
import javax.tools.JavaFileObject;
import javax.tools.ToolProvider;
import java.awt.*;
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
        return compile(operators, imports, "Your frame", defaultOpenOnLeft());
    }

    /**
     * Compiles user code and returns compilation errors (empty string if success).
     * Allows customizing the frame title and placement side.
     */
    public static String compile(String operators, String imports, String frameTitle, boolean openOnLeft) throws IOException {
        // Clean up old files
        cleanupFiles(JAVA_FILE, CLASS_FILE);
        
        // Generate source code
        var sourceCode = generateSourceCode(operators, imports, frameTitle, openOnLeft);
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

    private static String generateSourceCode(String operators, String imports, String frameTitle, boolean openOnLeft) {
        var importsSection = Optional.ofNullable(imports).orElse("");
        var safeTitle = escapeJavaString(Optional.ofNullable(frameTitle).orElse("Your frame"));
        
        return """
            package com.posadskiy.javaswingtutor.presentation.component;
            import javax.swing.*;
            import java.awt.*;
            %s
            public class Answer extends CreateFrame {
                public Answer() {
                    createFrame();
                }
                
                @Override
                public void createFrame() {
                    String headerText = "%s";
            
                    JPanel content = new JPanel(new BorderLayout());
                    content.setBackground(new Color(15, 23, 42));
                    content.setBorder(BorderFactory.createEmptyBorder(12, 12, 12, 12));
            
                    JLabel header = new JLabel(headerText, SwingConstants.CENTER);
                    header.setFont(new Font(Font.SANS_SERIF, Font.BOLD, 16));
                    header.setForeground(new Color(248, 250, 252));
                    header.setBorder(BorderFactory.createEmptyBorder(10, 12, 10, 12));
                    content.add(header, BorderLayout.NORTH);
            
                    JPanel footer = new JPanel(new FlowLayout(FlowLayout.RIGHT));
                    footer.setOpaque(false);
                    JButton closeBtn = new JButton("Close");
                    closeBtn.addActionListener(e -> setVisible(false));
                    footer.add(closeBtn);
                    content.add(footer, BorderLayout.SOUTH);
            
                    setContentPane(content);
            
                    // User content goes into CENTER by default (BorderLayout.CENTER)
                    %s
            
                    setTitle(headerText);
                    setDefaultCloseOperation(JFrame.HIDE_ON_CLOSE);
                    applyHalfScreenBounds(%s);
                    setVisible(true);
                }
            
                private void applyHalfScreenBounds(boolean openOnLeft) {
                    GraphicsDevice device = GraphicsEnvironment.getLocalGraphicsEnvironment().getDefaultScreenDevice();
                    try {
                        PointerInfo pi = MouseInfo.getPointerInfo();
                        if (pi != null && pi.getDevice() != null) {
                            device = pi.getDevice();
                        }
                    } catch (Exception ignored) {}
            
                    GraphicsConfiguration gc = device.getDefaultConfiguration();
                    Rectangle bounds = gc.getBounds();
                    Insets insets = Toolkit.getDefaultToolkit().getScreenInsets(gc);
            
                    int usableX = bounds.x + insets.left;
                    int usableY = bounds.y + insets.top;
                    int usableW = bounds.width - insets.left - insets.right;
                    int usableH = bounds.height - insets.top - insets.bottom;
            
                    int halfW = usableW / 2;
                    int x = openOnLeft ? usableX : (usableX + halfW);
                    int w = openOnLeft ? halfW : (usableW - halfW);
            
                    setBounds(x, usableY, w, usableH);
                }
            }
            """.formatted(importsSection, safeTitle, operators, openOnLeft);
    }

    private static boolean defaultOpenOnLeft() {
        try {
            PointerInfo pi = MouseInfo.getPointerInfo();
            if (pi == null || pi.getDevice() == null) {
                return true;
            }
            GraphicsConfiguration gc = pi.getDevice().getDefaultConfiguration();
            Rectangle bounds = gc.getBounds();
            Point p = pi.getLocation();
            return p.x < (bounds.x + (bounds.width / 2));
        } catch (Exception ignored) {
            return true;
        }
    }

    private static String escapeJavaString(String s) {
        return s
            .replace("\\", "\\\\")
            .replace("\"", "\\\"")
            .replace("\r", "\\r")
            .replace("\n", "\\n");
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

