const express = require("express");
const router = express.Router();

const playersController = require("../controllers/players.controllers");

router.post("/addplayer", playersController.addplayers);
router.get("/getplayers", playersController.getplayers);
router.get(
  "/getplayers/homeTeam/:homeTeamId/awayTeam/:awayTeamId",
  playersController.getHomeAndAwayPlayers
);
router.get("/getplayer/:playerId", playersController.getplayer);
router.patch("/updateplayer/:playerId", playersController.updateplayer);
router.delete("/deleteplayer/:playerId", playersController.deleteplayer);
router.patch(
  "/updatescore/:playerId/:gameweekId",
  playersController.updateScore
);
router.patch("/addscore/:playerId", playersController.addScore);
module.exports = router;
