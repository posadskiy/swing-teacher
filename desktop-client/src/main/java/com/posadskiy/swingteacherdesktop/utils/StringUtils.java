package com.posadskiy.swingteacherdesktop.utils;

import org.apache.commons.codec.digest.DigestUtils;

public class StringUtils {

    public static String removeSpace(String s) {
        if (s == null)
            return null;
        char[] buf = new char[1024];
        int length = s.length();
        char[] oldChars = (length < 1024) ? buf : new char[length];
        s.getChars(0, length, oldChars, 0);
        int newLen = 0;
        for (int j = 0; j < length; j++) {
            char ch = oldChars[j];
            if (ch > ' ') {
                oldChars[newLen] = ch;
                newLen++;
            }
        }
        if (newLen != length)
            s = new String(oldChars, 0, newLen);

        return s;

    }

    public static String md5Apache(String st) {
        String md5Hex = DigestUtils.md5Hex(st);

        return md5Hex;
    }

}
