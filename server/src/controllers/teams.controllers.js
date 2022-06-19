const TeamModel = require("../models/Teams");
const FixtureModel = require("../models/Fixtures");
const asyncHandler = require("express-async-handler");

const { makeFile } = require("../utils/helpers");
const Player = require("../models/Player");

const addTeam = asyncHandler(async (req, res) => {
  const {
    teamName,
    teamCity,
    teamStadium,
    teamLogo,
    logoName,
    foundedIn,
    stadiumCapacity,
    teamCoach,
    teamNameAmh,
  } = req.body;

  const verifyTeam = await TeamModel.findOne({
    teamName: req.body.teamName,
  });

  if (!verifyTeam) {
    // if base64 is sent
    if (logoName) {
      const teamLogoPath = makeFile(teamLogo, logoName);

      if (teamLogoPath) {
        await new TeamModel({
          teamName,
          teamCity,
          teamStadium,
          teamLogo: teamLogoPath,
          stadiumCapacity,
          foundedIn,
          teamCoach,
          teamNameAmh,
        }).save();
        res.status(201).send(`${teamName} added Successfully `);
      }
    }
    // if path exists
    else {
      await new TeamModel({
        teamName,
        teamCity,
        teamStadium,
        teamLogo: teamLogo,
        stadiumCapacity,
        foundedIn,
        teamCoach,
        teamNameAmh,
      }).save();
      res.status(201).send(`${teamName} added Successfully `);
    }
  } else {
    res.status(404).send(`${teamName} EXIST.`);
  }
});

const getTeams = asyncHandler(async (req, res) => {
  const team = await TeamModel.find().sort("teamName");
  res.status(200).send(team);
});

const getTeam = asyncHandler(async (req, res) => {
  const team = await TeamModel.find({ teamId: req.params.teamId });
  res.status(200).send(team);
});

const updateTeam = asyncHandler(async (req, res) => {
  console.log("Here");

  const {
    teamName,
    teamCity,
    teamStadium,
    teamLogo,
    logoName,
    teamCoach,
    teamNameAmh,
  } = req.body;

  const newData = {
    teamName,
    teamCity,
    teamStadium,
    teamCoach,
    teamNameAmh,
  };

  // if image is changed
  if (teamLogo !== "") {
    const filePath = makeFile(teamLogo, logoName);

    if (filePath !== "") {
      newData.teamLogo = filePath;
    }
  }

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
    await Player.updateMany(
      {
        eplTeamId: verifyTeam.teamName,
      },
      { eplTeamId: newData.teamName }
    );

    res.status(201).send(`${teamName} Info updated Successfully `);
  } else {
    res.status(404).send(`${teamName} EXIST.`);
  }
});

const deleteTeam = asyncHandler(async (req, res) => {
  // get team name
  const team = await TeamModel.find({ teamId: req.params.teamId });
  const teamName = team[0].teamName;

  // Delete team
  await TeamModel.deleteOne({ teamId: req.params.teamId });

  // Delete fixtures for team
  const deletedFixture = await FixtureModel.find();
  deletedFixture.forEach(async (fixture) => {
    if (fixture.matchId.toString().includes(req.params.teamId)) {
      await FixtureModel.deleteMany({ matchId: fixture.matchId });
    }
  });

  // delete player for teams
  await Player.deleteMany({ eplTeamId: teamName });

  res.status(200).json(`${teamName} removed.`);
});

module.exports = {
  addTeam,
  getTeams,
  getTeam,
  updateTeam,
  deleteTeam,
};
