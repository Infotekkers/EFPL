// Import Router
const express = require("express");
const router = express.Router();

// development features
const development = require("../utils/development");

// Import Controller
const gameWeekController = require("../controllers/gameWeek.controller");

/*
    ========================================
    Define Routes
    ========================================
*/

// Get Information about GameWeek - By Id
router.get("/info/id/:Id", gameWeekController.getGameWeek);

// Get Information about all game weeks
router.get("/info/all", gameWeekController.getAllGameWeeks);

// Update Game Week Status by ID
router.patch("/update/status/id/:Id", gameWeekController.updateGameWeekStatus);

// Update Game Week Deadline by ID
router.patch(
  "/update/deadline/id/:Id",
  gameWeekController.updateGameWeekDeadline
);

// DEVELOPMENT ROUTE
router.post("/dev/add", development.devAddGameWeekRoute);
router.delete("/dev/remove/all", development.devClearGameWeekRoute);

// export router
module.exports = router;
