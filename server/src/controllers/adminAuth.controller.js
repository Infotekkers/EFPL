const asyncHandler = require("express-async-handler");
const jwt = require("jsonwebtoken");
const bcrypt = require("bcryptjs");
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
          expiresIn: "8h",
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
      process.env.BASE_URL_WITHOUT_PORT
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
          message: "could not send reset email",
        });
      } else {
        res.status(200).json({ message: "Email Sent Successfully" });
      }
    });
  } else {
    res.status(404).send({ message: "email doesn't exist" });
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

  // update item
  await Admin.updateOne({ email }, { $set: updateValue });
  res.json({ message: "password reset successfully" });
});

// change password
const changePass = asyncHandler(async (req, res) => {
  const token = req.query.token;
  const oldPass = req.body.oldPass;
  const newPass = req.body.newPass;

  try {
    const decoded = jwt.verify(token, process.env.JWT_SECRET);
    const adminFromToken = await Admin.findById(decoded.data).select(
      "-password"
    );
    const admin = await Admin.findOne({ email: adminFromToken.email });
    if (admin) {
      const passwordCheck = await bcrypt.compare(oldPass, admin.password);
      if (passwordCheck) {
        const salt = await bcrypt.genSalt();
        const hashedPassword = await bcrypt.hash(newPass, salt);
        const updateValue = { password: hashedPassword };
        await Admin.updateOne({ adminFromToken }, { $set: updateValue });
        res.status(200).send({ message: "password reset successfully" });
      } else {
        res.status(400).send({ message: "invalid password" });
      }
    } else {
      res.status(403).json({ message: "Something went wrong" });
    }
  } catch (err) {
    res.status(404).json({ message: "Something went wrong" });
  }
});
// send email
const sendEmail = asyncHandler(async (req, res) => {
  const token = req.query.token;
  const decoded = jwt.verify(token, process.env.JWT_SECRET);
  const adminFromToken = await Admin.findById(decoded.data).select("-password");
  const { receiverEmail, emailBody } = req.body;
  try {
    if (adminFromToken) {
      const mailOptions = {
        from: `${adminFromToken.email}`,
        to: `${receiverEmail}`,
        subject: `Contact from ${adminFromToken.email}`,
        text: `${emailBody}`,
      };
      transporter.sendMail(mailOptions, function (error, info) {
        if (error) {
          res.status(400).json({
            message: "could not send email",
          });
        } else {
          res.status(200).json({ message: "Email Sent Successfully" });
        }
      });
    } else {
      res.status(403).json({ message: "Something went wrong" });
    }
  } catch (err) {
    res.status(404).json({ message: "Something went wrong" });
  }
});
const validateAdmin = asyncHandler(async (req, res) => {
  const token = req.body.token;

  try {
    const decoded = jwt.verify(token, process.env.JWT_SECRET);
    const admin = await Admin.findById(decoded.data).select("-password");
    if (admin) {
      res.status(200).json({ message: "Validated" });
    } else {
      res.status(403).json({ message: "Something went wrong" });
    }
  } catch (err) {
    res.status(404).json({ message: "Something went wrong" });
  }
});

module.exports = {
  login,
  requestReset,
  resetPass,
  validateAdmin,
  sendEmail,
  changePass,
};
