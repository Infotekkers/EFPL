const TeamModel = require("../models/Teams");
const asyncHandler = require("express-async-handler");

const fs = require("fs");
const { v4: uuidv4 } = require("uuid");
const path = require("path");

const { makeFile } = require("../utils/helpers");

const addTeam = asyncHandler(async (req, res) => {
  const {
    teamName,
    teamCity,
    teamStadium,
    teamLogo,
    logoName,
    foundedIn,
    stadiumCapacity,
  } = req.body;

  const verifyTeam = await TeamModel.findOne({
    teamName: req.body.teamName,
  });

  if (!verifyTeam) {
    const teamLogoPath = makeFile(teamLogo, logoName);

    if (teamLogoPath) {
      await new TeamModel({
        teamName,
        teamCity,
        teamStadium,
        teamLogo: teamLogoPath,
        stadiumCapacity,
        foundedIn,
      }).save();
      res.status(201).send(`${teamName} added Successfully `);
    } else {
      res.status(422).json("Error saving image. Please try again!");
    }
  } else {
    res.status(404).send(`${teamName} EXIST.`);
  }
});

const getTeams = asyncHandler(async (req, res) => {
  const team = await TeamModel.find();
  res.status(200).send(team);
});

const getTeam = asyncHandler(async (req, res) => {
  const team = await TeamModel.find({ teamId: req.params.id });

  res.status(200).send(team);
});

const updateTeam = asyncHandler(async (req, res) => {
  const { teamName, teamCity, teamStadium, teamLogo, logoName } = req.body;
  console.log(
    teamCity,
    teamName,
    teamStadium,
    teamLogo !== "",
    req.params.teamId
  );

  const newData = {
    teamName,
    teamCity,
    teamStadium,
  };

  // if image is changed
  if (teamLogo !== "") {
    const filePath = makeFile(teamLogo, logoName);
    console.log(filePath);

    if (filePath !== "") {
      newData.teamLogo = filePath;
    }
  }
  console.log(newData);

  const verifyTeam = await TeamModel.findOne({ teamId: req.params.teamId });

  if (verifyTeam) {
    await TeamModel.updateOne(
      {
        teamId: req.params.teamId,
      },
      {
        $set: newData,
      }
    );
    res.status(201).send(`${teamName} Info updated Successfully `);
  } else {
    console.log("NO Team");
    res.status(404).send(`${teamName} EXIST.`);
  }
});

const deleteTeam = asyncHandler(async (req, res) => {
  const deletedTeam = await TeamModel.deleteOne({ teamId: req.params.teamId });
  console.log(deletedTeam);
  res.status(204).send(`Team is removed.`);
});

module.exports = {
  addTeam,
  getTeams,
  getTeam,
  updateTeam,
  deleteTeam,
};
