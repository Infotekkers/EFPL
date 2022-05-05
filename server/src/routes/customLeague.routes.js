const express = require("express");
const router = express.Router();

const customLeagueController = require("../controllers/customLeague.controllers");

router.get("/", customLeagueController.getAllCustomLeagues);
router.post("/create", customLeagueController.createCustomLeague);

router.delete("/clear", customLeagueController.clear);

module.exports = router;
