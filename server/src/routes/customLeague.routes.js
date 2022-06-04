const express = require("express");
const router = express.Router();

const customLeagueController = require("../controllers/customLeague.controllers");

router.get("/:customLeagueId", customLeagueController.getCustomLeagueInfo);
router.get("/user/:userId", customLeagueController.getUserCustomLeagues);

router.post("/create", customLeagueController.createCustomLeague);
router.delete("/delete", customLeagueController.deleteCustomLeague);
router.post("/remove", customLeagueController.removePlayerFromCustomLeague);

router.post("/join", customLeagueController.joinCustomLeague);
router.post("/leave", customLeagueController.leaveCustomLeague);

router.delete("/reset", customLeagueController.clearAllCustomLeagues);

module.exports = router;
