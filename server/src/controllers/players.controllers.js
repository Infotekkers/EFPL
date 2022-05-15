const asyncHandler = require("express-async-handler");
const Fixture = require("../models/Fixtures");
const PlayerModel = require("../models/Player");
const Teams = require("../models/Teams");
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

  console.log({
    playerName,
    eplTeamId,
    position,
    currentPrice,
    availability,
    playerImage,
    logoName,
  });

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
    res.status(201).send(`Score added successfully`);
  } else {
    res.status(404).send(`player ${verifyPlayer.playerName} doesn exist`);
  }
});

const getPlayer = asyncHandler(async (req, res) => {
  const player = await PlayerModel.find({ playerId: req.params.playerId });

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

  console.log(currentPlayer);
  await PlayerModel.deleteOne({ playerId: req.params.playerId });
  res.send(`Player ${currentPlayer[0].playerName} removed`);
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
};
