const asyncHandler = require("express-async-handler");
const jwt = require("jsonwebtoken");
const bcrypt = require("bcrypt");
const Admin = require("../models/Admin");
const secretKey = process.env.JWT_SECRET;
const nodemailer = require("nodemailer");

const transporter = nodemailer.createTransport({
  service: process.env.service,
  auth: {
    user: process.env.user,
    pass: process.env.pass,
  },
});

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
    } else {
      res.status(400).send({ message: "invalid email - password combination" });
    }
  } else {
    res.status(400).send({ message: "invalid email - password combination" });
  }
});

// request reset
const requestReset = asyncHandler(async (req, res) => {
  const { email } = req.body;
  // check if email exists
  const admin = await Admin.findOne({ email: { $eq: email } });

  if (admin) {
    // generate reset token
    const resetToken = jwt.sign(
      {
        data: email,
      },
      secretKey,
      { expiresIn: 60 * 60 }
    );
    const resetUrl = `${
      process.env.BASE_URL
    }${8080}/resetPassword/${resetToken}`;

    const mailOptions = {
      from: process.env.user,
      to: email,
      subject: "Reset Email via Node",
      text: `${resetUrl}`,
    };

    transporter.sendMail(mailOptions, function (error, info) {
      if (error) {
        res.status(400).json({
          messaage: "could not send reset email",
        });
        console.log(error);
      } else {
        res.status(200).json({ messaage: "Email Sent Successfully" });
        console.log("email sent: " + info.response);
      }
    });
  } else {
    res.status(404).send({ message: "user with that email doesn't exist" });
  }
});

// reset password
const resetPass = asyncHandler(async (req, res) => {
  // check token expiry
  const token = req.params.token;

  // get email
  const decoded = jwt.verify(token, secretKey);
  const email = decoded.data;

  const newPass = req.body.password;
  const salt = await bcrypt.genSalt();
  const hashedPassword = await bcrypt.hash(newPass, salt);
  const updateValue = { password: hashedPassword };
  console.log(updateValue);

  // update item
  await Admin.updateOne({ email }, { $set: updateValue });
  res.json({ message: "password reset successfully" });
});

const validateAdmin = asyncHandler(async (req, res) => {
  const token = req.body.token;

  try {
    jwt.verify(token, process.env.JWT_SECRET);
    res.status(200).json({ messaage: "Validated Successfully" });
  } catch (err) {
    res.status(404).json({ messaage: "Something went wrong" });
  }
});

module.exports = { login, requestReset, resetPass, validateAdmin };
