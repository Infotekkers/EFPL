const asyncHandler = require("express-async-handler");
const nodemailer = require("nodemailer");
const bcrypt = require("bcryptjs");
const jwt = require("jsonwebtoken");
const User = require("../models/User");
const Gameweek = require("../models/GameWeek");
const Player = require("../models/Player");
const Team = require("../models/Teams");
const Fixture = require("../models/Fixtures");
const FanstasyStats = require("../models/EFPLStats");
const validateTeam = require("../utils/validators").validateTeam;
const pointDeductor = require("../utils/helpers").pointDeductor;
const sumEplPlayerScore = require("../utils/helpers").sumEplPlayerScore;
const playerInsOutsCounter = require("../utils/helpers").playerInsOutsCounter;
const getUpcomingFixtures = require("../utils/helpers").getUpcomingFixtures;
const secretKey = process.env.JWT_SECRET;

const transporter = nodemailer.createTransport({
  service: process.env.service,
  auth: {
    user: process.env.user,
    pass: process.env.pass,
  },
});

const register = asyncHandler(async (req, res) => {
  // check for pre-existing email
  const emailExists = await User.findOne({ email: req.body.email });
  if (emailExists) return res.status(400).send("Email in Use");

  // create user
  const user = new User({
    userName: req.body.userName,
    password: req.body.password,
    email: req.body.email,
    teamName: req.body.teamName,
    country: req.body.country,
    favouriteEplTeam: req.body.favouriteEplTeam,
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
      expiresIn: "8h",
    }
  );

  // return token  with user
  res.status(201).json({
    token: token,
    userName: user.userName,
    email: user.email,
    country: user.country,
    favouriteEplTeam: user.favouriteEplTeam,
    teamName: user.teamName,
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
          expiresIn: "8h",
        }
      );

      // return token  with user
      res.status(201).json({
        token: token,
        userName: user.userName,
        email: user.email,
        country: user.country,
        favouriteEplTeam: user.favouriteEplTeam,
        teamName: user.teamName,
      });
    } else {
      res.status(400).json({ message: "invalid email - password combination" });
    }
  } else {
    res.status(400).json({ message: "invalid email - password combination" });
  }
});

const fetchUsers = asyncHandler(async (req, res) => {
  const users = await User.find().select("-password -_id -__v");
  res.json(users);
});

const fetchOneUser = asyncHandler(async (req, res) => {
  const token = jwt.verify(req.query.token, process.env.JWT_SECRET);
  const userId = token.data;

  const user = await User.findById(userId);
  if (user == null) {
    return res.status(404).json({ message: "No user found" });
  }
  res.user = user;
  res.json(res.user);
});

const fetchUserTeam = asyncHandler(async (req, res) => {
  const token = jwt.verify(req.query.token, process.env.JWT_SECRET);
  const userId = token.data;

  const user = await User.findById(userId).lean();
  if (user == null) {
    return res.status(404).json({ messaage: "No user found" });
  }

  const team = user.team[req.params.gw];

  for (const playerId in team.players) {
    const player = await Player.findOne(
      { playerId },
      {
        playerName: 1,
        position: 1,
        availability: 1,
      }
    );
    team.players[playerId].name = player?.playerName;
    team.players[playerId].position = player?.position;
    team.players[playerId].availability = player?.availability;
  }

  const response = {
    teamName: user.teamName,
    activeGameweek: req.params.gw,
    availableChips: user.availableChips,
    activeChip: team.activeChip,
    players: team.players,
  };

  res.status(200).json(response);
});

const updateUser = asyncHandler(async (req, res) => {
  const user = await User.findById(req.params.id);
  if (user == null) {
    return res.status(404).json({ message: "No user found" });
  }
  res.user = user;

  // change favourite team
  if (req.body.favouriteEplTeam != null) {
    res.user.favouriteEplTeam = req.body.favouriteEplTeam;
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
    return res.status(404).json({ message: "No user found" });
  }
  res.user = user;
  // delete user
  await res.user.remove();
  res.json({ message: `user ${user.userName} removed` });
});

