# 🏘️ Aplikasi Manajemen RT/RW

Proyek ini merupakan sistem manajemen data warga berbasis **digital**, yang terdiri dari:
- **Backend (API Server)** → Node.js + Express + PostgreSQL (bisa dijalankan dengan Docker)
- **Frontend (Mobile App)** → Flutter
- **Database** → PostgreSQL

---

## 🚀 Arsitektur Project

project-manajemen-RT-RW/
│
├── backend/ # Backend Node.js + Express
│ ├── src/
│ ├── package.json
│ ├── Dockerfile
│ └── .env
│
├── frontend/ # Aplikasi Flutter
│ ├── lib/
│ ├── pubspec.yaml
│ └── README.md
│
├── docker-compose.yml # Jalankan backend & database via Docker
└── README.md # Dokumentasi utama (file ini)

yaml
Copy code

---

## ⚙️ Cara Menjalankan Project

### 🔹 1. Clone Repository
```bash
git clone https://github.com/<username>/<nama-repo>.git
cd project-manajemen-RT-RW
🔹 2. Jalankan Backend (API) menggunakan Docker
Pastikan sudah menginstal Docker Desktop

bash
Copy code
docker compose up --build
Backend akan berjalan di:

arduino
Copy code
http://localhost:5000
Database PostgreSQL dapat diakses di port 5432
dan file konfigurasi disimpan di .env.

Untuk informasi lengkap, lihat dokumentasi backend di:
👉 backend/README.md

🔹 3. Jalankan Frontend (Flutter)
Masuk ke folder frontend:

bash
Copy code
cd frontend
flutter pub get
flutter run
Pastikan backend sedang berjalan (agar API bisa diakses dari Flutter).

Untuk detail cara konfigurasi dan koneksi API Flutter ke backend, lihat:
👉 frontend/README.md

👥 Tim Pengembang
Azmi Ittaqi Hammami – Fullstack Developer

Tim RT/RW App – Pengembangan fitur lanjutan

🧱 Teknologi yang Digunakan
Komponen	: Teknologi
Backend	    : Node.js, Express, PostgreSQL
Frontend	: Flutter
Container	: Docker, Docker Compose
Database    : Tool	: pgAdmin

📦 Catatan Penggunaan
Pastikan .env sudah berisi konfigurasi database dan JWT secret key.

Jalankan docker compose down untuk mematikan container setelah selesai.

Untuk testing API, gunakan Postman dengan endpoint http://localhost:5000/api/....

✨ Dibuat dengan semangat gotong royong oleh tim Manajemen RT/RW.

yaml
Copy code

---
