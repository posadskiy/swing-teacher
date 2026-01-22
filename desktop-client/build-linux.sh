#!/bin/bash

# Build script for Linux
# Usage: ./build-linux.sh [deb|appimage|all]

set -e

PACKAGE_TYPE="${1:-all}"
PROFILE="linux"

if [ "$PACKAGE_TYPE" = "appimage" ]; then
    PROFILE="linux-appimage"
    echo "Building Linux portable app image..."
elif [ "$PACKAGE_TYPE" = "all" ]; then
    echo "Building Linux .deb and portable app image..."
else
    echo "Building Linux .deb package..."
fi

# Check if Java is available
if ! command -v java &> /dev/null; then
    echo "Error: Java is not installed or not in PATH"
    echo "Please install JDK 25 (project uses release 25)"
    exit 1
fi

# Check Java version (jpackage requires JDK 14+)
JAVA_VERSION=$(java -version 2>&1 | head -n 1 | cut -d'"' -f2 | sed '/^1\./s///' | cut -d'.' -f1)
if [ "$JAVA_VERSION" -lt 14 ]; then
    echo "Error: Java 14 or later is required for jpackage"
    echo "Current version: $JAVA_VERSION"
    exit 1
fi

# Check for required Linux packages
if [ "$PACKAGE_TYPE" = "deb" ]; then
    if ! command -v dpkg-deb &> /dev/null; then
        echo "Warning: dpkg-deb not found. Install with: sudo apt-get install dpkg-dev"
    fi
fi

# Navigate to project root
cd "$(dirname "$0")/.."

echo "Building application..."
mvn clean package -pl desktop-client -am

echo "Creating Linux package..."
cd desktop-client

# Get version from Maven and convert to jpackage-compatible format (remove -SNAPSHOT, ensure numeric)
MAVEN_VERSION=$(mvn help:evaluate -Dexpression=project.version -q -DforceStdout)
APP_VERSION=$(echo "$MAVEN_VERSION" | sed 's/-SNAPSHOT//' | sed 's/-.*//')
# Ensure version has at least one dot (jpackage requirement)
if [[ ! "$APP_VERSION" =~ \. ]]; then
    APP_VERSION="${APP_VERSION}.0"
fi

# Get the JAR file name
JAR_NAME=$(basename target/desktop-client-*.jar)
ICON_FILE="src/main/resources/icons/app-icon.png"

# Build commands
DEB_CMD="jpackage --input target --name 'Java Swing Tutor' --main-jar $JAR_NAME --main-class com.posadskiy.javaswingteacher.Start --type deb --dest target/jpackage --app-version $APP_VERSION --vendor Posadskiy --java-options '-Dfile.encoding=UTF-8' --linux-menu-group Education --linux-shortcut --linux-package-name javaswingtutor"
APP_IMAGE_CMD="jpackage --input target --name 'Java Swing Tutor' --main-jar $JAR_NAME --main-class com.posadskiy.javaswingteacher.Start --type app-image --dest target/jpackage --app-version $APP_VERSION --vendor Posadskiy --java-options '-Dfile.encoding=UTF-8'"

if [ -f "$ICON_FILE" ]; then
    DEB_CMD="$DEB_CMD --icon $ICON_FILE"
    APP_IMAGE_CMD="$APP_IMAGE_CMD --icon $ICON_FILE"
fi

# Execute jpackage
if [ "$PACKAGE_TYPE" = "deb" ]; then
    eval $DEB_CMD
elif [ "$PACKAGE_TYPE" = "appimage" ]; then
    eval $APP_IMAGE_CMD
else
    eval $DEB_CMD
    eval $APP_IMAGE_CMD
fi

# Zip app image for distribution
APP_IMAGE_DIR="target/jpackage/Java Swing Tutor"
APP_ZIP_NAME="target/jpackage/JavaSwingTutor-linux-app-image-${APP_VERSION}.zip"
if [ -d "$APP_IMAGE_DIR" ]; then
    (cd target/jpackage && zip -r "$(basename "$APP_ZIP_NAME")" "Java Swing Tutor" >/dev/null)
fi

echo ""
echo "✅ Build complete!"

if [ "$PACKAGE_TYPE" != "appimage" ]; then
    echo "📦 Package location: desktop-client/target/jpackage/javaswingtutor_${APP_VERSION}-1_amd64.deb"
    echo ""
    echo "To install:"
    echo "  sudo dpkg -i target/jpackage/javaswingtutor_${APP_VERSION}-1_amd64.deb"
    echo "  sudo apt-get install -f  # Install dependencies if needed"
fi

if [ "$PACKAGE_TYPE" != "deb" ]; then
    echo "📦 Portable app image: desktop-client/target/jpackage/JavaSwingTutor-linux-app-image-${APP_VERSION}.zip"
    echo ""
    echo "To use:"
    echo "  unzip 'target/jpackage/JavaSwingTutor-linux-app-image-${APP_VERSION}.zip'"
    echo "  ./'Java Swing Tutor'/bin/'Java Swing Tutor'"
fi
