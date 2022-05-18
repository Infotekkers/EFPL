const asyncHandler = require("express-async-handler");
const statUpdater = require("../utils/helpers").statUpdater;
const validator = require("../utils/validators");

const FixtureModel = require("../models/Fixtures");
const TeamModel = require("../models/Teams");
const Player = require("../models/Player");
const GameWeek = require("../models/GameWeek");

const MINUTE_COUNTERS = {};

const postFixture = asyncHandler(async function (req, res) {
  const { gameweekId, schedule, homeTeam, awayTeam } = req.body;

  // query team for id
  const homeTeamData = await TeamModel.findOne({ teamName: homeTeam });
  const awayTeamData = await TeamModel.findOne({ teamName: awayTeam });
  const matchId = `${homeTeamData.teamId}|${awayTeamData.teamId}`;
  const matchStat = {
    minutesPlayed: {},
    goalsScored: {},
    assists: {},
    yellows: {},
    cleanSheet: {},
    reds: {},
    penaltiesMissed: {},
    penaltiesSaved: {},
    saves: {},
    ownGoal: {},
    fantasyScores: {},
  };

  const verifyMatch = await FixtureModel.find({ matchId: matchId });

  const homeTeamHasMatch = await FixtureModel.find({
    gameweekId: gameweekId,
    homeTeam: homeTeam,
  });

  const awayTeamHasMatch = await FixtureModel.find({
    gameweekId: gameweekId,
    awayTeam: awayTeam,
  });

  // If home team already has match
  if (homeTeamHasMatch.length > 0) {
    res
      .status(409)
      .send(
        `Team ${homeTeam} already has a match for game week ${gameweekId}.`
      );
  } else if (awayTeamHasMatch.length > 0) {
    res
      .status(409)
      .send(
        `Team ${awayTeam} already has a match for game week ${gameweekId}.`
      );
  } else if (!verifyMatch.length) {
    await new FixtureModel({
      gameweekId,
      matchId,
      schedule,
      homeTeam,
      awayTeam,
      matchStat,
    }).save();
    res.status(200).send("Fixture added!");
  } else {
    res
      .status(409)
      .send(
        `Fixture ${homeTeam} vs ${awayTeam} already exists for game week ${verifyMatch[0].gameweekId}.`
      );
  }
});

