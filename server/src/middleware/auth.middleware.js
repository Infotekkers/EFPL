const jwt = require("jsonwebtoken");
const asyncHandler = require("express-async-handler");
const Admin = require("../models/Admin");

const verifyToken = asyncHandler(async (req, res, next) => {
  let token;

  if (
    req.headers.authorization &&
    req.headers.authorization.startsWith("Bearer")
  ) {
    try {
      // get token from header
      token = req.headers.authorization.split(" ")[1];
      // verify token
      const decoded = jwt.verify(token, process.env.JWT_SECRET);
      // res.json(decoded)

      // get admin from token
      req.admin = await Admin.findById(decoded.data).select("-password");
      

      next();
    } catch (error) {
      console.log(error);
      res.status(403).json({message:"Invalid Token"});
      
    }
  }
  if (!token) {
    res.status(401).json({ message: "Not Authorized has no token" });
  }
});

module.exports = { verifyToken };
