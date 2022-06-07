const express = require("express");
const router = express.Router();

const fixtureController = require("../controllers/fixture.controllers");
const { protectRoute } = require("../middleware/auth.middleware");

router.post("/add", protectRoute, fixtureController.postFixture);

router.patch("/update/lineup/:matchId", fixtureController.updateLineup);
router.patch("/update/stats/:matchId", fixtureController.updateStats);
// router.patch("/update/score/:matchId", fixtureController.updateScore);
router.patch("/start/:matchId", protectRoute, fixtureController.startFixture);
router.patch("/pause/:matchId", protectRoute, fixtureController.pauseFixture);
router.patch("/resume/:matchId", protectRoute, fixtureController.resumeFixture);
router.patch("/end/:matchId", protectRoute, fixtureController.endFixture);
router.patch(
  "/postpone/:matchId",
  protectRoute,
  fixtureController.updateFixture
);
router.patch("/update/:matchId", protectRoute, fixtureController.updateFixture);

router.get("/", fixtureController.getAllFixtures);
router.get("/:matchId", protectRoute, fixtureController.getFixture);

router.get("/gw/:gameWeekId", fixtureController.getAllFixturesOfGameWeek);

router.delete(
  "/delete/:matchId",
  protectRoute,
  fixtureController.deleteFixture
);

router.get("/gw/:gameWeekId/:lang", fixtureController.getAllFixturesOfGameWeek);

router.get("/gw/detail/:matchId", fixtureController.getFixtureDetail);

router.get("/gwf/check/activeGw", fixtureController.getActiveGameWeek);

module.exports = router;