const startFixture = asyncHandler(async function (req, res) {
  const matchId = req.params.matchId;

  const matchParent = await FixtureModel.findOne({ matchId });

  const gameweekId = matchParent.gameweekId;

  // validate if match has lineup
  let hasLineup = false;
  if (matchParent.awayTeamLineUp && matchParent.homeTeamLineUp) {
    if (
      matchParent.awayTeamLineUp.lineup &&
      matchParent.homeTeamLineUp.lineup
    ) {
      hasLineup = true;
    }
  } else {
    hasLineup = false;
  }

  if (hasLineup) {
    const homeTeam = await TeamModel.find({
      teamId: parseInt(matchId.split("|")[0]),
    });

    const awayTeam = await TeamModel.find({
      teamId: parseInt(matchId.split("|")[1]),
    });

    let homePlayers = await Player.find({
      eplTeamId: homeTeam[0].teamName,
    });
    let awayPlayers = await Player.find({
      eplTeamId: awayTeam[0].teamName,
    });

    // Initialize match stats
    for (const player of homePlayers) {
      const playerId = player.playerId;
      // Update stats in fixtures model
      matchParent.matchStat.minutesPlayed.set(String(playerId), {
        playerId,
        noOfMinutes: 0,
      });
      matchParent.matchStat.goalsScored.set(String(playerId), {
        playerId,
        noOfGoals: 0,
      });
      matchParent.matchStat.assists.set(String(playerId), {
        playerId,
        noOfAssists: 0,
      });
      matchParent.matchStat.cleanSheet.set(String(playerId), {
        playerId,
        noOfCleanSheets: 0,
      });
      matchParent.matchStat.yellows.set(String(playerId), {
        playerId,
        noOfYellows: 0,
      });
      matchParent.matchStat.reds.set(String(playerId), {
        playerId,
        noOfReds: 0,
      });
      matchParent.matchStat.penaltiesMissed.set(String(playerId), {
        playerId,
        noOfPenMissed: 0,
      });
      matchParent.matchStat.penaltiesSaved.set(String(playerId), {
        playerId,
        noOfPenSaved: 0,
      });
      matchParent.matchStat.saves.set(String(playerId), {
        playerId,
        noOfSaves: 0,
      });
      matchParent.matchStat.ownGoal.set(String(playerId), {
        playerId,
        noOfOwnGoals: 0,
      });
      matchParent.matchStat.fantasyScores.set(String(playerId), {
        playerId,
        playerScores: 0,
      });

      // Update stats in player model
      const gameweekIndex = gameweekId - 1;
      player.score.push({});
      player.score[gameweekIndex].gameweekId = gameweekId;
      player.score[gameweekIndex].minutesPlayed = 0;
      player.score[gameweekIndex].goals = 0;
      player.score[gameweekIndex].assists = 0;
      player.score[gameweekIndex].cleanSheet = 0;
      player.score[gameweekIndex].yellows = 0;
      player.score[gameweekIndex].reds = 0;
      player.score[gameweekIndex].penalitiesMissed = 0;
      player.score[gameweekIndex].penalitiesSaved = 0;
      player.score[gameweekIndex].saves = 0;
      player.score[gameweekIndex].ownGoal = 0;
      player.score[gameweekIndex].fantasyScore = 0;

      await Player.findOneAndUpdate({ playerId }, player);
    }
    for (const player of awayPlayers) {
      const playerId = player.playerId;
      // Update stats in fixtures model
      matchParent.matchStat.minutesPlayed.set(String(playerId), {
        playerId,
        noOfMinutes: 0,
      });
      matchParent.matchStat.goalsScored.set(String(playerId), {
        playerId,
        noOfGoals: 0,
      });
      matchParent.matchStat.assists.set(String(playerId), {
        playerId,
        noOfAssists: 0,
      });
      matchParent.matchStat.cleanSheet.set(String(playerId), {
        playerId,
        noOfCleanSheets: 0,
      });
      matchParent.matchStat.yellows.set(String(playerId), {
        playerId,
        noOfYellows: 0,
      });
      matchParent.matchStat.reds.set(String(playerId), {
        playerId,
        noOfReds: 0,
      });
      matchParent.matchStat.penaltiesMissed.set(String(playerId), {
        playerId,
        noOfPenMissed: 0,
      });
      matchParent.matchStat.penaltiesSaved.set(String(playerId), {
        playerId,
        noOfPenSaved: 0,
      });
      matchParent.matchStat.saves.set(String(playerId), {
        playerId,
        noOfSaves: 0,
      });
      matchParent.matchStat.ownGoal.set(String(playerId), {
        playerId,
        noOfOwnGoals: 0,
      });
      matchParent.matchStat.fantasyScores.set(String(playerId), {
        playerId,
        playerScores: 0,
      });

      // Update stats in player model
      const gameweekIndex = gameweekId - 1;
      player.score.push({});
      player.score[gameweekIndex].gameweekId = gameweekId;
      player.score[gameweekIndex].minutesPlayed = 0;
      player.score[gameweekIndex].goals = 0;
      player.score[gameweekIndex].assists = 0;
      player.score[gameweekIndex].cleanSheet = 0;
      player.score[gameweekIndex].yellows = 0;
      player.score[gameweekIndex].reds = 0;
      player.score[gameweekIndex].penalitiesMissed = 0;
      player.score[gameweekIndex].penalitiesSaved = 0;
      player.score[gameweekIndex].saves = 0;
      player.score[gameweekIndex].ownGoal = 0;
      player.score[gameweekIndex].fantasyScore = 0;

      await Player.findOneAndUpdate({ playerId }, player);
    }

    await matchParent.save();

    homePlayers = Object.fromEntries(
      new Map(homePlayers.map((obj) => [String(obj.playerId), obj]))
    );
    awayPlayers = Object.fromEntries(
      new Map(awayPlayers.map((obj) => [String(obj.playerId), obj]))
    );

    if (matchParent?.status === "scheduled") {
      matchParent.status = "liveFH"; // First half

      // Minutes Counter Id saved so it can be cleared when the match is done
      MINUTE_COUNTERS[matchId] = { status: "active" };
      MINUTE_COUNTERS[matchId].intervalId = setInterval(async () => {
        if (MINUTE_COUNTERS[matchId].status === "active") {
          // TODO: Calculate clean sheets
          console.log("MINUTE COUNTER ->");
          const match = await FixtureModel.findOne({ matchId }).lean();

          // !! MIGHT RESET MINUTESPLAYED OBJ
          const update = { minutesPlayed: 0 };
          const result = {
            updatedMatch: {},
            updatedPlayers: [],
          };

          for (const position in match.homeTeamLineUp.lineup) {
            if (position === "bench") continue;
            for (const playerId of match.homeTeamLineUp.lineup[position]) {
              update.gameweekId = gameweekId;
              update.minutesPlayed =
                homePlayers[playerId].get("score")[gameweekId - 1]
                  .minutesPlayed + 1;

              const { updatedMatch, updatedPlayer } = statUpdater({
                activeMatch: match,
                activePlayer: homePlayers[playerId],
                incomingUpdate: update,
              });

              result.updatedMatch = updatedMatch;
              result.updatedPlayers.push(updatedPlayer);
            }
          }

          for (const position in match.awayTeamLineUp.lineup) {
            if (position === "bench") continue;
            for (const playerId of match.awayTeamLineUp.lineup[position]) {
              update.gameweekId = gameweekId;
              update.minutesPlayed =
                awayPlayers[playerId].get("score")[gameweekId - 1]
                  .minutesPlayed + 1;

              const { updatedMatch, updatedPlayer } = statUpdater({
                activeMatch: match,
                activePlayer: awayPlayers[playerId],
                incomingUpdate: update,
              });

              result.updatedMatch = updatedMatch;
              result.updatedPlayers.push(updatedPlayer);
            }
          }

          await FixtureModel.findOneAndUpdate({ matchId }, result.updatedMatch);
          for (const player of result.updatedPlayers) {
            await Player.findOneAndUpdate(
              { playerId: player.playerId },
              player
            );
          }
        }
      }, 60000);

      matchParent
        .save()
        .then(() =>
          res
            .status(200)
            .send(
              `Match ${homeTeam[0].teamName} vs ${awayTeam[0].teamName} is live!`
            )
        )
        .catch(() => res.status(500).send("Try again!"));
    }
    // no match
    else if (!matchParent) {
      res
        .status(404)
        .send(
          `Match ${homeTeam[0].teamName} vs ${awayTeam[0].teamName} doesn't exist!`
        );
    }
    // match is live
    else if (matchParent.status === "FT") {
      res
        .status(400)
        .send(
          `Match ${homeTeam[0].teamName} vs ${awayTeam[0].teamName} has already ended!`
        );
    }
    // resume
    else {
      res
        .status(400)
        .send(
          `Match ${homeTeam[0].teamName} vs ${awayTeam[0].teamName} is already live! Try using /fixtures/resume instead.`
        );
    }
  } else {
    res.status(422).send("Fixture requires lineup to start.");
  }
});

