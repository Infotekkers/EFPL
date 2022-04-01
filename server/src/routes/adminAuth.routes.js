const express = require("express");
const adminAuthController = require("../controllers/adminAuth.controller");
const router = express.Router();

router.post("/login", adminAuthController.login);


module.exports = router;