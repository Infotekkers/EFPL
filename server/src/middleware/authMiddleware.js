const jwt = require("jsonwebtoken");

const verifyJWTToken = (req, res, next) => {
  const token = req.query.token;

  if (!token) {
    return res.status(403).send("Token required for authentication");
  }

  try {
    jwt.verify(token, process.env.JWT_SECRET);
  } catch (err) {
    return res.status(401).send("Invalid Token");
  }

  return next();
};

module.exports = verifyJWTToken;
