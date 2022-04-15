const jwt = require("jsonwebtoken");
const asyncHandler = require("express-async-handler");

const protectRoute = asyncHandler(async (req, res, next) => {
  const token = req.query.token;
  if (process.env.EXPRESS_ENV === "development") {
    return next();
  } else {
    if (!token) {
      return res.status(403).send("Please Login!");
    }
    try {
      jwt.verify(token, process.env.JWT_SECRET);
    } catch (err) {
      return res.status(401).send("Something wrong. Try logging in again!");
    }
    return next();
  }
});

module.exports = { protectRoute };
