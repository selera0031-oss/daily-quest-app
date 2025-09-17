# Daily Quest App

Aplikasi sederhana untuk mengatur **Daily Quest** dengan sistem **EXP & Rank**.

## Cara Build
1. Clone repo ini
2. Jalankan:
   ```bash
   flutter pub get
   flutter build apk --release
   ```
3. Hasil APK ada di:
   ```
   build/app/outputs/flutter-apk/app-release.apk
   ```

## Otomatis Build via GitHub Actions
- Setiap kali push ke branch `main`, GitHub akan otomatis build APK.
- File APK bisa diunduh di tab **Releases**.
