const asyncHandler = require("express-async-handler");
const nodemailer = require("nodemailer");
const bcrypt = require("bcrypt");
const jwt = require("jsonwebtoken");
const User = require("../models/User");
const Gameweek = require("../models/GameWeek");
const validateTeam = require("../utils/validators").validateTeam;
const pointDeductor = require("../utils/helpers").pointDeductor;
const secretKey = process.env.JWT_SECRET;

const transporter = nodemailer.createTransport({
  service: process.env.service,
  auth: {
    user: process.env.user,
    pass: process.env.pass,
  },
});

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

const fetchUsers = asyncHandler(async (req, res) => {
  const users = await User.find();
  res.json(users);
});

const fetchOneUser = asyncHandler(async (req, res) => {
  const user = await User.findById(req.params.id);
  if (user == null) {
    return res.status(404).json({ messaage: "No user found" });
  }
  res.user = user;
  res.json(res.user);
});

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
  await User.updateOne({ email }, { $set: updateValue });
  res.json({ message: "password reset successfully" });
});

const transfer = asyncHandler(async (req, res) => {
  // Destructure request body
  const { userId, incomingTeam } = req.body;

  // Fetch active gameweek
  let activeGameweek = await Gameweek.findOne({ status: "Active" }).exec();
  activeGameweek = activeGameweek.gameWeekNumber;

  // Fetch User Details
  const user = await User.findById(userId).exec();
  let activeTeam = user.team[activeGameweek - 1];

  // Validate team
  const [isTeamValid, errorType] = validateTeam(
    incomingTeam,
    user.availableChips
  );

  // Save team || Send err
  if (isTeamValid === true) {
    // Calculate deduction
    const [deduction, transfersMade] = pointDeductor(activeTeam, incomingTeam);

    // Deduct free transfer
    activeTeam.freeTransers =
      activeTeam.freeTransers < transfersMade
        ? 0
        : activeTeam.freeTransers - transfersMade;

    // Remove active chips from available chips
    if (incomingTeam.activeChip) {
      const remainingChips = user.availableChips.filter(
        (word) => word !== incomingTeam.activeChip
      );
      await User.findByIdAndUpdate(userId, { availableChips: remainingChips });
    }

    // Save deduction and incomingTeam to DB
    activeTeam = incomingTeam;
    activeTeam.deduction = deduction;

    // Update team with deduction for the current gameweek
    await User.findByIdAndUpdate(userId, { team: activeTeam });

    // !! SKIP if FH played
    if (incomingTeam.activeChip !== "FH") {
      // Update team with 0 deduction for the upcoming gameweeks
      activeTeam.deduction = 0;
      for (let gw = activeGameweek + 1; gw < 31; gw++) {
        activeTeam.gameweekId = gw;
        await User.findByIdAndUpdate(userId, { $push: { team: activeTeam } });
      }
    }

    res.status(200).json({ message: "Successfuly saved team" });
  } else {
    res.status(412).json(errorType);
  }
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
  transfer,
};