const pauseFixture = asyncHandler(async function (req, res) {
  const match = await FixtureModel.findOne({ matchId: req.params.matchId });

  const homeTeam = await TeamModel.find({
    teamId: parseInt(req.params.matchId.split("|")[0]),
  });

  const awayTeam = await TeamModel.find({
    teamId: parseInt(req.params.matchId.split("|")[1]),
  });

  if (match?.status === "liveFH") {
    match.status = "HT";

    MINUTE_COUNTERS[req.params.matchId].status = "paused";

    match
      .save()
      .then(() => {
        res.send(
          `Half Time for match ${homeTeam[0].teamName} vs ${awayTeam[0].teamName}!`
        );
      })
      .catch(() => res.status(500).send("Try again!"));
  } else if (!match) {
    res
      .status(404)
      .send(
        `Match ${homeTeam[0].teamName} vs ${awayTeam[0].teamName} doesn't exist!`
      );
  } else if (match.status === "FT") {
    res
      .status(400)
      .send(
        `Match ${homeTeam[0].teamName} vs ${awayTeam[0].teamName} has already ended!`
      );
  } else {
    res
      .status(400)
      .send(
        `Match ${homeTeam[0].teamName} vs ${awayTeam[0].teamName} is not live yet!`
      );
  }
});

const resumeFixture = asyncHandler(async function (req, res) {
  const match = await FixtureModel.findOne({ matchId: req.params.matchId });

  MINUTE_COUNTERS[req.params.matchId].status = "active";
  const homeTeam = await TeamModel.find({
    teamId: parseInt(req.params.matchId.split("|")[0]),
  });

  const awayTeam = await TeamModel.find({
    teamId: parseInt(req.params.matchId.split("|")[1]),
  });

  if (match?.status === "HT") {
    match.status = "liveSH"; // Second half
    match
      .save()
      .then(() =>
        res.send(
          `Match ${homeTeam[0].teamName} vs ${awayTeam[0].teamName} resumed!`
        )
      )
      .catch(() => res.status(500).send("Try again!"));
  } else if (!match) {
    res
      .status(404)
      .send(
        `Match ${homeTeam[0].teamName} vs ${awayTeam[0].teamName} doesn't exist!`
      );
  } else if (match.status === "FT") {
    res
      .status(400)
      .send(
        `Match ${homeTeam[0].teamName} vs ${awayTeam[0].teamName} has already ended!`
      );
  } else {
    res
      .status(400)
      .send(
        `Match ${homeTeam[0].teamName} vs ${awayTeam[0].teamName} can not be resumed!`
      );
  }
});

