const asyncHandler = require("express-async-handler");
const PlayerModel = require("../models/Player");
const { makeFile } = require("../utils/helpers");

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
    playerName:req.body.playerName
  })

  if(!verifyPlayer){
    const playerImagePath = makeFile(playerImage, logoName);

    if (playerImagePath){
      await new PlayerModel({
        playerName,
        position,
        currentPrice,
        availability,
        playerImage: playerImagePath,
        eplTeamId,
      }).save();
      res.status(201).send(`${playerName} added successfully`);
    }  else {
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
    history,
    eplTeamId,
    availablity,
    playerId,
    position,
    currentPrice,
  } = req.body;

  // const verifyPlayer =  await PlayerModel.findOne({playerId:req.params.playerId})
  // if(verifyPlayer){
  await PlayerModel.updateOne(
    { playerId: req.body.playerId },
    {
      $set: {
        playerName: playerName,
        position: position,
        playerId: playerId,
        currentPrice: currentPrice,
        history: history,
        eplTeamId: eplTeamId,
        availablity: availablity,
      },
    }
  );

  res.status(201).send(`Info updated successful`);
  // } else{
  //     return res.status(404).send(`player doesn exist`);
  // }
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
