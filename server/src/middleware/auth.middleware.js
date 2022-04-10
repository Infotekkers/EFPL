const jwt = require("jsonwebtoken");
const asyncHandler = require("express-async-handler");

const protectRoute = asyncHandler(async (req, res, next) => {
  const token = req.query.token;
  if (!token) {
    return res.status(403).send("token required for auth");
  }
  try {
    jwt.verify(token, process.env.JWT_SECRET);
  } catch (err) {
    return res.status(401).send("invalid token");
  }
  return next();
});

module.exports = { protectRoute };
