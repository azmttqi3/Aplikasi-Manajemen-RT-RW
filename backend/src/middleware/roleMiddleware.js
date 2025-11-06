// src/middleware/roleMiddleware.js
import pool from "../config/db.js";

// Pastikan user adalah RT
export const ensureRoleRT = async (req, res, next) => {
  try {
    const userId = req.user?.id_pengguna;
    if (!userId) return res.status(401).json({ message: "Token tidak valid" });

    // Ambil role user dari DB
    const q = `SELECT r.nama_role
               FROM pengguna p
               JOIN roles r ON p.id_role = r.id_role
               WHERE p.id_pengguna = $1`;
    const r = await pool.query(q, [userId]);
    const roleName = r.rows[0]?.nama_role;

    if (!roleName || roleName.toLowerCase() !== "rt") {
      return res.status(403).json({ message: "Akses ditolak: hanya RT" });
    }

    next();
  } catch (err) {
    console.error(err);
    res.status(500).json({ message: "Gagal memeriksa peran user" });
  }
};

// Pastikan user adalah RW
export const ensureRoleRW = async (req, res, next) => {
  try {
    const userId = req.user?.id_pengguna;
    if (!userId) return res.status(401).json({ message: "Token tidak valid" });

    // Ambil role user dari DB
    const q = `SELECT r.nama_role
               FROM pengguna p
               JOIN roles r ON p.id_role = r.id_role
               WHERE p.id_pengguna = $1`;
    const r = await pool.query(q, [userId]);
    const roleName = r.rows[0]?.nama_role;

    if (!roleName || roleName.toLowerCase() !== "rw") {
      return res.status(403).json({ message: "Akses ditolak: hanya RW" });
    }

    next();
  } catch (err) {
    console.error(err);
    res.status(500).json({ message: "Gagal memeriksa peran user (RW)" });
  }
};
