const asyncHandler = require("express-async-handler");
const fs = require("fs");

const Teams = require("../models/Teams");
const Players = require("../models/Player");
const Fixture = require("../models/Fixtures");

const Backup = require("../models/Backup");
const { moveFile } = require("../utils/helpers");
//   );
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
    console.log(teamLogo);

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
    });
  });

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

  res.send(currentSeasonTeams);
});
const restore = asyncHandler(async (req, res) => {
  const season = req.params.id;
  try {
    const data = fs.readFileSync(`src/controllers/f/${season}-team.json`);
    const docs = JSON.parse(data.toString());
    res.send(docs);
  } catch (err) {
    if (err.errno === -4058) {
      res.status(422).json({ message: `No data for season ${season}` });
    } else {
      res.send(err);
    }
  }
});

module.exports = { backup, restore };
