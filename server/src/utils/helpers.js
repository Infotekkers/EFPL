const expressAsyncHandler = require("express-async-handler");
const JWT = require("jsonwebtoken");

const fs = require("fs");
const { v4: uuidv4 } = require("uuid");
const path = require("path");

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
const makeFile = (fileContent, logoName) => {
  // Check base64 format
  const matches = fileContent.match(/^data:([A-Za-z-+/]+);base64,(.+)$/);
  if (matches.length !== 3) {
    return "";
  } else {
    // create buffer
    const imageBuffer = Buffer.from(matches[2], "base64");
    const itemName = logoName.split(".");
    const itemFileName = uuidv4() + "." + itemName[itemName.length - 1];

    const filePath = path.join(
      path.resolve("./"),
      "uploads/teams",
      itemFileName
    );

    try {
      fs.writeFileSync(filePath, imageBuffer, "utf-8");
      return "/uploads/teams/" + itemFileName;
    } catch (e) {
      return "";
    }
  }
};


module.exports = {
  generateJWTToken,
  pointDeductor,
  makeFile,
};
