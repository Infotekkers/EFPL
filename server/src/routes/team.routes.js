const express = require("express");
const router = express.Router();

const teamsController = require("../controllers/teams.controllers");
const { protectRoute } = require("../middleware/auth.middleware");

router.post("/", protectRoute, teamsController.addTeam);
router.get("/all", protectRoute, teamsController.getTeams);
router.get("/:teamId", protectRoute, teamsController.getTeam);
router.patch("/:teamId", protectRoute, teamsController.updateTeam);
router.delete("/:teamId", protectRoute, teamsController.deleteTeam);

module.exports = router;
