const asyncHandler = require("express-async-handler");
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
  } = req.body;

  const verifyPlayer = await PlayerModel.findOne({
    playerName: req.body.playerName,
  });

  const teamId = await Teams.findOne({ teamName: eplTeamId });

  const id = teamId.teamId;

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
          eplTeamId: id,
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
        eplTeamId: id,
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
    eplTeamId,
    availability,
    position,
    playerImage,
    logoName,
    currentPrice,
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
    };
  } else {
    newData = {
      playerName,
      eplTeamId,
      availability,
      position,
      currentPrice,
    };
  }

  if (playerImage !== "") {
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

    const io = require("../../server");
    io.emit("playerUpdated");

    res.status(201).send(` ${playerName} Info updated successful`);
  } else {
    return res.status(404).send(`player with ${playerName}exist`);
  }
});

const updateScore = asyncHandler(async (req, res) => {
  const { score } = req.body;
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

    const io = require("../../server");
    io.emit("playerUpdated");

    res.status(201).send(`Score for Gameweek update successful`);
  } else {
    res.status(404).send(`player ${verifyPlayer.playerName} doesn exist`);
  }
});

const addScore = asyncHandler(async (req, res) => {
  const { score } = req.body;
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
    const io = require("../../server");
    io.emit("playerUpdated");

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
  const currentPlayer = await PlayerModel.find({
    playerId: req.params.playerId,
  });

  const io = require("../../server");
  io.emit("playerUpdated");
  await PlayerModel.deleteOne({ playerId: req.params.playerId });
  res.send(`Player ${currentPlayer[0].playerName} removed`);
});

const getPlayersByPosition = asyncHandler(async (req, res) => {
  // const position = req.params.position.toUpperCase();

  const allPlayersInPosition = await PlayerModel.find()
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

    const currentTeamFixture = await Fixture.find({
      $or: [
        { homeTeam: allPlayersInPosition[i].eplTeamId },
        { awayTeam: allPlayersInPosition[i].eplTeamId },
      ],

      gameweekId: { $gt: nextGameWeekNumber },
    })
      .select("homeTeam awayTeam")
      .limit(8);

    const upComingFixture = [];

    for (let i = 0; i < currentTeamFixture.length; i++) {
      if (
        currentTeamFixture[i].homeTeam.toString() ===
        allPlayersInPosition[i].eplTeamId.toString()
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

    const currentPlayerInfo = {
      playerName: allPlayersInPosition[i].playerName,
      eplTeamId: allPlayersInPosition[i].eplTeamId,
      eplTeamLogo: currentTeam[0].teamLogo,
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

    // console.log(currentPlayerInfo);
  }

  res.status(200).send(allPlayersInPositionFormatted);
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
};
