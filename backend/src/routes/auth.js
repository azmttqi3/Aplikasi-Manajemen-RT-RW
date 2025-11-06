import express from "express";
import { registerRW, registerRT, registerWarga, login } from "../controllers/authController.js";
const router = express.Router();

router.post("/register-rw", registerRW);
router.post("/register-rt", registerRT);
router.post("/register-warga", registerWarga);
router.post("/login", login);

export default router;
