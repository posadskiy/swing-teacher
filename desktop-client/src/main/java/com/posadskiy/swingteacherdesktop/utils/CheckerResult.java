package com.posadskiy.swingteacherdesktop.utils;

/**
 *
 * @author DPosadsky
 */
public class CheckerResult {

    private String className;
    private int errorCode;

    public CheckerResult() {
        className = null;
        errorCode = 0;
    }

    public CheckerResult(String className, int errorCode) {
        this.className = className;
        this.errorCode = errorCode;
    }

    public String getClassName() {
        return className;
    }

    public void setClassName(String className) {
        this.className = className;
    }

    public int getErrorCode() {
        return errorCode;
    }

    public void setErrorCode(int errorCode) {
        this.errorCode = errorCode;
    }


}
