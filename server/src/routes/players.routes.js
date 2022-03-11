const express = require("express");
const router = express.Router();

const playersController = require("../controllers/players.controllers");

router.post("/add", playersController.addplayers);
router.get("/getplayers", playersController.getplayers);
router.get("/getplayer/:playerId", playersController.getplayer);
router.patch("/updateplayer/:playerId", playersController.updateplayer);
module.exports = router;
