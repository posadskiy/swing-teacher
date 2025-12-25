package com.posadskiy.swingteacherdesktop.utils;

import lombok.extern.slf4j.Slf4j;

import javax.tools.*;
import java.io.*;
import java.util.Arrays;


@Slf4j
public class FileUtils {

    public static void write(String fileName, String text) {
        //Определяем файл
        File file = new File(fileName);

        try {
            //проверяем, что если файл не существует то создаем его
            if (!file.exists()) {
                file.createNewFile();
            }

            //PrintWriter обеспечит возможности записи в файл
            PrintWriter out = new PrintWriter(file.getAbsoluteFile());

            try {
                //Записываем текст у файл
                out.print(text);
            } finally {
                //После чего мы должны закрыть файл
                //Иначе файл не запишется
                out.close();
            }
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }

    public static String read(String fileName) throws FileNotFoundException {
        //Этот спец. объект для построения строки
        StringBuilder sb = new StringBuilder();
        exists(fileName);

        File file = new File(fileName);

        try {
            //Объект для чтения файла в буфер
            BufferedReader in = new BufferedReader(new FileReader(file.getAbsoluteFile()));
            try {
                //В цикле построчно считываем файл
                String s;
                while ((s = in.readLine()) != null) {
                    sb.append(s);
                }
            } finally {
                //Также не забываем закрыть файл
                in.close();
            }
        } catch (IOException e) {
            throw new RuntimeException(e);
        }

        //Возвращаем полученный текст с файла
        return sb.toString();
    }

    private static void exists(String fileName) throws FileNotFoundException {
        File file = new File(fileName);
        if (!file.exists()) {
            throw new FileNotFoundException(file.getName());
        }
    }

    public static void runFile() throws InstantiationException, IllegalAccessException {
        String className = "Answer.class";
        if (new File(className).exists()) {
            MyClassLoader loader = new MyClassLoader();
            Class my = loader.getClassFromFile(new File(className));
            Object o = my.newInstance();
            CreateFrame cf = (CreateFrame) o;
            cf.createFrame();
        }
    }

    public static String isCompileFile(String operators, String imports) throws IOException, InstantiationException, IllegalAccessException {
        String fileName = "Answer.java";
        String className = "Answer.class";
        File[] f = new File[]{new File(fileName), new File(className)};
        for (File file : f)
            file.delete();

        BufferedWriter fos = new BufferedWriter(new FileWriter(fileName));
        fos.write("package com.posadskiy.swingteacherdesktop.utils;\n"
            + "import javax.swing.*;\n"
            + "import java.awt.Dimension;\n"
            + ((imports == null) ? "" : imports) + "\n"
            + "public class Answer extends CreateFrame {\n "
            + "public Answer() {\n"
            + "setTitle(\"Твой фрейм\");\n"
            + operators + "\n"
            + "setDefaultCloseOperation(JFrame.HIDE_ON_CLOSE);\n"
            + "setPreferredSize(new Dimension(700, 400));\n"
            + "pack();\n"
            + "setLocationRelativeTo(null);\n"
            + "setVisible(true);\n}}");
        fos.flush();
        fos.close();

        JavaCompiler javac = ToolProvider.getSystemJavaCompiler();
        StandardJavaFileManager fileManager = javac.getStandardFileManager(null, null, null);
        DiagnosticCollector<JavaFileObject> diagnostics = new DiagnosticCollector<JavaFileObject>();
        Iterable<? extends JavaFileObject> compilationUnits1 = fileManager.getJavaFileObjectsFromFiles(Arrays
            .asList(new File[]{new File(fileName)}));
        javac.getTask(null, fileManager, diagnostics, null, null, compilationUnits1).call();
        String problems = "";
        for (Diagnostic diagnostic : diagnostics.getDiagnostics())
            problems += diagnostic + "\n";
        fileManager.close();

        return problems;
    }

    static class MyClassLoader extends ClassLoader {

        public Class<?> getClassFromFile(File f) {
            byte[] raw = new byte[(int) f.length()];
            InputStream in = null;
            try {
                in = new FileInputStream(f);
                //noinspection ResultOfMethodCallIgnored
                in.read(raw);
            } catch (Exception e) {
                log.error("Failed to read class bytes from {}", f, e);
            }
            try {
                if (in != null)
                    in.close();
            } catch (IOException e) {
                log.warn("Failed to close stream for {}", f, e);
            }
            return defineClass(null, raw, 0, raw.length);
        }
    }

}
