const { collection } = require("../models/Teams");
const TeamModel = require("../models/Teams");
const asyncHandler = require("express-async-handler");

const addteam = asyncHandler(async(req,res) => {
    const { teamName} = req.body;
     
    const verifyTeam = await TeamModel.findOne({teamName:req.body.teamName});

    if(!verifyTeam){
        await new TeamModel ({
            teamName, 
        }).save();
        return res.status(201).send(`${teamName} added Succesfully `);
    }else{
        return res.send(`${teamName} EXIST.`);
    }
   

});


const getteams = asyncHandler(async (req,res) =>{
    const team = await TeamModel.find()
    return res.status(200).send(team);
});

const getteam = asyncHandler( async(req,res) =>{

    const team = await TeamModel.find({teamId: req.params.id});

    return res.status(200).send(team);

});

const updateteam = asyncHandler(async (req,res)=>{
    const { teamName } = req.body;

    const verifyTeam = await TeamModel.findOne({teamId:req.body.teamId});

    if(!verifyTeam){
    const team = await TeamModel
    .updateOne({
        teamId: req.params.teamId}, {
            $set: {
                teamName: teamName,
            }
        })
        return res.status(201).send(`${teamName} Info updated Succesfully `);
    }else{
        return res.send(`${teamName} EXIST.`);
    }
});

const deleteteam  = asyncHandler(async(req,res)=>{
    const team = await TeamModel.deleteOne({teamId: req.params.teamId});
    return res.status(204).send(`Team ${team.teamName} is removed`); 
});


module.exports = {
    addteam,
    getteams,
    getteam,
    updateteam,
    deleteteam
}