const user = require("../models/User");
const validateTeam = require("../utils/validators").validateTeam;

const transfer = (req, res) => {
  const { userId, incomingPlayerId, outgoingPlayerId } = req.body;

  // Fetch active gameweek
  // Fetch user's active team
  // Make the transfer
  // Validate team
  // Save team || Send err
};

module.exports = { transfer };
