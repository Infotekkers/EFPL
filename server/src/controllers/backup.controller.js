const asyncHandler = require("express-async-handler");

const Teams = require("../models/Teams");
const Players = require("../models/Player");
const Fixture = require("../models/Fixtures");

const Backup = require("../models/Backup");
const { moveFile } = require("../utils/helpers");

// check if any live or unplayed match
const verifySeasonStatus = asyncHandler(async (req, res) => {
  const liveFixture = await Fixture.find({
    $or: [
      { status: "scheduled" },
      { status: "liveFH" },
      { status: "HT" },
      { status: "liveSH" },
    ],
  });

  let status = true;

  if (liveFixture.length > 0) {
    status = false;
  }
  res.status(200).send(status);
});

// export data to legacy db
const backup = asyncHandler(async (req, res) => {
  // // backup type
  const backupType = req.params.type;

  // TODO:Make Dynamic
  const seasonId = "21/22";

  // get info from current season
  const currentSeasonTeams = await Teams.find();
  const currentSeasonPlayers = await Players.find();
  const currentSeasonFixtures = await Fixture.find();

  /*
    =================================
    Backup Teams
    =================================
  */
  currentSeasonTeams.forEach(async (team) => {
    const verifyExistence = await Backup.teamBkModel.find({
      teamName: team.teamName,
    });
    // delete if team exists
    if (verifyExistence.length > 0) {
      await Backup.teamBkModel.deleteOne({ teamName: team.teamName });
    }

    const teamName = team.teamName;
    const teamNameAmh = team.teamNameAmh;
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
      teamLogo: `/uploads/legacy/teams/${fileName[fileName.length - 1]}`,
      stadiumCapacity,
      foundedIn,
      teamCoach,
      teamId,
      teamNameAmh,
    });
  });

  /*
    =================================
    Backup Players
    =================================
  */
  currentSeasonPlayers.forEach(async (player) => {
    const verifyExistence = await Backup.playersBkModel.find({
      playerName: player.playerName,
      eplTeamId: player.eplTeamId,
      position: player.position,
    });

    if (verifyExistence.length > 0) {
      await Backup.playersBkModel.deleteOne({
        playerName: player.playerName,
        eplTeamId: player.eplTeamId,
        position: player.position,
      });
    }

    const playerName = player.playerName;
    const playerNameAmh = player.playerName;
    const eplTeamId = player.eplTeamId;
    const currentPrice = player.currentPrice;
    const position = player.position;

    const score = player.score;
    const history = player.history;
    const playerId = player.playerId;
    const playerImage = player.playerImage;

    let imagePath = "";

    // Move image here
    if (player.playerImage) {
      const fileName = playerImage.split("/");
      imagePath = await moveFile(
        "." + playerImage,
        `./uploads/legacy/teams/${fileName[fileName.length - 1]}`
      );
    }

    await Backup.playersBkModel.create({
      playerName,
      playerNameAmh,
      eplTeamId,
      currentPrice,
      position,
      score,
      history,
      playerId,
      playerImage: imagePath,
    });
  });

  // back up fixture
  currentSeasonFixtures.forEach(async (fixture) => {
    const verifyExistence = await Backup.fixtureBkModel.find({
      matchId: fixture.matchId,
    });

    if (verifyExistence > 0) {
      await Backup.playersBkModel.deleteOne({
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

  if (backupType === "complete") {
    // Delete teams
    await Teams.deleteMany();
    // delete players
    await Players.deleteMany();
    // delete fixtures
    await Fixture.deleteMany();
  }

  if (
    currentSeasonTeams.length > 0 ||
    currentSeasonFixtures.length > 0 ||
    currentSeasonPlayers.length > 0
  ) {
    res.status(200).json("Season Data Successfully Exported");
  }
  // if nothing is exported
  else {
    res.status(422).json("Info Already exported.");
  }
});

// import data from legacy db
const restore = asyncHandler(async (req, res) => {
  const { importSelectedTeams } = req.body;

  // import teams
  for (let index = 0; index < importSelectedTeams.length; index++) {
    let currentTeam = await Backup.teamBkModel.find({
      teamId: importSelectedTeams[index],
    });
    currentTeam = currentTeam[index];

    const fileName = currentTeam.teamLogo.split("/");

    // Move file
    await moveFile(
      "." + currentTeam.teamLogo,
      `./uploads/teams/${fileName[fileName.length - 1]}`
    );

    const addNewTeam = {
      teamName: currentTeam.teamName,
      teamNameAmh: currentTeam.teamNameAmh,
      teamCity: currentTeam.teamCity,
      teamStadium: currentTeam.teamStadium,
      teamLogo: `/uploads/teams/${fileName[fileName.length - 1]}`,
      stadiumCapacity: currentTeam.stadiumCapacity,
      foundedIn: currentTeam.foundedIn,
      teamCoach: currentTeam.teamCoach,
    };

    await Teams.create(addNewTeam);

    const allPlayers = await Backup.playersBkModel
      .find({
        eplTeamId: importSelectedTeams[index],
      })
      .lean();

    for (let i = 0; i < allPlayers.length; i++) {
      let fileName = "";
      allPlayers[i].score = [];
      allPlayers[i].history = [];

      if (allPlayers[i].playerImage) {
        fileName = allPlayers[i].playerImage.split("/");

        // Move file
        await moveFile(
          "." + allPlayers[i].playerImage,
          `./uploads/players/${fileName[fileName.length - 1]}`
        );
      }

      await Players.create({
        playerName: allPlayers[i].playerName,
        eplTeamId: allPlayers[i].eplTeamId,
        currentPrice: allPlayers[i].currentPrice,
        position: allPlayers[i].position,
        score: [],
        history: [],
        playerImage: fileName
          ? `/uploads/players/${fileName[fileName.length - 1]}`
          : "",
      });
    }
  }

  res.status(201).json("Import Complete");
});

// get teams from legacy db
const viewTeam = asyncHandler(async (req, res) => {
  const data = await Backup.teamBkModel
    .find()
    .select("teamName teamCity teamLogo teamId");

  const importedTeams = [];

  // check if team is in season db
  for (let i = 0; i < data.length; i++) {
    const existing = await Teams.find({ teamName: data[i].teamName });

    if (existing.length === 0) {
      importedTeams.push(data[i]);
    }
  }

  res.status(200).json(importedTeams);
});

// get players from legacy db
const viewPlayer = asyncHandler(async (req, res) => {
  const data = await Backup.playersBkModel
    .find({ eplTeamId: req.params.teamId })
    .select("playerName eplTeamId position playerId");

  res.status(200).json(data);
});

module.exports = { backup, restore, viewTeam, viewPlayer, verifySeasonStatus };
