const asyncHandler = require("express-async-handler");

// Import Model
const GameWeek = require("../models/GameWeek");

// Get game week status by ID
const getGameWeek = asyncHandler(async (req, res) => {
  // get required game week ID from URL Params
  const game_week_id = req.params.Id;

  // find the game week
  const game_week = await GameWeek.findById(game_week_id);

  // send response
  res.status(200).json(game_week);
});

// Get all game weeks
const getAllGameWeeks = asyncHandler(async (req, res) => {
  // Fetch all game weeks
  const all_game_weeks = await GameWeek.find();

  // send response - all game weeks
  res.status(200).json(all_game_weeks);
});

// update status
const updateGameWeekStatus = asyncHandler(async (req, res, next) => {
  // get id from URL Params
  const game_week_id = req.params.Id;

  // get update data from body
  const { update_info } = req.body;

  //   Check update status value
  await GameWeek.findByIdAndUpdate(
    game_week_id,
    {
      status: update_info.status,
    },
    { runValidators: true }
  );

  //   get updated info
  const updated_game_week = await GameWeek.findById(game_week_id);

  // send response - with updated info
  res.status(200).send(updated_game_week);
});

// update deadline
const updateGameWeekDeadline = asyncHandler(async (req, res) => {
  // get id from URL Params
  const game_week_id = req.params.Id;

  // get update data from body
  const { update_info } = req.body;

  // Get game week deadline

  //   Check update status value
  if (update_info.startTimestamp) {
    // Update the game week in db
    await GameWeek.findByIdAndUpdate(game_week_id, {
      startTimestamp: update_info.startTimestamp,
    });

    //   get updated info
    const updated_game_week = await GameWeek.findById(game_week_id);

    // send response - with updated info
    res.status(200).send(updated_game_week);
  }
  throw new Error(
    `Invalid start time '${update_info.startTimestamp}' for Game week.`
  );
});

module.exports = {
  getGameWeek,
  getAllGameWeeks,
  updateGameWeekStatus,
  updateGameWeekDeadline,
};
