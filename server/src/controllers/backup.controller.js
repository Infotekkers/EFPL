const asyncHandler = require("express-async-handler");

const Teams = require("../models/Teams");
const Players = require("../models/Player");
const Fixture = require("../models/Fixtures");

const Backup = require("../models/Backup");
const { moveFile } = require("../utils/helpers");

const backup = asyncHandler(async (req, res) => {
  const seasonId = "21/22";
  const currentSeasonTeams = await Teams.find();
  const currentSeasonPlayers = await Players.find();
  const currentSeasonFixtures = await Fixture.find();

  currentSeasonTeams.forEach(async (team) => {
    const verifyExistence = await Backup.teamBkModel.find({
      teamName: team.teamName,
    });
    if (verifyExistence.length > 0) {
      await Backup.teamBkModel.deleteOne({ teamName: team.teamName });
    }

    const teamName = team.teamName;
    const teamCity = team.teamCity;
    const teamStadium = team.teamStadium;
    const teamLogo = team.teamLogo;
    const stadiumCapacity = team.stadiumCapacity;
    const foundedIn = team.foundedIn;
    const teamCoach = team.teamCoach;
    const teamId = team.teamId;

    const fileName = teamLogo.split("/");

    // Move logo here
    await moveFile(
      "." + teamLogo,
      `./uploads/legacy/teams/${fileName[fileName.length - 1]}`
    );

    await Backup.teamBkModel.create({
      teamName,
      teamCity,
      teamStadium,
      teamLogo,
      stadiumCapacity,
      foundedIn,
      teamCoach,
      teamId,
    });
  });

  // TODO:CLEAR Teams

  currentSeasonPlayers.forEach(async (player) => {
    const verifyExistence = await Backup.playersBkModel.find({
      playerName: player.playerName,
      eplTeamId: player.eplTeamId,
      position: player.position,
    });

    // TODO:Change Model
    const playerName = player.playerName;
    const eplTeamId = player.eplTeamId;
    const currentPrice = player.currentPrice;
    const position = player.position;
    const availability = player.availability;
    const score = player.score;
    const history = player.history;
    const playerId = player.playerId;

    // Move logo here
    // const logoMove = await moveFile(
    //   "." + teamLogo,
    //   `./uploads/legacy/teams/${fileName[fileName.length - 1]}`
    // );

    if (verifyExistence.length > 0) {
      await Backup.playersBkModel.delete({
        playerName: player.playerName,
        eplTeamId: player.eplTeamId,
        position: player.position,
      });
    }

    await Backup.playersBkModel.create({
      playerName,
      eplTeamId,
      currentPrice,
      position,
      availability,
      score,
      history,
      playerId,
    });
  });

  currentSeasonFixtures.forEach(async (fixture) => {
    const verifyExistence = await Backup.playersBkModel.find({
      gameweekId: fixture.gameweekId,
      matchId: fixture.matchId,
    });

    if (verifyExistence > 0) {
      await Backup.playersBkModel.delete({
        gameweekId: fixture.gameweekId,
        matchId: fixture.matchId,
      });
    }

    const gameweekId = fixture.gameweekId;
    const matchId = fixture.matchId;
    const schedule = fixture.schedule;
    const status = fixture.status;

    const homeTeam = fixture.homeTeam;
    const awayTeam = fixture.awayTeam;
    const homeTeamLineUp = fixture.homeTeamLineUp;
    const awayTeamLineUp = fixture.awayTeamLineUp;
    const matchStat = fixture.matchStatSchema;

    await Backup.fixtureBkModel.create({
      seasonId,
      gameweekId,
      matchId,
      schedule,
      status,
      homeTeam,
      awayTeam,
      homeTeamLineUp,
      awayTeamLineUp,
      matchStat,
    });
  });

  res.status(200).json("Season Data Successfully Exported");
});

const restore = asyncHandler(async (req, res) => {
  const importSelectedTeams = [1, 2, 3, 4, 5];

  importSelectedTeams.forEach(async (team) => {
    let currentTeam = await Backup.teamBkModel.find({ teamId: team });
    currentTeam = currentTeam[0];

    // Move file

    const addNewTeam = {
      teamName: currentTeam.teamName,
      teamCity: currentTeam.teamCity,
      teamStadium: currentTeam.teamStadium,
      teamLogo: "/uploads/teams/Adama-City.png",
      stadiumCapacity: currentTeam.stadiumCapacity,
      foundedIn: currentTeam.foundedIn,
      teamCoach: currentTeam.teamCoach,
    };

    console.log(addNewTeam);

    await Teams.create(addNewTeam);
  });

  res.status(201).json("Done");
});

const viewTeam = asyncHandler(async (req, res) => {
  const data = await Backup.teamBkModel
    .find()
    .select("teamName teamCity teamLogo teamId");

  res.status(200).json(data);
});

const viewPlayer = asyncHandler(async (req, res) => {
  const data = await Backup.playersBkModel
    .find({ eplTeamId: req.params.teamId })
    .select("playerName eplTeamId position playerId");

  res.status(200).json(data);
});

module.exports = { backup, restore, viewTeam, viewPlayer };