const endFixture = asyncHandler(async function (req, res) {
  const match = await FixtureModel.findOne({ matchId: req.params.matchId });

  const homeTeam = await TeamModel.find({
    teamId: parseInt(req.params.matchId.split("|")[0]),
  });

  const awayTeam = await TeamModel.find({
    teamId: parseInt(req.params.matchId.split("|")[1]),
  });

  if (match?.status === "liveSH") {
    match.status = "FT";

    MINUTE_COUNTERS[req.params.matchId].status = "ended";
    clearInterval(MINUTE_COUNTERS[req.params.matchId].intervalId);

    match
      .save()
      .then(() =>
        res.send(
          `Full time for match ${homeTeam[0].teamName} vs ${awayTeam[0].teamName}!`
        )
      )
      .catch(() => res.status(500).send("Try again!"));
  } else if (!match) {
    res
      .status(404)
      .send(
        `Match ${homeTeam[0].teamName} vs ${awayTeam[0].teamName} doesn't exist!`
      );
  } else if (match.status === "FT") {
    res
      .status(400)
      .send(
        `Match ${homeTeam[0].teamName} vs ${awayTeam[0].teamName} has already ended!`
      );
  } else {
    res
      .status(400)
      .send(
        `Match ${homeTeam[0].teamName} vs ${awayTeam[0].teamName} can not be ended!`
      );
  }
});

