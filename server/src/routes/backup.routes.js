const express = require("express");
const backupController = require("../controllers/backup.controller");
const router = express.Router();
router.get("/verify", backupController.verifySeasonStatus);
router.get("/data/:type", backupController.backup);
router.post("/restore/", backupController.restore);
router.get("/teams/all", backupController.viewTeam);
router.get("/players/:teamId", backupController.viewPlayer);

module.exports = router;