const requestReset = asyncHandler(async (req, res) => {
  const { email } = req.body;

  // check if email exists
  const user = await User.findOne({ email: { $eq: email } });

  if (user) {
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
    }${8080}/passwordReset/${resetToken}`;

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
    res.status(404).send({ message: "email not found" });
  }
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

  // update item
  await User.updateOne({ email }, { $set: updateValue });
  res.json({ message: "password reset successfully" });
});

const transfer = asyncHandler(async (req, res) => {
  try {
    // get info from req
    const { data } = req.body;
    const token = jwt.verify(req.query.token, process.env.JWT_SECRET);
    const userId = token.data;
    const { isSetTeam } = data;
    let incomingTeam;
    let isInitial = false;

    // parse conditionally
    if (!isSetTeam) {
      incomingTeam = JSON.parse(data).incomingTeam;
      isInitial = JSON.parse(data).isInitial;
    } else {
      incomingTeam = data.incomingTeam;
    }

    // create starter team if none => multiplier == 1
    const incomingPlayers = incomingTeam.players;
    const countMap = {
      GK: 0,
      DEF: 0,
      MID: 0,
      ATT: 0,
      isCaptain: 0,
      isViceCaptain: 0,
    };

    if (isInitial) {
      for (const key in incomingPlayers) {
        // get player position
        const currentPlayer = await Player.findOne({
          playerId: incomingPlayers[key].playerId,
        }).select("position -_id");

        // goalkeeper
        if (currentPlayer.position === "GK" && countMap.GK === 0) {
          incomingPlayers[key].multiplier = 1;
          countMap.GK = countMap.GK + 1;

          if (!countMap.isCaptain) {
            incomingPlayers[key].isCaptain = true;
            incomingPlayers[key].multiplier = 2;

            countMap.isCaptain = true;
          }
        }
        // defender
        else if (currentPlayer.position === "DEF" && countMap.DEF < 4) {
          incomingPlayers[key].multiplier = 1;
          countMap.DEF = countMap.DEF + 1;

          if (!countMap.isViceCaptain) {
            incomingPlayers[key].isViceCaptain = true;
            countMap.isViceCaptain = true;
          }
        }
        // mid
        else if (currentPlayer.position === "MID" && countMap.MID < 3) {
          incomingPlayers[key].multiplier = 1;
          countMap.MID = countMap.MID + 1;
        }
        // att
        else if (currentPlayer.position === "ATT" && countMap.ATT < 3) {
          incomingPlayers[key].multiplier = 1;
          countMap.ATT = countMap.ATT + 1;
        }
      }
    }

    // Fetch active game week
    let activeGameweek = await Gameweek.findOne({ status: "active" }).exec();
    if (activeGameweek) {
      activeGameweek = activeGameweek.gameWeekNumber;
    }
    //
    else {
      activeGameweek = 1;
    }

    // Fetch User Details
    const user = await User.findById(userId).exec();
    let activeTeam;

    if (activeGameweek === 1) {
      // get user id from token
      activeTeam = user.team[0];
    } else {
      activeGameweek = user.team[activeGameweek - 2];
    }

    // check team validity
    if (user.team.length > 0) {
      const [isTeamValid, errorType] = await validateTeam(
        incomingTeam,
        user.availableChips
      );

      // Save team || Send err
      if (isTeamValid === true) {
        // count transfer ins and outs for players
        await playerInsOutsCounter(activeTeam, incomingTeam);

        // Calculate deduction
        let deduction = 0;
        let transfersMade = "";
        if (activeTeam) {
          [deduction, transfersMade] = pointDeductor(activeTeam, incomingTeam);

          // Deduct free transfer
          if (activeTeam.freeTransfers > 0 && transfersMade > 1) {
            if (activeTeam.freeTransfers > transfersMade) {
              activeTeam.freeTransfers =
                activeTeam.freeTransfers - transfersMade;
            } else {
              activeTeam.freeTransfers = activeTeam.freeTransfers - 1;
            }
          }
        }

        // Remove active chips from available chips
        if (incomingTeam.activeChip) {
          const remainingChips = user.availableChips.filter(
            (word) => word !== incomingTeam.activeChip
          );
          await User.findByIdAndUpdate(userId, {
            availableChips: remainingChips,
          });
        }

        const updatedUserTeam = [];

        // get old teams as is
        for (let i = 0; i < activeGameweek; i++) {
          updatedUserTeam.push(user.team[i]);
        }

        // update current gw team
        const currentGwTeam = user.team[activeGameweek];
        currentGwTeam.players = incomingTeam.players;
        currentGwTeam.deduction = deduction;
        currentGwTeam.freeTransfers = activeTeam.freeTransfers;
        updatedUserTeam.push(currentGwTeam);

        // update future teams
        for (let i = activeGameweek; i < 30; i++) {
          let currentTeam = user.team[i];

          if (currentTeam !== null) {
            // if free hit played skip
            if (incomingTeam.activeChip === "FH") {
              currentTeam.players = incomingTeam.players;
            } else {
              const currentNewTeam = {
                gameweekId: i + 2,
                activeChip: "",
                freeTransfers: 1,
                deduction: 0,
                players: incomingTeam.players,
              };

              currentTeam = currentNewTeam;
            }
          }
          updatedUserTeam.push(currentTeam);
        }
        // update user team
        await User.findByIdAndUpdate(userId, { team: updatedUserTeam });

        // * CHIP COUNTER
        if (incomingTeam.activeChip) {
          const filter = { gameWeekNumber: activeGameweek };
          if (incomingTeam.activeChip === "TC")
            await FanstasyStats.findOneAndUpdate(filter, {
              $inc: { "allStats.tripleCaptainCount": 1 },
            });
          else if (incomingTeam.activeChip === "BB")
            await FanstasyStats.findOneAndUpdate(filter, {
              $inc: { "allStats.benchBoostCount": 1 },
            });
          else if (incomingTeam.activeChip === "WC")
            await FanstasyStats.findOneAndUpdate(filter, {
              $inc: { "allStats.wildCardCount": 1 },
            });
          else if (incomingTeam.activeChip === "FH")
            await FanstasyStats.findOneAndUpdate(filter, {
              $inc: { "allStats.freeHitCount": 1 },
            });
        }

        res.status(200).json({ message: "Successfully saved team" });
      } else {
        res.status(412).json(errorType);
      }
    }
    // initial transfer
    else {
      const updatedUserTeam = [];
      // update future teams
      for (let i = 0; i < 30; i++) {
        let currentTeam = user.team[i];

        const currentNewTeam = {
          gameweekId: i + 1,
          activeChip: "",
          freeTransfers: 1,
          deduction: 0,
          players: incomingTeam.players,
        };

        currentTeam = currentNewTeam;

        updatedUserTeam.push(currentTeam);
      }

      await User.findByIdAndUpdate(userId, { team: updatedUserTeam });
      res.status(201).json({ Message: "Team Saved" });
    }
  } catch (err) {
    res.status(422).send();
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
      gameWeekId = gameWeek[gameWeek.length - 1].gameWeekNumber + 1;
    }

    // get timestamp from here
    const currentGameWeek = await Gameweek.findOne({
      gameWeekNumber: gameWeekId,
    })
      .select("-_id,-gameWeekNumber")
      .sort("gameWeekNumber");

    if (gameWeekId && userId) {
      const user = await User.findOne({ _id: userId })
        .select(
          "-userName -password -email -fantasyLeagues -__v -_id -country "
        )
        .lean();

      // get user's gw team
      const userTeam = user.team[gameWeekId - 1];

      // if user team exists
      if (userTeam) {
        const allUserPlayers = userTeam.players;

        const allUserPlayersList = [];

        const allTeams = await Team.find();

        for (const key in allUserPlayers) {
          const playerInfo = {
            playerId: allUserPlayers[key].playerId.toString().trim(),
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
            .limit(6);

          const upComingFixture = [];

          for (let i = 0; i < currentTeamFixture.length; i++) {
            if (
              currentTeamFixture[i].homeTeam.toString() ===
              currPlayer.eplTeamId.toString()
            ) {
              // get team logo
              const teamInfo = await Team.findOne({
                teamName: currentTeamFixture[i].awayTeam,
              }).select("teamLogo");

              // save to list
              upComingFixture.push({
                teamInfo:
                  currentTeamFixture[i].awayTeam.toString() + "+-" + "H",
                teamLogo: teamInfo.teamLogo,
              });
            } else {
              // get team logo
              const teamInfo = await Team.findOne({
                teamName: currentTeamFixture[i].homeTeam,
              }).select("teamLogo");

              // save to list
              upComingFixture.push({
                teamInfo:
                  currentTeamFixture[i].homeTeam.toString() + "+-" + "A",
                teamLogo: teamInfo.teamLogo,
              });
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
            : { injuryStatus: "none", injuryMessage: "none" };
          playerInfo.score = sumEplPlayerScore(currPlayer.score, gameWeekId);
          playerInfo.upComingFixtures = upComingFixture;

          allUserPlayersList.push(playerInfo);
        }

        // get common info
        userTeam.players = allUserPlayersList;
        user.team = userTeam;

        const finalFormat = {
          teamName: user.teamName,
          favouriteEplTeamId: user.favouriteEplTeamId,
          availableChips: user.availableChips,
          team: user.team ? user.team : [],
          maxBudget: user.maxBudget,
          gameWeekDeadline: currentGameWeek.startTimestamp,
        };

        res.status(200).send(finalFormat);
      }
      // no team
      else {
        const finalFormat = {
          teamName: user.teamName,
          favouriteEplTeamId: user.favouriteEplTeamId,
          availableChips: user.availableChips,
          team: user.team ? user.team : [],
          maxBudget: user.maxBudget,
          gameWeekDeadline: currentGameWeek.startTimestamp,
        };

        res.status(200).send(finalFormat);
      }
    }
  } catch (e) {
    // error verifying token

    res.status(401).send("Error Decoding token");
  }
});

const getUserPoints = asyncHandler(async (req, res) => {
  try {
    const gwId = req.params.gameWeekId;

    const token = jwt.verify(req.query.token, process.env.JWT_SECRET);
    const userId = token.data;

    // get the gw number from frontend
    let gameWeekId = gwId;

    // get current active gw
    const activeGw = await Gameweek.find({ status: "active" });

    // if zero send active gw info
    if (gwId.toString() === "0") {
      // if active gw exists
      if (activeGw.length > 0) {
        gameWeekId = activeGw[activeGw.length - 1].gameWeekNumber;
      }
      // if no active gws
      else {
        gameWeekId = 1;
      }
    }
    // if info requested by gw & is after active reset to active
    else if (
      activeGw[activeGw.length - 1] &&
      gameWeekId > activeGw[activeGw.length - 1].gameWeekNumber
    ) {
      gameWeekId = activeGw[activeGw.length - 1].gameWeekNumber;
    }
    //
    else {
      gameWeekId = 1;
    }

    // get user team
    const user = await User.findOne({ _id: userId })
      .select("-_id -password -country")
      .lean();

    // get user team

    if (user.team && user.team[gameWeekId - 1] !== null) {
      const userTeam = user.team[gameWeekId - 1];

      if (userTeam && userTeam.players) {
        const userPlayers = userTeam.players;
        const allPlayersInfo = [];
        const finalFormat = {
          gameWeekId: gameWeekId,
          activeChip: userTeam.activeChip,
          deduction: userTeam.deduction,
          maxActiveCount: activeGw[activeGw.length - 1]
            ? activeGw[activeGw.length - 1].gameWeekNumber
            : 1,
          teamName: user.teamName,
        };

        for (const key in userPlayers) {
          // get current player from key
          const currentPlayer = userPlayers[key];

          // get player info of current player
          const playerInfo = await Player.findOne({
            playerId: currentPlayer.playerId,
          }).lean();

          // get player score
          const currentPlayerAllScore = playerInfo.score
            ? playerInfo.score
            : [];

          const currentPlayerCurrentGwScore = currentPlayerAllScore.filter(
            (scoreInfo) =>
              scoreInfo.gameweekId.toString() === gameWeekId.toString()
          );

          const currentPlayerTeamFixture = await Fixture.findOne({
            $or: [
              { homeTeam: playerInfo.eplTeamId },
              { awayTeam: playerInfo.eplTeamId },
            ],
            gameweekId: gameWeekId,
          });

          const currentPlayerInfo = {
            playerId: currentPlayer.playerId,
            playerName: playerInfo.playerName,
            playerPosition: playerInfo.position,
            eplTeamId: playerInfo.eplTeamId,
            multiplier: currentPlayer.multiplier,
            isCaptain: currentPlayer.isCaptain,
            isViceCaptain: currentPlayer.isViceCaptain,
            score: currentPlayerCurrentGwScore,
            fixtureStatus: currentPlayerTeamFixture.status,
            fixtureScore: currentPlayerTeamFixture.score,
            fixtureTeams:
              currentPlayerTeamFixture.homeTeam +
              " v " +
              currentPlayerTeamFixture.awayTeam,
          };

          allPlayersInfo.push(currentPlayerInfo);
        }

        finalFormat.allPlayers = allPlayersInfo;

        res.status(200).send(finalFormat);
      } else {
        const finalFormat = {
          gameWeekId: gameWeekId,
          activeChip: "",
          deduction: 0,
          maxActiveCount: activeGw[activeGw.length - 1]
            ? activeGw[activeGw.length - 1].gameWeekNumber
            : 1,
          teamName: user.teamName,
          allPlayers: [],
          maxBudget: user.maxBudget,
        };

        res.status(404).send(finalFormat);
      }
    }
    //
    else {
      const finalFormat = {
        gameWeekId: gameWeekId,
        activeChip: "",
        deduction: 0,
        maxActiveCount: activeGw[activeGw.length - 1].gameWeekNumber,
        teamName: user.teamName,
        allPlayers: [],
      };

      res.status(404).send(finalFormat);
    }
  } catch (err) {
    res.status(403).send("Error Decoding token");
  }
});

const getUserWatchList = asyncHandler(async (req, res) => {
  try {
    // get user id from token
    const token = jwt.verify(req.query.token, process.env.JWT_SECRET);
    const userId = token.data;

    const user = await User.findOne({ _id: userId }).select("watchList").lean();

    const userWatchList = user.watchList ? user.watchList : [];

    const allTeams = await Team.find({}).lean().select("-_id -__v");

    const activeGw = await Gameweek.find({ status: "active" });
    let activeGwId = 1;

    if (activeGw.length > 0) {
      activeGwId = activeGw[activeGw.length - 1].gameWeekNumber;
    }
    const finalInfoList = [];

    for (let i = 0; i < userWatchList.length; i++) {
      const currentPlayer = await Player.findOne({
        playerId: userWatchList[i],
      }).lean();

      const currentPlayerTeam = await Team.findOne({
        teamName: currentPlayer.eplTeamId,
      });

      const upComingFixtures = await getUpcomingFixtures(
        6,
        currentPlayer.eplTeamId,
        activeGwId,
        currentPlayer
      );

      const score = await sumEplPlayerScore(currentPlayer.score);

      const currentPlayerInfo = {
        playerId: currentPlayer.playerId,
        playerName: currentPlayer.playerName,
        currentPrice: currentPlayer.currentPrice,
        playerPosition: currentPlayer.position,
        eplTeamId: currentPlayerTeam.teamName,
        eplTeamLogo: currentPlayerTeam.teamLogo,
        availability: currentPlayer.availability
          ? currentPlayer.availability
          : { injuryStatus: "", injuryMessage: "" },
        score: score,
        upComingFixtures: upComingFixtures,
      };

      finalInfoList.push(currentPlayerInfo);
    }
    res.status(200).send({
      allTeams: allTeams,
      watchListInfo: finalInfoList,
    });
  } catch (e) {
    res.status(401).send("Error Decoding Token");
  }
});

const addUserWatchList = asyncHandler(async (req, res) => {
  try {
    const token = jwt.verify(req.query.token, process.env.JWT_SECRET);
    const userId = token.data;

    await User.findByIdAndUpdate(
      { _id: userId },
      { $addToSet: { watchList: req.body.playerId } }
    );

    res.status(201).send("WatchList");
  } catch (e) {
    res.status(401).send("Error Decoding Token");
  }
});

const removeUserWatchList = asyncHandler(async (req, res) => {
  try {
    const token = jwt.verify(req.query.token, process.env.JWT_SECRET);
    const userId = token.data;

    await User.findByIdAndUpdate(
      { _id: userId },
      { $pull: { watchList: req.body.playerId } }
    );

    res.status(200).send("WatchList");
  } catch (e) {
    res.status(401).send("Error Decoding Token");
  }
});

const removeAllUserWatchList = asyncHandler(async (req, res) => {
  try {
    const token = jwt.verify(req.query.token, process.env.JWT_SECRET);
    const userId = token.data;

    await User.findByIdAndUpdate({ _id: userId }, { $set: { watchList: [] } });

    res.status(200).send("WatchList");
  } catch (e) {
    res.status(401).send("Error Decoding Token");
  }
});

const validateUser = asyncHandler(async (req, res) => {
  const token = req.body.token;

  try {
    const decoded = jwt.verify(token, process.env.JWT_SECRET);
    const admin = await User.findById(decoded.data).select("-password");
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
  register,
  login,
  fetchUsers,
  fetchOneUser,
  fetchUserTeam,
  updateUser,
  deleteUser,
  requestReset,
  resetPass,
  transfer,

  // New
  getUserTeam,
  getUserPoints,
  validateUser,
  getUserWatchList,
  addUserWatchList,
  removeUserWatchList,
  removeAllUserWatchList,
};
