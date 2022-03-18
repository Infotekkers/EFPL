const asyncHandler = require("express-async-handler");
const { collection } = require("../models/Players");
const PlayerModel = require("../models/Players");

const addplayers = asyncHandler(async (req,res) =>{
    const { playerName, eplTeamId,position,currentPrice,score,availablity,history} = req.body;
    
    const verifyPlayer =  await PlayerModel.findOne({playerName:req.body.playerName});
    if(!verifyPlayer){
        await new PlayerModel ({
            playerName,
            
            position,
            currentPrice,
            score,
            history,
            availablity,
            eplTeamId,
        }).save();
        return res.status(200).send(`${playerName} add successful`);
    } else {
        return res.status(404).send(`Player Exist`);
    }

});
//Questions eplTeamId -  what is that
const updateplayer = asyncHandler(async(req,res) =>{
    const { playerName, playerId, position, currentPrice} = req.body; 

    const verifyPlayer =  await PlayerModel.findOne({playerId:req.params.playerId})
    
    if(verifyPlayer){
        const player = await PlayerModel
        .updateOne({ playerId: req.body.playerId}, {
            $set: {
                playerName: playerName,
                position: position,
                playerId: playerId,
                currentPrice:currentPrice,
            }
        });
        return res.status(201).send(`${playerName} Info updated successful`);
    }else{
        return res.status(404).send(`player doesn exist`);
    }
   
}); 


const updateScore = asyncHandler(async(req,res) => {
    const { score } = req.body;
    const verifyPlayer =  await PlayerModel.findOne({playerId:req.params.playerId})
    if(verifyPlayer){
    const scorearray = verifyPlayer.score;
    const Gameweek = scorearray.filter(s=>s.gameweekId == req.params.gameweekId);
    const index = scorearray.indexOf(Gameweek[0]);
    scorearray[index] = score;
    verifyPlayer.score == scorearray;
    await verifyPlayer.save();
        return res.status(201).send(`Score for Gameweek ${Gameweek[0].gameweekId} update successful `);
    }else{
        return res.status(404).send(`player ${verifyPlayer.playerName} doesn exist`);
    } 
});


const addScore = asyncHandler(async(req,res) => {
    const { score } = req.body; 
    const verifyPlayer =  await PlayerModel.findOne({playerId:req.params.playerId})
   if(verifyPlayer){
        const player= await PlayerModel
        .updateMany({playerId:req.params.playerId},{
            $push: {
                score: score
            }
        })
        return res.status(201).send(`Score added successful `);
   }else{
        return res.status(404).send(`player ${verifyPlayer.playerName} doesn exist`);
   }
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