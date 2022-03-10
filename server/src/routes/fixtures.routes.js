const express = require("express");
const router = express.Router();

const fixtureController = require("../controllers/fixture.controllers");

router.post("/add-fixture", fixtureController.postFixture);

module.exports = router;
