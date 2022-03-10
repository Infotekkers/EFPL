const express = require("express");
const router = express.Router();

const fixtureController = require("../controllers/fixture.controllers");

router.post("/add-fixture", fixtureController.postFixture);
router.patch("/start-fixture/:matchId", fixtureController.startFixture);
router.patch("/pause-fixture/:matchId", fixtureController.pauseFixture);
router.patch("/resume-fixture/:matchId", fixtureController.resumeFixture);
router.patch("/end-fixture/:matchId", fixtureController.endFixture);

module.exports = router;
