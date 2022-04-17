const asyncHandler = require("express-async-handler");
const PlayerModel = require("../models/Player");
const Teams = require("../models/Teams");
const { makeFilePlayer } = require("../utils/helpers");

const addplayers = asyncHandler(async (req, res) => {
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

  if (!verifyPlayer) {
    const playerImagePath = makeFilePlayer(playerImage, logoName);

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
    } else {
      res.status(422).json("Error saving image. Please try again!");
    }
  } else {
    res.status(404).send(`${playerName} EXIST.`);
  }
});
// Questions eplTeamId -  what is that
const updateplayer = asyncHandler(async (req, res) => {
  const {
    playerName,
    eplTeamId,
    availablity,
    position,
    playerImage,
    logoName,
    currentPrice,
  } = req.body;

  const newData = {
    playerName,
    eplTeamId,
    availablity,
    position,
    currentPrice,
  };

  if (playerImage !== "") {
    const filePath = makeFilePlayer(playerImage, logoName);

    if (filePath !== "") {
      newData.playerImage = filePath;
    }
  }
  console.log(newData);

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
  console.log(verifyPlayer);
  // if(verifyPlayer){
  const scorearray = verifyPlayer.score;
  const Gameweek = scorearray.filter(
    (s) => s.gameweekId === req.params.gameweekId
  );
  const index = scorearray.indexOf(Gameweek[0]);
  scorearray[index] = score;
  verifyPlayer.score = scorearray;
  console.log(verifyPlayer);
  await verifyPlayer.save();
  res.status(201).send(`Score for Gameweek update successful`);
  //  }else{
  //     res.status(404).send(`player ${verifyPlayer.playerName} doesn exist`);
  // }
});

const addScore = asyncHandler(async (req, res) => {
  const { score } = req.body;
  //   const verifyPlayer = await PlayerModel.findOne({
  //     playerId: req.params.playerId,
  //   });
  // if(verifyPlayer){
  await PlayerModel.updateMany(
    { playerId: req.params.playerId },
    {
      $push: {
        score: score,
      },
    }
  );
  res.status(201).send(`Score added successfully`);
  // }else{
  //     res.status(404).send(`player ${verifyPlayer.playerName} doesn exist`);
  // }
});

const getplayer = asyncHandler(async (req, res) => {
  const players = await PlayerModel.find({ playerId: req.params.playerId });
  res.send(players);
});

const getplayers = asyncHandler(async (req, res) => {
  const players = await PlayerModel.find();

  console.log(players);
  res.send(players);
});

const deleteplayer = asyncHandler(async (req, res) => {
  const player = await PlayerModel.deleteOne({ playerId: req.params.playerId });
  res.send(`player ${player.playerName} is removed`);
});

module.exports = {
  addplayers,
  getplayer,
  getplayers,
  updateplayer,
  deleteplayer,
  updateScore,
  addScore,
};
