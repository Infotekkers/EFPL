const express = require("express");
const router = express.Router();

const playersController = require("../controllers/players.controllers");
const { protectRoute } = require("../middleware/auth.middleware");

router.post("/addplayer", protectRoute, playersController.addPlayer);
router.get("/getplayers", protectRoute, playersController.getPlayers);
router.get("/getplayer/:playerId", protectRoute, playersController.getPlayer);
router.patch(
  "/updateplayer/:playerId",
  protectRoute,
  playersController.updatePlayer
);
router.delete(
  "/deleteplayer/:playerId",
  protectRoute,
  playersController.deletePlayer
);
router.patch(
  "/updatescore/:playerId/:gameweekId",
  protectRoute,
  playersController.updateScore
);
router.patch("/addscore/:playerId", protectRoute, playersController.addScore);
router.get(
  "/getplayers/homeTeam/:homeTeamId/awayTeam/:awayTeamId",
  playersController.getHomeAndAwayPlayers
);

// New
router.get("/position/:position", playersController.getPlayersByPosition);
router.get("/suggested-price/:playerName", playersController.getSuggestedPrice);
module.exports = router;