const postponeFixture = asyncHandler(async function (req, res) {
  const match = await FixtureModel.findOne({ matchId: req.params.matchId });
  const { gameweekId, schedule, homeTeam, awayTeam, matchStatus } = req.body;

  // Compare old and new match
  if (match) {
    if (match.homeTeam === homeTeam && match.awayTeam === awayTeam) {
      match.gameweekId = gameweekId ?? match.gameweekId;
      match.schedule = schedule ?? match.schedule;
      match.status = matchStatus ?? match.status;
      match.homeTeam = homeTeam ?? match.homeTeam;
      match.awayTeam = awayTeam ?? match.awayTeam;

      await match.save();

      res
        .status(200)
        .send(`Match ${homeTeam} vs ${awayTeam} updated successfully`);
    } else {
      const homeTeamNew = await TeamModel.find({
        teamName: homeTeam,
      });

      const awayTeamNew = await TeamModel.find({
        teamName: awayTeam,
      });

      await match.delete();

      await new FixtureModel({
        gameweekId: gameweekId,
        schedule: schedule,
        matchId: `${homeTeamNew[0].teamId}|${awayTeamNew[0].teamId}`,
        status: matchStatus ?? "scheduled",
        homeTeam: homeTeam,
        awayTeam: awayTeam,
      }).save();

      res.status(200).send(`Match updated to ${homeTeam} vs ${awayTeam}`);
    }
  } else if (!match) {
    res.status(404).send("Match doesn't exist!");
  } else {
    res.status(400).send(`Match with Id ${req.params.matchId} doesn't exist.`);
  }
});

const updateFixture = asyncHandler(async function (req, res) {
  const { gameweekId, schedule, status, homeTeam, awayTeam } = req.body;

  const matchId = req.params.matchId;

  const match = await FixtureModel.findOne({ matchId });

  if (match) {
    if (match.status === "scheduled") {
      match.gameweekId = gameweekId ?? match.gameweekId;
      match.matchId = matchId ?? match.matchId;
      match.schedule = schedule ?? match.schedule;
      match.status = status ?? match.status;
      match.homeTeam = homeTeam ?? match.homeTeam;
      match.awayTeam = awayTeam ?? match.awayTeam;
      await match.save();

      const io = require("../../server");
      io.emit("fixtureUpdated");

      res.send("Match updated!");
    } else {
      res.status(422).send("Live Match can not be updated");
    }
  } else if (!match) {
    res.status(404).send("Match doesn't exist!");
  } else {
    res.status(400).send("Match with provided matchid doesn't exist.");
  }
});

const updateLineup = asyncHandler(async (req, res) => {
  const { homeTeamLineUp, awayTeamLineUp } = req.body;

  const matchId = req.params.matchId;

  const match = await FixtureModel.findOne({ matchId });

  if (match) {
    match.homeTeamLineUp = homeTeamLineUp ?? match.homeTeamLineUp;
    match.awayTeamLineUp = awayTeamLineUp ?? match.awayTeamLineUp;
    await match.save();

    res.send("Match lineup updated!");
  } else if (!match) {
    res.status(404).send("Match doesn't exist!");
  } else {
    res.status(400).send("Match with provided matchid doesn't exist.");
  }
});

const updateStats = asyncHandler(async (req, res) => {
  const matchId = req.params.matchId;

  const match = await FixtureModel.findOne({ matchId }).lean();

  const playerId = req.body.playerId;

  const player = await Player.findOne({ playerId }).lean();

  if (match) {
    const { updatedMatch, updatedPlayer } = statUpdater({
      activeMatch: match,
      activePlayer: player,
      incomingUpdate: req.body,
    });

    await FixtureModel.findOneAndUpdate({ matchId }, updatedMatch, {
      upsert: false,
    });

    await Player.findOneAndUpdate({ playerId }, updatedPlayer, {
      upsert: false,
    });

    res.send("Match stats updated!");
  } else if (!match) {
    res.status(404).send("Match doesn't exist!");
  } else {
    res.status(400).send("Match with provided matchid doesn't exist.");
  }
});

const updateScore = asyncHandler(async (req, res) => {
  const matchId = req.params.matchId;
  const { score } = req.body;

  const match = await FixtureModel.findOne({ matchId });

  if (match) {
    if (!match.score) match.score = "0v0";
    match.score = score;

    await match.save();

    res.send("Match score updated!");
  } else if (!match) {
    res.status(404).send("Match doesn't exist!");
  } else {
    res.status(400).send("Match with provided matchid doesn't exist.");
  }
});

const getAllFixtures = asyncHandler(async function (req, res) {
  const matches = await FixtureModel.find().select("-__v");

  res.status(200).send(matches);
});

