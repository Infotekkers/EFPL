const expressAsyncHandler = require("express-async-handler");

// TODO: Validate user team
const validateTeam = (team) => {
  // Three player limit
  // Overbudget
  // 15 players
  // Unique captain and vice-captain
  // Valid active chip
  return [true];
};

module.exports = {
  validateTeam,
};
