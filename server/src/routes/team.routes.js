const express = require("express");
const router = express.Router();

const teamsController = require("../controllers/teams.controllers");
const { protectRoute } = require("../middleware/auth.middleware");

router.post("/", teamsController.addTeam);
router.get("/all", protectRoute, teamsController.getTeams);
router.get("/:teamId", teamsController.getTeam);
router.patch("/:teamId", teamsController.updateTeam);
router.delete("/:teamId", teamsController.deleteTeam);

module.exports = router;
