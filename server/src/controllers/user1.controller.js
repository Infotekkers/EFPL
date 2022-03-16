const asyncHandler = require("express-async-handler");
const User = require("../models/User");
const bcrypt = require("bcrypt");
const jwt = require("jsonwebtoken");
const secretKey = process.env.JWT_SECRET;

// import node mailer
const nodemailer = require("nodemailer");

const transporter = nodemailer.createTransport({
  service: process.env.service,
  auth: {
    user: process.env.user,
    pass: process.env.pass,
  },
});

// Registration
const register = asyncHandler(async (req, res) => {
  // check for prexisting email
  const emailExists = await User.findOne({ email: req.body.email });
  // check for used team name
  const teamNameExists = await User.findOne({ teamName: req.body.teamName });

  if (emailExists) return res.status(400).send("Email in Use");
  if (teamNameExists) return res.status(400).send("Team Name in Use");

  // create user
  const user = new User({
    userName: req.body.userName,
    password: req.body.password,
    email: req.body.email,
    teamName: req.body.teamName,
    country: req.body.country,
    favoriteEplTeamId: req.body.favoriteEplTeamId,
  });
  // save user to db
  await user.save();

  // fetch id
  const userId = await user._id;

  // generate token
  const token = jwt.sign(
    {
      data: userId,
    },
    secretKey,
    {
      expiresIn: "1h",
    }
  );

  // return token  with user
  res.status(201).json({
    token: token,
    name: user.userName,
    email: user.email,
  });
});

// Login
const login = asyncHandler(async (req, res) => {
  // check if email exists
  const user = await User.findOne({ email: req.body.email });
  // check if password valid
  if (user) {
    const passwordCheck = await bcrypt.compare(
      req.body.password,
      user.password
    );
    if (passwordCheck) {
      // fetch id
      const userId = await user._id;

      // generate token
      const token = jwt.sign(
        {
          data: userId,
        },
        secretKey,
        {
          expiresIn: "1h",
        }
      );

      // return token  with user
      res.status(201).json({
        token: token,
        name: user.userName,
        email: user.email,
      });
    }
    res.status(400).json({ message: "invalid email - password combination" });
  }
  res.status(400).json({ message: "invalid email - password combination" });
});

// fetch all users
const fetchUsers = asyncHandler(async (req, res) => {
  const users = await User.find();
  res.json(users);
});

// fetch one user
const fetchOneUser = asyncHandler(async (req, res) => {
  const user = await User.findById(req.params.id);
  if (user == null) {
    return res.status(404).json({ messaage: "No user found" });
  }
  res.user = user;
  res.json(res.user);
});

// change favoriteteam or username
const updateUser = asyncHandler(async (req, res) => {
  const user = await User.findById(req.params.id);
  if (user == null) {
    return res.status(404).json({ messaage: "No user found" });
  }
  res.user = user;

  // change favorite team
  if (req.body.favoriteEplTeamId != null) {
    res.user.favoriteEplTeamId = req.body.favoriteEplTeamId;
  }
  // change userName
  if (req.body.userName != null) {
    res.user.userName = req.body.userName;
  }
  // change password
  if (req.body.password != null) {
    const salt = await bcrypt.genSalt(10);
    const newPass = await bcrypt.hash(req.body.password, salt);
    res.user.password = newPass;
  }

  // save changed data to db
  const updatedUser = await res.user.save();
  res.json(updatedUser);
});

// delete user
const deleteUser = asyncHandler(async (req, res) => {
  // find user in question

  const user = await User.findById(req.params.id);
  if (user == null) {
    return res.status(404).json({ messaage: "No user found" });
  }
  res.user = user;
  // delete user
  await res.user.remove();
  res.json({ messaage: `user ${user.userName} removed` });
});
// request reset password
const requestReset = asyncHandler(async (req, res) => {
  const { email } = req.body;

  // generate reset token
  const resetToken = jwt.sign(
    {
      data: email,
    },
    secretKey,
    { expiresIn: 60 * 60 }
  );
  const resetUrl = `http://localhost:5000/user1/resetPass/${resetToken}`;

  const mailOptions = {
    from: process.env.user,
    to: "mikealexiv565@gmail.com",
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
});

// reset password
const resetPass = asyncHandler(async (req, res) => {
  // check token expiry
  const token = req.params.token;

  // get email
  const decoded = jwt.verify(token, secretKey);
  const email = decoded.data;

  const newPass = req.body.password;
  // will add validation here
  const salt = await bcrypt.genSalt();
  const hashedPassword = await bcrypt.hash(newPass, salt);
  const updateValue = { password: hashedPassword };
  console.log(updateValue);

  // update item
  const user = await User.updateOne({ email }, { $set: updateValue });
  res.json({ message: "password reset successfully" });
});

module.exports = {
  register,
  login,
  fetchUsers,
  fetchOneUser,
  updateUser,
  deleteUser,
  requestReset,
  resetPass,
};
