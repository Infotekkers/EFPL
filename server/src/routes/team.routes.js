const express = require("express");
const router = express.Router();

const teamsController = require("../controllers/teams.controllers");

router.post("/add", teamsController.addteam);
router.get("/getteams", teamsController.getteams);
router.get("/getteam/:teamId", teamsController.getteam);
router.patch("/updateteam/:teamId", teamsController.updateteam);
//router.delete("/deleteteam/:teamId", teamsController.deleteteam);

module.exports = router;
