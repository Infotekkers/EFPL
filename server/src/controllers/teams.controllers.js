const TeamModel = require("../models/Teams");
const asyncHandler = require("express-async-handler");

const addteam = asyncHandler(async (req, res) => {
  const { teamName } = req.body;

  const verifyTeam = await TeamModel.findOne({ teamName: req.body.teamName });

  if (!verifyTeam) {
    await new TeamModel({
      teamName,
    }).save();
    res.status(201).send(`${teamName} added Succesfully `);
  } else {
    res.status(404).send(`${teamName} EXIST.`);
  }
});

const getteams = asyncHandler(async (req, res) => {
  const team = await TeamModel.find();
  res.status(200).send(team);
});

const getteam = asyncHandler(async (req, res) => {
  const team = await TeamModel.find({ teamId: req.params.id });

  res.status(200).send(team);
});

const updateteam = asyncHandler(async (req, res) => {
  const { teamName } = req.body;

  const verifyTeam = await TeamModel.findOne({ teamId: req.body.teamId });

  if (!verifyTeam) {
    await TeamModel.updateOne(
      {
        teamId: req.params.teamId,
      },
      {
        $set: {
          teamName: teamName,
        },
      }
    );
    res.status(201).send(`${teamName} Info updated Succesfully `);
  } else {
    res.status(404).send(`${teamName} EXIST.`);
  }
});

const deleteteam = asyncHandler(async (req, res) => {
  await TeamModel.deleteOne({ teamId: req.params.teamId });
  res.status(204).send(`Team is removed.`);
});

module.exports = {
  addteam,
  getteams,
  getteam,
  updateteam,
  deleteteam,
};
