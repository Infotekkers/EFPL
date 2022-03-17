const { collection } = require("../models/Teams");
const TeamModel = require("../models/Teams");
const asyncHandler = require("express-async-handler");

const addteam = asyncHandler(async(req,res) => {
    const { teamName, id } = req.body;

    await new TeamModel ({
        teamName,
        id,
      
    }).save();
    res.send(`${teamName} is added to teams.`);

});


const getteams = asyncHandler(async (req,res) =>{
    const team = await TeamModel.find()
    res.send(team);
});

const getteam = asyncHandler( async(req,res) =>{

    const team = await TeamModel.find({teamId: req.params.id});

    res.send(team);
});

const updateteam = asyncHandler(async (req,res)=>{
    const { teamName } = req.body;
    const team = await TeamModel
    .updateOne({
        teamId: req.params.id}, {
            $set: {
                teamName: teamName,
            }
        })
        res.send(`Team ${team.teamName} info updated successfully`);
});

const deleteteam  = asyncHandler(async(req,res)=>{
    const team = await TeamModel.deleteOne({teamId: req.params.id});
    res.send(`Team ${team.teamName} is removed`);
  
  
});


module.exports = {
    addteam,
    getteams,
    getteam,
    updateteam,
    deleteteam
}