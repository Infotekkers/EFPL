const expressAsyncHandler = require("express-async-handler");
const JWT = require("jsonwebtoken");

//
const generateJWTToken = expressAsyncHandler(async (id) => {
  return JWT.sign({ id }, process.env.JWT_SECRET, {
    expiresIn: "5d",
  });
});

// TODO: Validate user team
const validateTeam = (team) => {
  return [true];
};

module.exports = {
  generateJWTToken,
  validateTeam,
};
