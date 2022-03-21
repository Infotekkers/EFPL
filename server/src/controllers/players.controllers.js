const asyncHandler = require("express-async-handler");
const PlayerModel = require("../models/Player");

const addplayers = asyncHandler(async (req, res) => {
  const {
    playerName,
    eplTeamId,
    position,
    currentPrice,
    score,
    availability,
    history,
  } = req.body;
  await new PlayerModel({
    playerName,
    position,
    currentPrice,
    score,
    history,
    availability,
    eplTeamId,
  }).save();
  res.status(201).send(`${playerName} added successfully`);
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
