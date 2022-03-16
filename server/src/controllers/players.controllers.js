const asyncHandler = require("express-async-handler");
const { collection } = require("../models/Players");
const PlayerModel = require("../models/Players");

const addplayers = asyncHandler(async (req,res) =>{
    const { playerName, playerId, eplTeamId,position,currentPrice,score,availablity,history} = req.body;
    await new PlayerModel ({
        playerName,
        playerId, //range increment 
        position,
        currentPrice,
        score,
        history,
        availablity,
        eplTeamId,
    }).save();
    res.send(`${playerName} is added to players.`);
});

const addScore = asyncHandler(async(req,res) => {
    const { score } = req.body;
    const player= await PlayerModel
    .updateMany({playerId:req.params.playerId},{
        $push: {
            score: score
        }
    })
    res.send("new score added")
})

const updateScore = asyncHandler(async(req,res) => {
    const { score } = req.body;
    const player = await PlayerModel
    .updateOne({playerId:req.params.playerId},{
        $set: {
           score:score
        }
    })
    res.send("updated")
})

const updateplayer = asyncHandler(async(req,res) =>{
    const { playerName, playerId, position, currentPrice} = req.body;
    const player = await PlayerModel
    .updateOne({ playerId: req.params.playerId}, {
        $set: {
            playerName: playerName,
            position: position,
            playerId: playerId,
            currentPrice:currentPrice,
        
        }
    });
    res.send(player); 
});


const getplayer = asyncHandler(async(req,res) =>{
    const players = await PlayerModel.find({playerId: req.params.playerId});
    res.send(players); 
});


const getplayers = asyncHandler (async(req,res) =>{
const players = await PlayerModel.find();
    res.send(players);
});

const deleteplayer = asyncHandler(async(req,res)=>{
    const player = await PlayerModel.deleteOne({playerId: req.params.playerId});
    res.send(`player ${player.playerName} is removed`);
  
  
});


module.exports = {
    addplayers,
    getplayer,
    getplayers,
    updateplayer,
    deleteplayer,
    updateScore,
    addScore
}