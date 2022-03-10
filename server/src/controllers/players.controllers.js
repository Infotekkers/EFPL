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


// async function updateplayer (req,res){
//     const { playerName, playerId, position, currentPrice} = req.body;
//     const player = PlayerModel.find({playerId: req.params.playerId});
//     const PID = req.params.playerId;
//     if (!player) res.status(404).send('Player not found'); 
   
//         player.collection('players').update({_id: PID}, req.body)
//            res.send(player)
   
   
   
    
// };

async function getplayer(req,res){
    const player = await PlayerModel.findOne({ playerId: req.params.playerId});

    res.send(player);

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