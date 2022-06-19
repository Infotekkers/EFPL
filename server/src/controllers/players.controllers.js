const asyncHandler = require("express-async-handler");
const axios = require("axios");
const Fixture = require("../models/Fixtures");
const GameWeek = require("../models/GameWeek");
const PlayerModel = require("../models/Player");
const Teams = require("../models/Teams");
const sumEplPlayerScore = require("../utils/helpers").sumEplPlayerScore;
const { makeFilePlayer } = require("../utils/helpers");

const addPlayer = asyncHandler(async (req, res) => {
  const {
    playerName,
    eplTeamId,
    position,
    currentPrice,
    availability,
    playerImage,
    logoName,
    playerNameAmh,
  } = req.body;

  const verifyPlayer = await PlayerModel.findOne({
    playerName: req.body.playerName,
  });

  // const teamId = await Teams.findOne({ teamName: eplTeamId });

  // const id = teamId.teamId;

  // If player does not exist
  if (!verifyPlayer) {
    // if image is sent
    if (logoName) {
      // save file
      const playerImagePath = makeFilePlayer(playerImage, logoName);

      // if file is saved
      if (playerImagePath) {
        await new PlayerModel({
          playerName,
          position,
          currentPrice,
          availability,
          playerImage: playerImagePath,
          eplTeamId: eplTeamId,
          playerNameAmh,
        }).save();

        const io = require("../../server");
        io.emit("playerUpdated");

        res.status(201).send(`${playerName} added successfully`);
      }
      // if file is not saved
      else {
        res.status(422).json("Error saving image. Please try again!");
      }
    }

    // if no image
    else {
      await new PlayerModel({
        playerName,
        position,
        currentPrice,
        availability,
        playerImage: "",
        eplTeamId: eplTeamId,
        playerNameAmh,
      }).save();
      res.status(201).send(`${playerName} added successfully`);
    }
  }
  // if player exists
  else {
    res.status(404).send(`${playerName} EXIST.`);
  }
});

const updatePlayer = asyncHandler(async (req, res) => {
  const {
    playerName,
    emitSocket,
    eplTeamId,
    availability,
    position,
    playerImage,
    logoName,
    currentPrice,
    playerNameAmh,
  } = req.body;

  let newData;

  const liveMatch = await Fixture.find({
    $or: [
      { status: "liveFH" },
      { status: "HT" },
      { status: "liveSH" },
      { status: "FT" },
    ],
  });

  if (liveMatch.length > 0) {
    newData = {
      playerName,
      eplTeamId,
      availability,
      position,
      playerNameAmh,
    };
  } else {
    newData = {
      playerName,
      eplTeamId,
      availability,
      position,
      currentPrice,
      playerNameAmh,
    };
  }

  if (playerImage && playerImage !== "") {
    const filePath = makeFilePlayer(playerImage, logoName);

    if (filePath !== "") {
      newData.playerImage = filePath;
    }
  }

  const verifyPlayer = await PlayerModel.findOne({
    playerId: req.params.playerId,
  });

  if (verifyPlayer) {
    await PlayerModel.updateOne(
      { playerId: req.params.playerId },
      {
        $set: newData,
      }
    );

    if (emitSocket !== 0) {
      const io = require("../../server");
      io.emit("playerUpdated");
    }
    res.status(201).send(` ${playerName} Info updated successful`);
  } else {
    return res.status(404).send(`player with ${playerName} exist`);
  }
});

const updateScore = asyncHandler(async (req, res) => {
  const { score, emitSocket } = req.body;
  const verifyPlayer = await PlayerModel.findOne({
    playerId: req.params.playerId,
  });

  if (verifyPlayer) {
    const scorearray = verifyPlayer.score;
    const Gameweek = scorearray.filter(
      (s) => s.gameweekId === req.params.gameweekId
    );
    const index = scorearray.indexOf(Gameweek[0]);
    scorearray[index] = score;
    verifyPlayer.score = scorearray;

    await verifyPlayer.save();

    if (emitSocket !== 0) {
      const io = require("../../server");
      io.emit("playerUpdated");
    }

    res.status(201).send(`Score for Gameweek update successful`);
  } else {
    res.status(404).send(`player ${verifyPlayer.playerName} doesn exist`);
  }
});

const addScore = asyncHandler(async (req, res) => {
  const { score, emitSocket } = req.body;
  const verifyPlayer = await PlayerModel.findOne({
    playerId: req.params.playerId,
  });
  if (verifyPlayer) {
    await PlayerModel.updateMany(
      { playerId: req.params.playerId },
      {
        $push: {
          score: score,
        },
      }
    );
    if (emitSocket !== 0) {
      const io = require("../../server");
      io.emit("playerUpdated");
    }

    res.status(201).send(`Score added successfully`);
  } else {
    res.status(404).send(`player ${verifyPlayer.playerName} doesn exist`);
  }
});

const getPlayer = asyncHandler(async (req, res) => {
  const player = await PlayerModel.find({
    playerId: req.params.playerId,
  }).lean();

  const team = await Teams.find({ teamName: player[0].eplTeamId });

  player[0].teamLogoUrl = team[0]?.teamLogo;

  res.send(player);
});
const getPlayers = asyncHandler(async (req, res) => {
  const players = await PlayerModel.find();

  // get team logo
  for (let index = 0; index < players.length; index++) {
    const team = await Teams.findOne({ teamName: players[index].eplTeamId });

    try {
      players[index].playerImage = team.teamLogo;
    } catch (e) {}
  }

  // get  if any match is live
  const findLiveMatch = await Fixture.find({
    $or: [
      { status: "liveFH" },
      { status: "HT" },
      { status: "liveSH" },
      { status: "FT" },
    ],
  });

  let liveMatch = false;

  if (findLiveMatch.length > 0) {
    liveMatch = true;
  }

  const result = {
    data: players,
    liveMatch: liveMatch,
  };

  res.send(result);
});

