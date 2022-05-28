const express = require("express");
const eplStatsController = require("../controllers/eplStats.controllers");
const router = express.Router();

router.get("/overview", eplStatsController.overview);
router.get("/goals", eplStatsController.goals);
router.get("/assists", eplStatsController.assists);
router.get("/cleanSheets", eplStatsController.cleanSheets);
router.get("/reds", eplStatsController.reds);
router.get("/yellows", eplStatsController.yellows);
router.get("/saves", eplStatsController.saves);
router.get("/minutesPlayed", eplStatsController.minutesPlayed);

router.get("/topPlayers", eplStatsController.getTopPlayersForEachStat);

module.exports = router;
