const express = require("express");
const backupController = require("../controllers/backup.controller");
const router = express.Router();
router.get("/", backupController.backup);
router.post("/restore/", backupController.restore);
router.get("/teams/all", backupController.viewTeam);
router.get("/players/:teamId", backupController.viewPlayer);

module.exports = router;
