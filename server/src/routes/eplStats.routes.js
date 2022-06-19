const express = require("express");
const eplStatsController = require("../controllers/eplStats.controllers");
const router = express.Router();

router.get("/overview", eplStatsController.overview);
router.get("/topPlayers", eplStatsController.getTopPlayersForEachStat);

module.exports = router;