const getHomeAndAwayPlayers = asyncHandler(async (req, res) => {
  const homePlayersRaw = await PlayerModel.find({
    eplTeamId: req.params.homeTeamId,
  }).select("playerName playerId eplTeamId position availabilty");
  const awayPlayersRaw = await PlayerModel.find({
    eplTeamId: req.params.awayTeamId,
  }).select("playerName playerId eplTeamId position availabilty");

  const homePlayers = {};
  homePlayersRaw.forEach((player) => {
    homePlayers[player.playerId] = player;
  });

  const awayPlayers = {};
  awayPlayersRaw.forEach((player) => {
    awayPlayers[player.playerId] = player;
  });

  const result = {
    homePlayers,
    awayPlayers,
  };
  res.status(200).send(result);
});

const deletePlayer = asyncHandler(async (req, res) => {
  const currentPlayer = await PlayerModel.findOne({
    playerId: req.params.playerId,
  });

  const io = require("../../server");
  io.emit("playerUpdated");
  await PlayerModel.deleteOne({ playerId: req.params.playerId });
  res.send(`Player ${currentPlayer.playerName} removed`);
});

const getPlayersByPosition = asyncHandler(async (req, res) => {
  const position = req.params.position.toUpperCase();

  const allPlayersInPosition = await PlayerModel.find({ position: position })
    .select("-_id -__v -history")
    .sort("playerName");

  const allPlayersInPositionFormatted = [];

  const allTeams = await Teams.find();
  const gameWeek = await GameWeek.findOne({ status: "active" }).select(
    "gameWeekNumber"
  );

  let nextGameWeekNumber = 1;
  if (gameWeek) {
    nextGameWeekNumber = gameWeek.gameWeekNumber;
  }

  for (let i = 0; i < allPlayersInPosition.length; i++) {
    const currentTeam = allTeams.filter(
      (team) => team.teamName === allPlayersInPosition[i].eplTeamId
    );

    const teamName = allPlayersInPosition[i].eplTeamId;

    const currentTeamFixtureHome = await Fixture.find({
      homeTeam: allPlayersInPosition[i].eplTeamId,
      gameweekId: { $gt: nextGameWeekNumber },
    })
      .select("homeTeam awayTeam gameweekId")
      .limit(4);

    const currentTeamFixtureAway = await Fixture.find({
      awayTeam: teamName,
      gameweekId: { $gt: nextGameWeekNumber },
    })
      .select("homeTeam awayTeam gameweekId")
      .limit(4);

    const currentTeamFixture = [
      ...new Set([...currentTeamFixtureHome, ...currentTeamFixtureAway]),
    ];

    currentTeamFixture.sort((a, b) => a.gameweekId - b.gameweekId);

    const upComingFixture = [];

    for (let i = 0; i < currentTeamFixture.length; i++) {
      if (currentTeamFixture[i].homeTeam.toString() === teamName) {
        // get team logo
        const teamInfo = await Teams.findOne({
          teamName: currentTeamFixture[i].awayTeam,
        }).select("teamLogo");

        upComingFixture.push({
          teamLogo: teamInfo.teamLogo,
          teamInfo: currentTeamFixture[i].awayTeam.toString() + "+-" + "H",
        });
      } else {
        // get team logo
        const teamInfo = await Teams.findOne({
          teamName: currentTeamFixture[i].homeTeam,
        }).select("teamLogo");

        upComingFixture.push({
          teamInfo: currentTeamFixture[i].homeTeam.toString() + "+-" + "A",
          teamLogo: teamInfo.teamLogo,
        });
      }
    }

    const currentPlayerInfo = {
      playerName: allPlayersInPosition[i].playerName,
      eplTeamId: allPlayersInPosition[i].eplTeamId,
      eplTeamLogo: currentTeam.length > 0 ? currentTeam[0].teamLogo : "",
      currentPrice: allPlayersInPosition[i].currentPrice,
      position: allPlayersInPosition[i].position,
      playerId: allPlayersInPosition[i].playerId,
      score: sumEplPlayerScore(allPlayersInPosition[i].score),
      availability: allPlayersInPosition[i].availability
        ? allPlayersInPosition[i].availability
        : { injuryStatus: "", injuryMessage: "" },

      upComingFixtures: upComingFixture,
      multiplier: allPlayersInPosition[i].multiplier,
    };

    allPlayersInPositionFormatted.push(currentPlayerInfo);
  }

  res.status(200).send(allPlayersInPositionFormatted);
});

const getSuggestedPrice = asyncHandler(async (req, res) => {
  const mlRes = await axios.get(
    `${process.env.ML_API_URL}/initial-price/${req.params.playerName}`
  );
  if (mlRes.status === 200) res.send(mlRes.data);
  else res.status(400).send({ message: "Unable to fetch suggested price" });
});

module.exports = {
  addPlayer,
  getPlayer,
  getPlayers,
  getHomeAndAwayPlayers,
  updatePlayer,
  deletePlayer,
  updateScore,
  addScore,

  // New
  getPlayersByPosition,
  getSuggestedPrice,
};
