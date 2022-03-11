const { collection } = require("../models/Teams");
const TeamModel = require("../models/Teams");


async function addteam(req,res){
    const { teamName, id } = req.body;

    await new TeamModel ({
        teamName,
        id,
      
    }).save();
    res.send(`${teamName} is added to teams.`);

}


async function getteams(req,res){
    const team = await TeamModel.find()
    res.send(team);
}

async function getteam(req,res){
    const team = await TeamModel.find({teamId: req.body.id});
    res.send(team);
}

async function updateteam(req,res){
    const { teamName } = req.body;
    const team = await TeamModel
    .updateOne({
        teamId: req.params.id}, {
            $set: {
                teamName: teamName,
            }
        })
        res.send(team);
}
module.exports = {
    addteam,
    getteams,
    getteam,
    updateteam,
}