const getFixture = asyncHandler(async function (req, res) {
  const match = await FixtureModel.findOne({
    matchId: req.params.matchId,
  }).select("-__v");

  match
    ? res.send(match)
    : res.status(400).send("Fixture with provided matchid doesn't exist.");
});

const deleteFixture = asyncHandler(async function (req, res) {
  const match = await FixtureModel.find({ matchId: req.params.matchId });

  if (match && match[0].status !== "scheduled") {
    res.status(422).send("Live match can not be deleted");
  }
  //
  else {
    const deleted = await FixtureModel.deleteOne({
      matchId: req.params.matchId,
    });
    deleted
      ? res.send("Match deleted!")
      : res.status(400).send("Match with provided matchid doesn't exist");
  }
});

const getAllFixturesOfGameWeek = asyncHandler(async function (req, res) {
  const gwId = req.params.gameWeekId;

  let gameWeekId = 1;

  if (gwId.toString() === "0") {
    const activeGw = await GameWeek.find({ status: "active" });

    if (activeGw.length > 0) {
      gameWeekId = activeGw[activeGw.length - 1].gameWeekNumber;
    }
  } else {
    gameWeekId = gwId;
  }

  const matches = await FixtureModel.find({ gameweekId: gameWeekId })
    .select({
      _id: 0,
      __v: 0,
      // matchStat: 0,
    })
    .sort("schedule");

  const matchAndTeamInfo = [];

  for (let i = 0; i < matches.length; i++) {
    const currMatch = {};
    const homeTeamInfo = await TeamModel.findOne({
      teamName: matches[i].homeTeam,
    }).select({ _id: 0, __v: 0, teamId: 0, teamName: 0, foundedIn: 0 });

    const awayTeamInfo = await TeamModel.findOne({
      teamName: matches[i].awayTeam,
    }).select({ _id: 0, __v: 0, teamId: 0, teamName: 0, foundedIn: 0 });

    currMatch.gameWeekId = matches[i].gameweekId;
    currMatch.matchId = matches[i].matchId;
    currMatch.schedule = matches[i].schedule;
    currMatch.status = matches[i].status;
    currMatch.score = matches[i].score;
    currMatch.homeTeam = matches[i].homeTeam;
    currMatch.awayTeam = matches[i].awayTeam;

    currMatch.homeTeamCity = homeTeamInfo.teamCity;
    currMatch.homeTeamStadium = homeTeamInfo.teamStadium;
    currMatch.homeTeamLogo = homeTeamInfo.teamLogo;
    currMatch.homeTeamCapacity = homeTeamInfo.stadiumCapacity;
    currMatch.homeTeamCoach = homeTeamInfo.teamCoach;

    currMatch.awayTeamCity = awayTeamInfo.teamCity;
    currMatch.awayTeamStadium = awayTeamInfo.teamStadium;
    currMatch.awayTeamLogo = awayTeamInfo.teamLogo;
    currMatch.awayTeamCapacity = awayTeamInfo.stadiumCapacity;
    currMatch.awayTeamCoach = awayTeamInfo.teamCoach;

    const processFinalLineup = await validator.processTeamIdToData(matches[i]);

    currMatch.homeTeamLineUp = processFinalLineup[0];
    currMatch.awayTeamLineUp = processFinalLineup[1];

    matchAndTeamInfo.push(currMatch);
  }

  res.status(200).send(matchAndTeamInfo);
});

const getFixtureDetail = asyncHandler(async function (req, res) {
  const matchId = req.params.matchId;
  const match = await FixtureModel.findOne({ matchId: matchId }).select(
    "matchStat score homeTeamLineUp awayTeamLineUp status"
  );

  res.status(200).send(match);
});

module.exports = {
  postFixture,
  startFixture,
  pauseFixture,
  resumeFixture,
  endFixture,
  postponeFixture,
  getAllFixtures,
  getFixture,
  deleteFixture,
  updateFixture,
  updateLineup,
  updateStats,
  updateScore,

  // New
  getAllFixturesOfGameWeek,
  getFixtureDetail,
};
