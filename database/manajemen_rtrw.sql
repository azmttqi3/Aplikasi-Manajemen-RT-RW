-- manajemen_rtrw.sql
-- Database schema for Manajemen RT RW (DDL + minimal seed)

-- DROP DB / TABLES if needed (optional; uncomment to use)
-- DROP TABLE IF EXISTS pengguna CASCADE;
-- DROP TABLE IF EXISTS warga CASCADE;
-- DROP TABLE IF EXISTS wilayah_rt CASCADE;
-- DROP TABLE IF EXISTS wilayah_rw CASCADE;
-- DROP TABLE IF EXISTS roles CASCADE;

-- ===== Create roles table =====
CREATE TABLE IF NOT EXISTS roles (
  id_role SERIAL PRIMARY KEY,
  nama_role VARCHAR(50) NOT NULL UNIQUE
);

-- Seed roles
INSERT INTO roles (nama_role)
  VALUES ('RW'), ('RT'), ('Warga')
ON CONFLICT (nama_role) DO NOTHING;

-- ===== Create wilayah_rw (optional) =====
CREATE TABLE IF NOT EXISTS wilayah_rw (
  id_rw SERIAL PRIMARY KEY,
  nama_rw VARCHAR(100) NOT NULL
);

-- ===== Create wilayah_rt =====
CREATE TABLE IF NOT EXISTS wilayah_rt (
  id_rt SERIAL PRIMARY KEY,
  id_rw INTEGER NOT NULL REFERENCES wilayah_rw(id_rw) ON DELETE CASCADE,
  nama_rt VARCHAR(100) NOT NULL
);

-- ===== Create warga =====
CREATE TABLE IF NOT EXISTS warga (
  id_warga SERIAL PRIMARY KEY,
  nama_lengkap VARCHAR(100) NOT NULL,
  nik VARCHAR(20) NOT NULL UNIQUE,
  no_kk VARCHAR(20),
  id_rt INTEGER REFERENCES wilayah_rt(id_rt) ON DELETE SET NULL,
  status_verifikasi VARCHAR(20) DEFAULT 'pending'
);

-- ===== Create pengguna (users) =====
CREATE TABLE IF NOT EXISTS pengguna (
  id_pengguna SERIAL PRIMARY KEY,
  email VARCHAR(255) NOT NULL UNIQUE,
  password_hash VARCHAR(255) NOT NULL,
  id_role INTEGER NOT NULL REFERENCES roles(id_role) ON DELETE RESTRICT,
  id_warga INTEGER REFERENCES warga(id_warga) ON DELETE SET NULL
);

-- Indexes (optional but recommended)
CREATE INDEX IF NOT EXISTS idx_warga_nik ON warga (nik);
CREATE INDEX IF NOT EXISTS idx_pengguna_email ON pengguna (email);

-- Example seed data (optional)
INSERT INTO wilayah_rw (nama_rw) VALUES ('RW 01') ON CONFLICT DO NOTHING;
INSERT INTO wilayah_rt (id_rw, nama_rt) VALUES (1, 'RT 01') ON CONFLICT DO NOTHING;

-- End of file

