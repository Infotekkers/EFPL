const asyncHandler = require("express-async-handler");
const { collection } = require("../models/Players");
const PlayerModel = require("../models/Players");

const addplayers = asyncHandler(async (req,res) =>{
    const { playername, playerId, eplTeamId,position,currentPrice,score,availablity,history} = req.body;
    
    const verifyPlayer =  await PlayerModel.find({playername:req.params.playername})
    
    if(verifyPlayer.length == 0 ){
        await new PlayerModel ({
            playername,
            playerId, //range increment 
            position,
            currentPrice,
            score,
            history,
            availablity,
            eplTeamId,
        }).save();
        res.send(`${playername} is added to players.`);
    } else {
        res.send("Player already Exist!")
    }

});

const updateplayer = asyncHandler(async(req,res) =>{
    const { playerName, playerId, position, currentPrice} = req.body; 

    const verifyPlayer =  await PlayerModel.find({playerId:req.params.playerId})
    
    if(verifyPlayer){
        const player = await PlayerModel
        .updateOne({ playerId: req.params.playerId}, {
            $set: {
                playerName: playerName,
                position: position,
                playerId: playerId,
                currentPrice:currentPrice,
            
            }
        });
        res.send(`${playerName} data updated sucesfully`); 
    }else{
        res.send("Player does not Exits");
    }
   
}); 


const updateScore = asyncHandler(async(req,res) => {
    const { score } = req.body;

    const verifyPlayer =  await PlayerModel.find({playerId:req.params.playerId})
    
    if(verifyPlayer){

    const player = await PlayerModel
    .updateOne({playerId:req.params.playerId},{
        $set: {
           score:score
        }
    })
    res.send(`Player ${playerName} Score for Gameweek ${score.gameweekId} Updated Successfully`)
    }else{
        res.send("Player does not Exits");
    }
})


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