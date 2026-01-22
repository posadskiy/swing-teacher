#!/bin/bash

# Build script for macOS (Intel and ARM)
# Usage: ./build-mac.sh [x64|aarch64]

set -e

ARCH="${1:-$(uname -m)}"
PROFILE="mac-x64"

if [ "$ARCH" = "arm64" ] || [ "$ARCH" = "aarch64" ]; then
    PROFILE="mac-aarch64"
    echo "Building for macOS ARM (Apple Silicon)..."
else
    echo "Building for macOS Intel (x86_64)..."
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

# Navigate to project root
cd "$(dirname "$0")/.."

echo "Building application..."
mvn clean package -pl desktop-client -am

echo "Creating macOS installer (.dmg) and portable app image..."
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
ICON_FILE="src/main/resources/icons/app-icon.icns"

# Build jpackage command (DMG)
JPACKAGE_CMD="jpackage --input target --name 'Java Swing Tutor' --main-jar $JAR_NAME --main-class com.posadskiy.javaswingteacher.Start --type dmg --dest target/jpackage --app-version $APP_VERSION --vendor Posadskiy --java-options '-Dfile.encoding=UTF-8' --mac-package-identifier com.posadskiy.javaswingtutor --mac-package-name 'Java Swing Tutor'"

# Add icon if it exists
if [ -f "$ICON_FILE" ]; then
    JPACKAGE_CMD="$JPACKAGE_CMD --icon $ICON_FILE"
fi

# Execute jpackage (DMG)
eval $JPACKAGE_CMD

# Build app image (portable, includes runtime)
APP_IMAGE_CMD="jpackage --input target --name 'Java Swing Tutor' --main-jar $JAR_NAME --main-class com.posadskiy.javaswingteacher.Start --type app-image --dest target/jpackage --app-version $APP_VERSION --vendor Posadskiy --java-options '-Dfile.encoding=UTF-8' --mac-package-identifier com.posadskiy.javaswingtutor --mac-package-name 'Java Swing Tutor'"
if [ -f "$ICON_FILE" ]; then
    APP_IMAGE_CMD="$APP_IMAGE_CMD --icon $ICON_FILE"
fi
eval $APP_IMAGE_CMD

# Zip app image for distribution
APP_BUNDLE_PATH="target/jpackage/Java Swing Tutor.app"
APP_ZIP_NAME="target/jpackage/JavaSwingTutor-macos-app-image-${APP_VERSION}.zip"
if [ -d "$APP_BUNDLE_PATH" ]; then
    ditto -c -k --sequesterRsrc --keepParent "$APP_BUNDLE_PATH" "$APP_ZIP_NAME"
fi

echo ""
echo "✅ Build complete!"
echo "📦 Installer location: desktop-client/target/jpackage/Java Swing Tutor-${APP_VERSION}.dmg"
echo "📦 Portable app image: desktop-client/target/jpackage/JavaSwingTutor-macos-app-image-${APP_VERSION}.zip"
echo ""
echo "To install:"
echo "  1. Open the .dmg file"
echo "  2. Drag 'Java Swing Tutor' to the Applications folder"
echo "  3. The app will appear in Launchpad automatically"
