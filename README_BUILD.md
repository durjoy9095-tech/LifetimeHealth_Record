# APK Build

This project has been prepared with a Gradle bootstrap wrapper and GitHub Actions workflow.

## GitHub Actions
1. Upload this project to a GitHub repository.
2. Open **Actions**.
3. Run **Build APK** (or push a commit).
4. Download the `app-debug-apk` artifact.

## Local build
- Linux/macOS: `./gradlew assembleDebug`
- Windows: `gradlew.bat assembleDebug`

The first build downloads Gradle 8.7 and required Android build dependencies.
