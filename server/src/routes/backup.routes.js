const express = require("express");
const backupController = require("../controllers/backup.controller");
const router = express.Router();
router.get("/backup/:id", backupController.backup);
router.get("/restore/:id", backupController.restore);

module.exports = router;
