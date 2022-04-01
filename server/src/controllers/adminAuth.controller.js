const asyncHandler = require("express-async-handler");
const jwt = require("jsonwebtoken");
const bcrypt = require("bcrypt");
const Admin = require("../models/Admin");
const secretKey = process.env.JWT_SECRET;

// admin login
const login = asyncHandler(async (req, res) => {
    // check if email exists
    const admin = await Admin.findOne({ email: req.body.email });
    // check if password valid
    if (admin) {
      const passwordCheck = await bcrypt.compare(
        req.body.password,
        admin.password
      );
      if (passwordCheck) {
        // fetch id
        const adminId = await admin._id;
  
        // generate token
        const token = jwt.sign(
          {
            data: adminId,
          },
          secretKey,
          {
            expiresIn: "1h",
          }
        );
  
        // return token  with user
        res.status(201).json({
          token: token,
          email: admin.email,
        });
      }
      res.status(400).json({ message: "invalid email - password combination" });
    }
    res.status(400).json({ message: "invalid email - password combination" });
  });


  module.exports={login};