const express = require("express");
const router = express.Router();

const playersController = require("../controllers/players.controllers");

router.post("/add", playersController.addplayers);


module.exports = router;
