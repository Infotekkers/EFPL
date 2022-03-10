//const asyncHandler = require("express-async-handler");
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

module.exports = {
    addplayers,
}