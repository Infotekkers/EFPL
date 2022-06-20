const asyncHandler = require("express-async-handler");
const statUpdater = require("../utils/helpers").statUpdater;
const validator = require("../utils/validators");
const axios = require("axios");
const baseURL = process.env.BASE_URL;
const MLURL = process.env.ML_URL;

const FixtureModel = require("../models/Fixtures");
const TeamModel = require("../models/Teams");
const Player = require("../models/Player");
const GameWeek = require("../models/GameWeek");
const Teams = require("../models/Teams");
const TeamData = require("../utils/data/teams.data");

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

    const io = require("../../server");
    io.emit("fixtureUpdated");

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
        .catch((err) => {
          res.status(500).send("Try again!");
          console.log(err);
        });

      const io = require("../../server");
      io.emit("fixtureUpdated");
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

    // MINUTE_COUNTERS[req.params.matchId].status = "paused";

    match
      .save()
      .then(() => {
        res.send(
          `Half Time for match ${homeTeam[0].teamName} vs ${awayTeam[0].teamName}!`
        );
      })
      .catch(() => res.status(500).send("Try again!"));

    const io = require("../../server");
    io.emit("fixtureUpdated");
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

  // MINUTE_COUNTERS[req.params.matchId].status = "active";
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

    const io = require("../../server");
    io.emit("fixtureUpdated");
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

  const homeTeam = await TeamModel.findOne({
    teamId: parseInt(req.params.matchId.split("|")[0]),
  });

  const awayTeam = await TeamModel.findOne({
    teamId: parseInt(req.params.matchId.split("|")[1]),
  });

  //

  if (match?.status === "liveSH") {
    match.status = "FT";

    //   // MINUTE_COUNTERS[req.params.matchId].status = "ended";
    //   // clearInterval(MINUTE_COUNTERS[req.params.matchId].intervalId);

    /*
      ==================================
      League Table Updates
      ==================================
    */
    const splitscore = match.score.split("v");
    const hometeamScore = splitscore[0];
    const awayteamScore = splitscore[1];
    const awayteamPosition = awayTeam.teamPosition;
    const hometeamPosition = homeTeam.teamPosition;
    const awayteamPoint = awayteamPosition.teamPoint;
    const hometeamPoint = hometeamPosition.teamPoint;

    // Home Team Win
    if (hometeamScore > awayteamScore) {
      const teamPoint = hometeamPoint + 3;
      const hometeamGoalDce = hometeamScore - awayteamScore;
      homeTeam.teamPosition.teamPoint = teamPoint;
      homeTeam.teamPosition.won += 1;
      homeTeam.teamPosition.goalDifferential += hometeamGoalDce;
      homeTeam.teamPosition.goalsFor += parseInt(hometeamScore);
      homeTeam.teamPosition.goalsAgainst += parseInt(awayteamScore);

      awayTeam.teamPosition.goalsFor += parseInt(awayteamScore);
      awayTeam.teamPosition.goalDifferential += awayteamScore - hometeamScore;
      awayTeam.teamPosition.goalsAgainst += parseInt(hometeamScore);
      awayTeam.teamPosition.lost += 1;

      await awayTeam.save();
      await homeTeam.save();
    }
    // draw
    else if (hometeamScore === awayteamScore) {
      const Hteampoint = hometeamPoint + 1;
      const Ateampoint = awayteamPoint + 1;
      const hometeamGoalDce = hometeamScore - awayteamScore;
      homeTeam.teamPosition.teamPoint += Hteampoint;
      homeTeam.teamPosition.Draw += 1;
      homeTeam.teamPosition.goalDifferential += parseInt(hometeamGoalDce);
      homeTeam.teamPosition.goalsFor += parseInt(hometeamScore);
      homeTeam.teamPosition.goalsAgainst += parseInt(awayteamScore);

      const awayteamGoalDce = awayteamScore - hometeamScore;
      awayTeam.teamPosition.teamPoint = Ateampoint;
      awayTeam.teamPosition.Draw += 1;
      awayTeam.teamPosition.goalDifferential += parseInt(awayteamGoalDce);
      awayTeam.teamPosition.goalsFor += parseInt(awayteamScore);
      awayTeam.teamPosition.goalsAgainst += parseInt(hometeamScore);

      await homeTeam.save();
      await awayTeam.save();
    }
    // away team win
    else {
      const Ateampoint = awayteamPoint + 3;

      const awayteamGoalDce = awayteamScore - hometeamScore;
      awayTeam.teamPosition.teamPoint = Ateampoint;
      awayTeam.teamPosition.won += 1;
      awayTeam.teamPosition.goalDifferential += parseInt(awayteamGoalDce);
      awayTeam.teamPosition.goalFor += parseInt(hometeamScore);
      awayTeam.teamPosition.goalAgainst += parseInt(awayteamScore);

      homeTeam.teamPosition.lost += 1;
      homeTeam.teamPosition.goalsFor += parseInt(hometeamScore);
      homeTeam.teamPosition.goalDifferential += hometeamScore - awayteamScore;
      homeTeam.teamPosition.goalsAgainst += parseInt(awayteamScore);
      homeTeam.teamPosition.lost += 1;

      await awayTeam.save();
      await homeTeam.save();
    }

    // update match
    match
      .save()
      .then(() =>
        res.send(
          `Full time for match ${homeTeam.teamName} vs ${awayTeam.teamName}!`
        )
      )
      .catch((err) => {
        res.status(500).send("Try again!");
        console.log(err);
      });

    // send socket update
    const io = require("../../server");
    io.emit("fixtureUpdated");

    // ge active gw
    const activeGw = await GameWeek.find({ status: "active" });
    const activeGwId =
      activeGw.length > 0 ? activeGw[activeGw.length - 1].gameWeekNumber : 0;

    // check if all matches are ended
    const activeMatch = await FixtureModel.find({
      gameweekId: activeGwId,
      status: { $ne: "FT" },
    });
    if (activeMatch.length === 1) {
      // micro service call to update stat
      await axios.patch(`${baseURL}/efpl/update`);

      await GameWeek.findOne({ gameWeekNumber: activeGwId }).updateOne({
        status: "Played",
      });

      await GameWeek.findOne({ gameWeekNumber: activeGwId + 1 }).updateOne({
        status: "active",
      });

      // get fdr for next week
      // await getFDR(match);
    }
  }
  // if no match
  else if (!match) {
    res
      .status(404)
      .send(
        `Match ${homeTeam[0].teamName} vs ${awayTeam[0].teamName} doesn't exist!`
      );
  }
  // match already FT
  else if (match.status === "FT") {
    res
      .status(400)
      .send(
        `Match ${homeTeam[0].teamName} vs ${awayTeam[0].teamName} has already ended!`
      );
  }
  // server error
  else {
    res.status(400).send(`Match can not be ended!`);
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

      const io = require("../../server");
      io.emit("fixtureUpdated");

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
  const { schedule, status, homeTeam, awayTeam } = req.body;

  const scheduleCopy = schedule;

  // get starting date
  const formattedSchedule = scheduleCopy.split("T")[0] + "T00:00:00.000+00:00";

  const matchId = req.params.matchId;

  const match = await FixtureModel.findOne({ matchId });

  const nextGameWeekFixture = await FixtureModel.findOne({
    schedule: {
      $gt: new Date(formattedSchedule),
    },
  }).sort("schedule");

  let newGameWeekId = 1;

  // no match found
  if (!nextGameWeekFixture) {
    newGameWeekId = 30;
  }

  //
  else {
    newGameWeekId = nextGameWeekFixture.gameweekId;
  }

  if (match) {
    if (match.status === "scheduled") {
      match.gameweekId = newGameWeekId;
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
    if (match.status !== "FT") {
      match.homeTeamLineUp = homeTeamLineUp ?? match.homeTeamLineUp;
      match.awayTeamLineUp = awayTeamLineUp ?? match.awayTeamLineUp;
      await match.save();

      const io = require("../../server");

      // TODO:Handle in frontend
      io.emit("fixtureLineUpUpdated");

      res.send("Match lineup updated!");
    } else {
      res.status(422).send("Match Ended!");
    }
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

  // match score update info
  let homeTeamScore = 0;
  const homeTeamName = match.homeTeam;
  let awayTeamScore = 0;
  const awayTeamName = match.awayTeam;

  if (match) {
    if (match.status !== "FT") {
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

      const matchGoals = match.matchStat.goalsScored;
      for (const player in matchGoals) {
        const playerTeamInfo = await Player.findOne({
          playerId: player,
        }).select("eplTeamId -_id");

        if (playerTeamInfo.eplTeamId === homeTeamName) {
          homeTeamScore =
            parseInt(homeTeamScore) + matchGoals[player].noOfGoals;
        } else if (playerTeamInfo.eplTeamId === awayTeamName) {
          awayTeamScore =
            parseInt(awayTeamScore) + matchGoals[player].noOfGoals;
        }
      }

      match.score = `${homeTeamScore}v${awayTeamScore}`;
      await FixtureModel.updateOne({ matchId: matchId }, match);

      // send socket update
      const io = require("../../server");
      io.emit("fixtureStatUpdated");
      io.emit("playerScoreUpdated");

      res.send("Match stats updated!");
    } else {
      res.status(422).send("Match Ended!");
    }
  } else if (!match) {
    res.status(404).send("Match doesn't exist!");
  } else {
    res.status(400).send("Match with provided matchid doesn't exist.");
  }
});

// get active gameweek to auto show fixtures in that gw initially
const getActiveGameWeek = asyncHandler(async function (req, res) {
  const activeGw = await GameWeek.find({ status: "active" }).select(
    "-_id,-__v"
  );

  // if active gw exist
  if (activeGw.length > 0) {
    res.status(200).send(activeGw[activeGw.length - 1]);
  }
  // if no active gw
  else {
    res.status(200).send({
      gameWeekNumber: 1,
    });
  }
});

const getAllFixtures = asyncHandler(async function (req, res) {
  // get required
  // send active fixture
  const matches = await FixtureModel.find().select("-__v");

  for (let index = 0; index < matches.length; index++) {
    const homeTeamId = matches[index].matchId.split("|")[0];
    const awayTeamId = matches[index].matchId.split("|")[1];

    const homeTeam = await Teams.findOne({ teamId: homeTeamId }).select(
      "teamName"
    );

    const awayTeam = await Teams.findOne({ teamId: awayTeamId }).select(
      "teamName"
    );

    if (homeTeam) {
      matches[index].homeTeam = homeTeam.teamName;
    }

    if (awayTeam) {
      matches[index].awayTeam = awayTeam.teamName;
    }
  }

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
    const io = require("../../server");
    io.emit("fixtureUpdated");
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
    currMatch.homeTeamAmh = homeTeamInfo.teamNameAmh;
    currMatch.fdr = matches[i].fdr;

    currMatch.awayTeam = matches[i].awayTeam;
    currMatch.awayTeamAmh = awayTeamInfo.teamNameAmh;

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

async function getFDR(match) {
  // get next gw fixtures
  const gameWeekToPredict = match.gameweekId + 1;
  const fixturesToPredict = await FixtureModel.find({
    gameweekId: gameWeekToPredict,
  });
  const allFixturesToSend = [];

  for (let index = 0; index < fixturesToPredict.length; index++) {
    const mlInfo = [];
    const homeTeam = await TeamModel.findOne({
      teamName: fixturesToPredict[index].homeTeam,
    });
    const awayTeam = await TeamModel.findOne({
      teamName: fixturesToPredict[index].awayTeam,
    });

    // PD
    mlInfo.push(
      homeTeam.teamPosition.teamPoint - awayTeam.teamPosition.teamPoint
    );
    // GSD
    mlInfo.push(
      homeTeam.teamPosition.goalsFor - awayTeam.teamPosition.goalsFor
    );
    // GCD
    mlInfo.push(
      homeTeam.teamPosition.goalsAgainst - awayTeam.teamPosition.goalsAgainst
    );

    // WD
    mlInfo.push(homeTeam.teamPosition.won - awayTeam.teamPosition.won);

    // LD
    mlInfo.push(homeTeam.teamPosition.lost - awayTeam.teamPosition.lost);

    // DD
    mlInfo.push(homeTeam.teamPosition.lost - awayTeam.teamPosition.lost);

    // HTXG
    if (
      homeTeam.teamPosition.goalsFor > 0 &&
      homeTeam.teamPosition.goalsAgainst > 0
    ) {
      mlInfo.push(
        homeTeam.teamPosition.goalsFor / homeTeam.teamPosition.goalsAgainst
      );
    } else {
      mlInfo.push(1.0);
    }

    // ATXG
    if (
      awayTeam.teamPosition.goalsFor > 0 &&
      awayTeam.teamPosition.goalsAgainst
    ) {
      mlInfo.push(
        awayTeam.teamPosition.goalsFor / awayTeam.teamPosition.goalsAgainst
      );
    } else {
      mlInfo.push(1.0);
    }

    const homeTeamFormData = TeamData.formData[getForm(12)];
    const awayTeamFormData = TeamData.formData[getForm(12)];

    const homeTeamGoalsForData = [
      getGoalsScore(4),
      getGoalsScore(4),
      getGoalsScore(4),
      getGoalsScore(4),
    ];
    const awayTeamGoalsForData = [
      getGoalsAgainst(4),
      getGoalsAgainst(4),
      getGoalsAgainst(4),
      getGoalsAgainst(4),
    ];

    const homeTeamGoalsAgainst = [
      getGoalsScore(4),
      getGoalsScore(4),
      getGoalsScore(4),
      getGoalsScore(4),
    ];
    const awayTeamGoalsAgainst = [
      getGoalsAgainst(4),
      getGoalsAgainst(4),
      getGoalsAgainst(4),
      getGoalsAgainst(4),
    ];

    allFixturesToSend.push({
      form: {
        homeTeam: {
          result: homeTeamFormData,
          goalsFor: homeTeamGoalsForData,
          goalsAgainst: homeTeamGoalsAgainst,
        },
        awayTeam: {
          result: awayTeamFormData,
          goalsFor: awayTeamGoalsForData,
          goalsAgainst: awayTeamGoalsAgainst,
        },
      },

      mlInfo: mlInfo,
    });
  }

  // make api calls
  const mlCall = await axios.post(MLURL + "/fdr", {
    method: "POST",
    data: allFixturesToSend,
  });
  let fdr;
  if (mlCall.status === 200) {
    fdr = mlCall.data.fdr;
  } else {
    fdr = [1, 2, 1, 3, 1, 1, 2, 2];
  }

  for (let j = 0; j < fixturesToPredict.length; j++) {
    const finalFDR = fdr[j] === 0 ? 1 : fdr[j] > 5 ? 5 : fdr[j];
    await FixtureModel.updateOne(
      { matchId: fixturesToPredict[j].matchId },
      { $set: { fdr: finalFDR } }
    );
  }

  return allFixturesToSend;
}

function getForm(max) {
  return Math.floor(Math.random() * max);
}

function getGoalsScore(max) {
  return Math.floor(Math.random() * max);
}

function getGoalsAgainst(max) {
  return Math.floor(Math.random() * max);
}

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
  // updateScore,

  // New
  getAllFixturesOfGameWeek,
  getFixtureDetail,
  getActiveGameWeek,
};
