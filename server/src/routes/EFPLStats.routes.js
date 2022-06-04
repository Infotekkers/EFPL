const express = require("express");
const EFPLStatsController = require("../controllers/EFPLStats.controller");
const router = express.Router();

router.get("/gw/:gwId", EFPLStatsController.getStats);
router.get("/update", EFPLStatsController.updateStats);

module.exports = router;
