const expressAsyncHandler = require("express-async-handler");
const JWT = require("jsonwebtoken");

// Function to generate JWT Token
const generateJWTToken = expressAsyncHandler(async (id) => {
  return JWT.sign({ id }, process.env.JWT_SECRET, {
    expiresIn: "5d",
  });
});

// Function to deduct points from user team
const pointDeductor = (activeTeam, incomingTeam) => {
  let deduction = activeTeam.deduction;

  // Check if wildcard or free hit chips are active
  if (incomingTeam.activeChip === "WC" || incomingTeam.activeChip === "FH")
    deduction = 0;
  else {
    // Loop over playerIds of incomingTeam
    for (const playerId of Object.entries(incomingTeam.players)) {
      // Check if the playerIds are in the activeTeam
      if (playerId in activeTeam.players) continue;
      // If not deduct 4 points
      deduction += 4;
    }
  }

  return deduction;
};

module.exports = {
  generateJWTToken,
  pointDeductor,
};
