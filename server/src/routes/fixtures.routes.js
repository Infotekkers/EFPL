const express = require("express");
const router = express.Router();

const fixtureController = require("../controllers/fixture.controllers");
const { protectRoute } = require("../middleware/auth.middleware");

router.post("/add", protectRoute, fixtureController.postFixture);

router.patch("/start/:matchId", protectRoute, fixtureController.startFixture);
router.patch("/pause/:matchId", protectRoute, fixtureController.pauseFixture);
router.patch("/resume/:matchId", protectRoute, fixtureController.resumeFixture);
router.patch("/end/:matchId", protectRoute, fixtureController.endFixture);
router.patch(
  "/postpone/:matchId",
  protectRoute,
  fixtureController.postponeFixture
);
router.patch("/update/:matchId", protectRoute, fixtureController.updateFixture);

router.get("/", protectRoute, fixtureController.getAllFixtures);
router.get("/:matchId", protectRoute, fixtureController.getFixture);

router.delete(
  "/delete/:matchId",
  protectRoute,
  fixtureController.deleteFixture
);

module.exports = router;
