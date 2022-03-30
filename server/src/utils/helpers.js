const expressAsyncHandler = require("express-async-handler");
const JWT = require("jsonwebtoken");

const fs = require("fs");

// Function to generate JWT Token
const generateJWTToken = expressAsyncHandler(async (id) => {
  return JWT.sign({ id }, process.env.JWT_SECRET, {
    expiresIn: "5d",
  });
});

// Function to deduct points from user team
const pointDeductor = (activeTeam, incomingTeam) => {
  let deduction = activeTeam.deduction;
  let transfersMade = 0;

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
      transfersMade += 1;
    }

    // Use free transfers if any
    deduction -= 4 * activeTeam.freeTransfers;
  }

  return [deduction, transfersMade];
};

// Function to change base64 to file
const makeFile = async (fileContent, fileName) => {
  await fs.writeFile(
    `uploads/a.jpg`,
    fileContent,
    { encoding: "base64" },
    function (err) {
      if (err) return err;
      else return `uploads/team/${fileName}`;
    }
  );
};

module.exports = {
  generateJWTToken,
  pointDeductor,
  makeFile,
};
