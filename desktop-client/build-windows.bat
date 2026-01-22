@echo off
REM Build script for Windows
REM Usage: build-windows.bat

setlocal enabledelayedexpansion

echo Building for Windows...

REM Check if Java is available
where java >nul 2>&1
if %ERRORLEVEL% NEQ 0 (
    echo Error: Java is not installed or not in PATH
    echo Please install JDK 25 (project uses release 25)
    exit /b 1
)

REM Navigate to project root
cd /d "%~dp0\.."

echo Building application...
call mvn clean package -pl desktop-client -am

echo Creating Windows installer (.exe) and portable app image...
cd desktop-client

REM Get version from Maven and convert to jpackage-compatible format
for /f "tokens=*" %%i in ('mvn help:evaluate -Dexpression=project.version -q -DforceStdout') do set MAVEN_VERSION=%%i
set APP_VERSION=%MAVEN_VERSION:-SNAPSHOT=%
set APP_VERSION=%APP_VERSION:-*=%
REM Ensure version has at least one dot
echo %APP_VERSION% | findstr /r "\." >nul
if errorlevel 1 (
    set APP_VERSION=%APP_VERSION%.0
)

REM Get the JAR file name (first JAR found in target)
for %%f in (target\desktop-client-*.jar) do set JAR_NAME=%%~nxf & goto :found
:found
set ICON_FILE=src\main\resources\icons\app-icon.ico

REM Build jpackage command (EXE)
set JPACKAGE_CMD=jpackage --input target --name "Java Swing Tutor" --main-jar %JAR_NAME% --main-class com.posadskiy.javaswingteacher.Start --type exe --dest target\jpkg --temp target\jptmp --app-version %APP_VERSION% --vendor Posadskiy --java-options "-Dfile.encoding=UTF-8" --win-dir-chooser --win-menu --win-menu-group JavaSwingTutor --win-shortcut

REM Add icon if it exists
if exist "%ICON_FILE%" (
    set JPACKAGE_CMD=%JPACKAGE_CMD% --icon %ICON_FILE%
)

REM Execute jpackage (EXE)
%JPACKAGE_CMD%

REM Build app image (portable, includes runtime)
set APP_IMAGE_CMD=jpackage --input target --name "Java Swing Tutor" --main-jar %JAR_NAME% --main-class com.posadskiy.javaswingteacher.Start --type app-image --dest target\jpkg --temp target\jptmp --app-version %APP_VERSION% --vendor Posadskiy --java-options "-Dfile.encoding=UTF-8"
if exist "%ICON_FILE%" (
    set APP_IMAGE_CMD=%APP_IMAGE_CMD% --icon %ICON_FILE%
)
%APP_IMAGE_CMD%

REM Zip app image for distribution
powershell -NoProfile -Command "if (Test-Path 'target\\jpkg\\Java Swing Tutor') { Compress-Archive -Path 'target\\jpkg\\Java Swing Tutor' -DestinationPath ('target\\jpkg\\JavaSwingTutor-windows-app-image-' + $env:APP_VERSION + '.zip') -Force }"

echo.
echo ✅ Build complete!
echo 📦 Installer location: desktop-client\target\jpkg\Java Swing Tutor-%APP_VERSION%.exe
echo 📦 Portable app image: desktop-client\target\jpkg\JavaSwingTutor-windows-app-image-%APP_VERSION%.zip
echo.
echo To install:
echo   1. Run the .exe file
echo   2. Follow the installation wizard
echo   3. The application will be added to Start Menu and can be uninstalled via Control Panel

endlocal
