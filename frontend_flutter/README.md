## 📱 **README Frontend (Flutter)**
**📄 File:** `frontend/README.md`

```markdown
# 📱 Frontend - Flutter RT/RW Management App

Aplikasi mobile ini digunakan oleh **RT dan RW** untuk mengelola data warga secara digital, terhubung langsung dengan backend Node.js.

---

## 🚀 Persiapan

### 1️⃣ Pastikan sudah terinstal:
- [Flutter SDK](https://flutter.dev/docs/get-started/install)
- [Android Studio](https://developer.android.com/studio)
- [VS Code](https://code.visualstudio.com/) (opsional)
- [Docker Desktop](https://www.docker.com/products/docker-desktop) (untuk backend)

---

## ⚙️ Setup Project

Masuk ke folder frontend:
```bash
cd frontend
flutter pub get
🌐 Koneksi ke Backend
Pastikan backend berjalan di http://localhost:5000.
Jika kamu menggunakan Android emulator, ganti base URL di:

bash
Copy code
lib/services/api_service.dart
Contoh:

dart
Copy code
static const String baseUrl = "http://10.0.2.2:5000/api"; // untuk Android emulator
// static const String baseUrl = "http://localhost:5000/api"; // untuk web atau desktop
▶️ Menjalankan Aplikasi
bash
Copy code
flutter run
Pilih device:

Windows untuk desktop

Chrome untuk web

emulator untuk Android

🧭 Struktur Folder
bash
Copy code
frontend/
│
├── lib/
│   ├── main.dart                # Entry point aplikasi
│   ├── screens/                 # Halaman (login, dashboard, dll)
│   ├── services/                # Koneksi API
│   └── widgets/                 # Komponen UI reusable
│
├── pubspec.yaml                 # Dependency Flutter
└── README.md                    # Dokumentasi frontend
📊 Fitur yang Sudah Tersedia
✅ Login RT/RW
✅ Dashboard RW (statistik warga, jumlah RT, status verifikasi)
✅ Integrasi API backend
✅ Tampilan sederhana & mudah dikembangkan

💡 Catatan
Untuk menjalankan backend, baca ../backend/README.md

Pastikan token login sudah digunakan pada setiap request API yang membutuhkan autentikasi.

🛠️ Dikembangkan menggunakan Flutter 3.x — dengan semangat digitalisasi data RT/RW!

# frontend_flutter

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- Lab: Write your first Flutter app] (https://docs.flutter.dev/get-started/codelab)
- Cookbook: Useful Flutter samples] (https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.
