const express = require("express");
const adminAuthController = require("../controllers/adminAuth.controller");
const router = express.Router();

router.post("/login", adminAuthController.login);
router.get("/getAdmins", adminAuthController.getAdmins);

module.exports = router;