//const asyncHandler = require("express-async-handler");
const { collection } = require("../models/Players");
const PlayerModel = require("../models/Players");

async function addplayers (req,res){
    const { playerName, playerId, position, currentPrice} = req.body;
 
    await new PlayerModel ({
        playerName,
        playerId,
        position,
        currentPrice,
    }).save();
    res.send(`${playerName} is added to players.`);
};


async function updateplayer (req,res){
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
   
    
};

async function getplayer(req,res){
    
    const players = await PlayerModel.find( {playerId: req.params.playerId});

    res.send(players);

   
};


async function getplayers(req,res){
const players = await PlayerModel.find();

    res.send(players);

};





module.exports = {
    addplayers,
    getplayer,
    getplayers,
    updateplayer

}