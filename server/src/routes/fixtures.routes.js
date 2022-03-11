const express = require("express");
const router = express.Router();

const fixtureController = require("../controllers/fixture.controllers");

router.post("/add", fixtureController.postFixture);

router.patch("/start/:matchId", fixtureController.startFixture);
router.patch("/pause/:matchId", fixtureController.pauseFixture);
router.patch("/resume/:matchId", fixtureController.resumeFixture);
router.patch("/end/:matchId", fixtureController.endFixture);
router.patch("/postpone/:matchId", fixtureController.postponeFixture);

router.get("/", fixtureController.getAllFixtures);
router.get("/:matchId", fixtureController.getFixture);

router.delete("/delete/:matchId", fixtureController.deleteFixture);

module.exports = router;
