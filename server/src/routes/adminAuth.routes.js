const express = require("express");
const adminAuthController = require("../controllers/adminAuth.controller");
const router = express.Router();

router.post("/login", adminAuthController.login);
router.post("/requestReset", adminAuthController.requestReset);
router.post("/resetPass/:token", adminAuthController.resetPass);
router.post("/validateAdmin", adminAuthController.validateAdmin);
router.post("/sendEmail" ,adminAuthController.sendEmail);
router.post("/changePass", adminAuthController.changePass);

module.exports = router;
