// src/controllers/authController.js
import bcrypt from "bcrypt";
import jwt from "jsonwebtoken";
import pool from "../config/db.js";
import dotenv from "dotenv";
dotenv.config();

// 🔹 Registrasi RW
export const registerRW = async (req, res) => {
  const { email, password } = req.body;
  try {
    const hashed = await bcrypt.hash(password, 10);

    const roleRes = await pool.query(
      "SELECT id_role FROM roles WHERE nama_role = 'RW'"
    );
    const id_role = roleRes.rows[0].id_role;

    const insertUser = await pool.query(
      "INSERT INTO pengguna (email, password_hash, id_role) VALUES ($1,$2,$3) RETURNING *",
      [email, hashed, id_role]
    );

    res.status(201).json({
      message: "Akun RW berhasil dibuat",
      user: insertUser.rows[0],
    });
  } catch (err) {
    console.error(err);
    res.status(500).json({ message: "Gagal registrasi RW" });
  }
};

// 🔹 Login Semua Role
export const login = async (req, res) => {
  const { email, password } = req.body;
  try {
    const userRes = await pool.query(
      "SELECT * FROM pengguna WHERE email = $1",
      [email]
    );

    const user = userRes.rows[0];
    if (!user) {
      return res.status(400).json({ message: "Email tidak ditemukan" });
    }

    const match = await bcrypt.compare(password, user.password_hash);
    if (!match) {
      return res.status(401).json({ message: "Password salah" });
    }

    const token = jwt.sign(
      {
        id_pengguna: user.id_pengguna,
        id_role: user.id_role,
      },
      process.env.JWT_SECRET,
      { expiresIn: "1d" }
    );

    res.status(200).json({
      message: "Login berhasil",
      token,
      user: {
        id_pengguna: user.id_pengguna,
        email: user.email,
        id_role: user.id_role,
      },
    });
  } catch (err) {
    console.error(err);
    res.status(500).json({ message: "Login gagal" });
  }
};

// 🔹 Registrasi RT
export const registerRT = async (req, res) => {
  const { email, password } = req.body;
  try {
    const hashed = await bcrypt.hash(password, 10);

    const roleRes = await pool.query(
      "SELECT id_role FROM roles WHERE nama_role = 'RT'"
    );
    const id_role = roleRes.rows[0].id_role;

    const insertUser = await pool.query(
      "INSERT INTO pengguna (email, password_hash, id_role) VALUES ($1,$2,$3) RETURNING *",
      [email, hashed, id_role]
    );

    res.status(201).json({
      message: "Akun RT berhasil dibuat",
      user: insertUser.rows[0],
    });
  } catch (err) {
    console.error(err);
    res.status(500).json({ message: "Gagal registrasi RT" });
  }
};

// 🔹 Registrasi Warga
export const registerWarga = async (req, res) => {
  const { email, password } = req.body;
  try {
    const hashed = await bcrypt.hash(password, 10);

    const roleRes = await pool.query(
      "SELECT id_role FROM roles WHERE nama_role = 'Warga'"
    );
    const id_role = roleRes.rows[0].id_role;

    const insertUser = await pool.query(
      "INSERT INTO pengguna (email, password_hash, id_role) VALUES ($1,$2,$3) RETURNING *",
      [email, hashed, id_role]
    );

    res.status(201).json({
      message: "Akun Warga berhasil dibuat",
      user: insertUser.rows[0],
    });
  } catch (err) {
    console.error(err);
    res.status(500).json({ message: "Gagal registrasi Warga" });
  }
};
