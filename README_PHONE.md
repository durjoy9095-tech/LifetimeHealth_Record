# Lifetime Health Record — Phone-only APK build

This project is prepared so the APK can be built from a phone using GitHub Actions (cloud build). No laptop/Android Studio is required for the build itself.

## Phone method
1. Create/sign in to a GitHub account in Chrome.
2. Create a new repository, e.g. `LifetimeHealthRecord`.
3. Upload the contents of this project ZIP to the repository. Keep `.github/workflows/build-apk.yml` in its exact folder.
4. Commit to the `main` branch.
5. Open the repository → **Actions** → **Build Lifetime Health Record APK**.
6. Start **Run workflow** if it did not start automatically.
7. Wait for the green check to finish.
8. Open the completed workflow run → **Artifacts** → download `LifetimeHealthRecord-debug-apk`.
9. Extract the artifact ZIP and install `app-debug.apk` on the phone.

## Important
- This is a debug APK for personal/testing use.
- The app's current patient/admin data system is localStorage-based and is NOT a secure medical database. Do not use real sensitive patient data until a secure server, authentication, encryption and access controls are added.
- The existing SMS/OTP-style backend features require a real server; GitHub Actions only builds the APK.
