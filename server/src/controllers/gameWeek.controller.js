const asyncHandler = require("express-async-handler");

// Import Model
const GameWeek = require("../models/GameWeek");

// Get game week status by ID
const getGameWeek = asyncHandler(async (req, res) => {
  // get required game week ID from URL Params
  const gameWeekId = req.params.Id;

  // find the game week
  const gameWeek = await GameWeek.findById(gameWeekId);

  gameWeek
    ? res.status(200).json(gameWeek)
    : res.status(404).json({
        message: "Game week not found",
        status: 404,
      });

  // send response
});

// Get all game weeks
const getAllGameWeeks = asyncHandler(async (req, res) => {
  // Fetch all game weeks
  const allGameWeeks = await GameWeek.find();

  // send response - all game weeks
  res.status(200).json(allGameWeeks);
});

// update status
const updateGameWeekStatus = asyncHandler(async (req, res, next) => {
  // get id from URL Params
  const gameWeekId = req.params.Id;

  // get update data from body
  const { updateInfo } = req.body;

  //   Check update status value
  const updated = await GameWeek.findByIdAndUpdate(
    gameWeekId,
    {
      status: updateInfo.status,
    },
    { runValidators: true }
  );

  if (updated) {
    //   get updated info
    const updatedGameWeek = await GameWeek.findById(gameWeekId);

    // send response - with updated info
    res.status(200).json(updatedGameWeek);
  } else {
    res.status(404).json({
      message: "Game week not found",
      status: 404,
    });
  }
});

// update deadline
const updateGameWeekDeadline = asyncHandler(async (req, res) => {
  // get id from URL Params
  const gameWeekId = req.params.Id;

  // get update data from body
  const { updateInfo } = req.body;

  // Get game week deadline

  const updated = await GameWeek.findByIdAndUpdate(
    gameWeekId,
    {
      startTimestamp: updateInfo.startTimestamp,
    },

    { runValidators: true }
  );

  if (updated) {
    //   get updated info
    const updatedGameWeek = await GameWeek.findById(gameWeekId);

    // send response - with updated info
    res.status(200).json(updatedGameWeek);
  } else {
    res.status(404).json({
      message: "Game week not found",
      status: 404,
    });
  }
});

module.exports = {
  getGameWeek,
  getAllGameWeeks,
  updateGameWeekStatus,
  updateGameWeekDeadline,
};
