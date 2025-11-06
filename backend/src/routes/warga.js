    import express from "express";
    import {
    addWarga,
    getAllWarga,
    updateWarga,
    deleteWarga,
    getPendingWargaForRT,
    verifikasiWarga
    } from "../controllers/wargaController.js";
    import { verifyToken } from "../middleware/authMiddleware.js";
    import { ensureRoleRT } from "../middleware/roleMiddleware.js";
    import { getAllWargaByRW, getStatistikWargaByRW } from "../controllers/wargaController.js";
    import { ensureRoleRW } from "../middleware/roleMiddleware.js";
    import { getDashboardRW } from "../controllers/wargaController.js";

    const router = express.Router();

    // routes utama
    router.post("/", verifyToken, addWarga);
    router.get("/", verifyToken, getAllWarga);
    router.get("/pending", verifyToken, ensureRoleRT, getPendingWargaForRT);
    router.put("/verifikasi", verifyToken, ensureRoleRT, verifikasiWarga);
    router.put("/:id", verifyToken, updateWarga);
    router.delete("/:id", verifyToken, deleteWarga);
    router.get("/rw/warga", verifyToken, ensureRoleRW, getAllWargaByRW);
    router.get("/rw/statistik", verifyToken, ensureRoleRW, getStatistikWargaByRW);
    router.get("/rw/dashboard", verifyToken, ensureRoleRW, getDashboardRW);

    export default router;
