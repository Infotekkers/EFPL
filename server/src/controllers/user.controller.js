const asyncHandler = require("express-async-handler");
const nodemailer = require("nodemailer");
const bcrypt = require("bcrypt");
const jwt = require("jsonwebtoken");
const User = require("../models/User");
const Gameweek = require("../models/GameWeek");
const Player = require("../models/Player");
const Team = require("../models/Teams");
const Fixture = require("../models/Fixtures");
const validateTeam = require("../utils/validators").validateTeam;
const pointDeductor = require("../utils/helpers").pointDeductor;
const sumEplPlayerScore = require("../utils/helpers").sumEplPlayerScore;
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
          // TODO:Update
          expiresIn: "4h",
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
  const users = await User.find().select("-password -_id -__v");
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
  const { data } = req.body;
  const { userId, incomingTeam } = JSON.parse(data);

  // Fetch active gameweek
  let activeGameweek = await Gameweek.findOne({ status: "Active" }).exec();

  if (activeGameweek) {
    activeGameweek = activeGameweek.gameWeekNumber;
  } else {
    activeGameweek = 1;
  }

  // Fetch User Details
  const user = await User.findById(userId).exec();
  let activeTeam = user.team[activeGameweek - 1];

  // Validate team
  const [isTeamValid, errorType] = validateTeam(
    incomingTeam,
    user.availableChips
  );

  console.log(errorType);

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

const getUserTeam = asyncHandler(async (req, res) => {
  try {
    // get user id from token
    const token = jwt.verify(req.query.token, process.env.JWT_SECRET);
    const userId = token.data;

    // get active game week
    const gameWeek = await Gameweek.find({ status: "active" });

    // if there is no active gw
    let gameWeekId = 1;

    if (gameWeek.length > 0) {
      gameWeekId = gameWeek[gameWeek.length - 1].gameWeekNumber;
    }

    const currentGameWeek = await Gameweek.findOne({
      gameWeekNumber: gameWeekId,
    })
      .select("-_id,-gameWeekNumber")
      .sort("gameWeekNumber");

    // TODO:get user id from token
    if (gameWeekId && userId) {
      const user = await User.findOne({ _id: userId })
        .select(
          "-userName -password -email -fantasyLeagues -__v -_id -country "
        )
        .lean();

      // get user's gw team
      let userTeam = user.team[gameWeekId - 1];

      // if no team && gw 1
      if (!userTeam && gameWeekId === 1) {
        console.log("No Team Found");
        res.status(404).send("No Team Found");
      } else {
        // if no team this gw copy from past
        if (!userTeam) {
          userTeam = user.team[gameWeekId - 2];
          userTeam.gameweekId = gameWeekId;
          userTeam.freeTransfers = userTeam.freeTransfers >= 1 ? 2 : 1;
          userTeam.deduction = 0;
        }

        const allUserPlayers = userTeam.players;

        const allUserPlayersList = [];

        const allTeams = await Team.find();

        for (const key in allUserPlayers) {
          const playerInfo = {
            playerId: allUserPlayers[key].playerId,
            multiplier: parseInt(allUserPlayers[key].multiplier),
            isCaptain: allUserPlayers[key].isCaptain,
            isViceCaptain: allUserPlayers[key].isViceCaptain,
          };

          // get more info on player
          const currPlayer = await Player.findOne({
            playerId: allUserPlayers[key].playerId,
          });

          // get players upcoming fixtures
          const currentTeamFixture = await Fixture.find({
            $or: [
              { homeTeam: currPlayer.eplTeamId },
              { awayTeam: currPlayer.eplTeamId },
            ],

            gameweekId: { $gt: gameWeekId },
          })
            .select("homeTeam awayTeam")
            .limit(8);

          const upComingFixture = [];

          for (let i = 0; i < currentTeamFixture.length; i++) {
            if (
              currentTeamFixture[i].homeTeam.toString() ===
              currPlayer.eplTeamId.toString()
            ) {
              upComingFixture.push(
                currentTeamFixture[i].awayTeam.toString() + "+-" + "H"
              );
            } else {
              upComingFixture.push(
                currentTeamFixture[i].homeTeam.toString() + "+-" + "A"
              );
            }
          }

          const currentTeam = allTeams.filter(
            (team) =>
              team.teamName.toString() === currPlayer.eplTeamId.toString()
          );

          playerInfo.playerName = currPlayer.playerName.toString().trim();
          playerInfo.eplTeamId = currPlayer.eplTeamId.toString().trim();
          playerInfo.eplTeamLogo = currentTeam[0].teamLogo;
          playerInfo.currentPrice = parseFloat(currPlayer.currentPrice);
          playerInfo.position = currPlayer.position.toString().trim();
          playerInfo.availability = currPlayer.availability
            ? currPlayer.availability
            : { injuryStatus: "", injuryMessage: "" };
          playerInfo.score = sumEplPlayerScore(currPlayer.score, gameWeekId);
          playerInfo.upComingFixtures = upComingFixture;

          allUserPlayersList.push(playerInfo);
        }

        userTeam.players = allUserPlayersList;
        user.team = userTeam;

        const finalFormat = {
          teamName: user.teamName,
          favouriteEplTeamId: user.favouriteEplTeamId,
          availableChips: user.availableChips,
          team: user.team,
          maxBudget: user.maxBudget,
          gameWeekDeadline: currentGameWeek.startTimestamp,
        };

        res.status(200).send(finalFormat);
      }
    }
  } catch (e) {
    // error verifying token
    console.log(e);
    res.status(401).send("Error Decoding token");
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

  // New
  getUserTeam,
};
