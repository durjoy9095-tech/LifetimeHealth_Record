# Lifetime Health Record — Admin + Notice Photo Android Project

This Android Studio project wraps the latest Lifetime Health Record web app.

Included:
- Login + Registration
- Forgot password option directly below Login
- Admin / Super Admin notice system
- App-wide notices
- Notice photo upload
- Patient/medical record features from the supplied HTML
- Android image picker support

Important:
The current web app stores accounts, passwords, notices, and records in localStorage. The Android wrapper does not turn this into a secure medical database or synchronize accounts between phones. For a real healthcare deployment, use authenticated server-side storage, encryption, access control, audit logs, and a secure password-recovery flow with server verification/SMS or email OTP.

Build:
1. Open this folder in Android Studio.
2. Allow Gradle Sync. Use the Android Studio bundled JDK (JDK 17 is recommended for AGP 8.5.2).
3. Build > Build Bundle(s) / APK(s) > Build APK(s).
4. The debug APK will normally be at app/build/outputs/apk/debug/app-debug.apk.
