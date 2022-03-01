const expressAsyncHandler = require("express-async-handler");
const JWT = require("jsonwebtoken");

//
const generateJWTToken = expressAsyncHandler(async (id) => {
  return JWT.sign({ id }, process.env.JWT_SECRET, {
    expiresIn: "5d",
  });
});

module.exports = {
  generateJWTToken,
};
