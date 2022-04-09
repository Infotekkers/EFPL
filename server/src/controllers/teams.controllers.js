const TeamModel = require("../models/Teams");
const asyncHandler = require("express-async-handler");

const addTeam = asyncHandler(async (req, res) => {
  const { teamName } = req.body;

  const verifyTeam = await TeamModel.findOne({ teamName: req.body.teamName });

  if (!verifyTeam) {
    await new TeamModel({
      teamName,
    }).save();
    res.status(201).send(`${teamName} added Successfully `);
  } else {
    res.status(404).send(`${teamName} EXIST.`);
  }
});

const getTeams = asyncHandler(async (req, res) => {
  const team = await TeamModel.find();
  res.status(200).send(team);
});

const getTeam = asyncHandler(async (req, res) => {
  const team = await TeamModel.find({ teamId: req.params.teamId });
  console.log(req.params.teamId);

  res.status(200).send(team);
});

const updateTeam = asyncHandler(async (req, res) => {
  const { teamName } = req.body;

  const verifyTeam = await TeamModel.findOne({ teamId: req.params.teamId });

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
    res.status(201).send(`${teamName} Info updated Successfully `);
  } else {
    res.status(404).send(`${teamName} EXIST.`);
  }
});

const deleteTeam = asyncHandler(async (req, res) => {
  await TeamModel.deleteOne({ teamId: req.params.teamId });
  res.status(204).send(`Team is removed.`);
});

module.exports = {
  addTeam,
  getTeams,
  getTeam,
  updateTeam,
  deleteTeam,
};
