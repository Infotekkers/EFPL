const express = require("express");
const router = express.Router();

const customLeagueController = require("../controllers/customLeague.controllers");

router.get("/", customLeagueController.getAllCustomLeagues);

router.post("/create", customLeagueController.createCustomLeague);
router.post("/join", customLeagueController.joinCustomLeague);
router.post("/leave", customLeagueController.leaveCustomLeague);

router.delete("/delete", customLeagueController.deleteCustomLeague);
router.delete("/reset", customLeagueController.clearAllCustomLeagues);

module.exports = router;
