const express = require("express");
const router = express.Router();

const teamsController = require("../controllers/teams.controllers");

router.post("/", teamsController.addTeam);
router.get("/all", teamsController.getTeams);
router.get("/:teamId", teamsController.getTeam);
router.patch("/:teamId", teamsController.updateTeam);
router.delete("/:teamId", teamsController.deleteTeam);

module.exports = router;
