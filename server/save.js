const playerInfo = {
  playerId: player.playerId,
  multiplier: parseInt(player.multiplier),
  isCaptain: player.isCaptain,
  isViceCaptain: player.isViceCaptain,
};

// get more info on player
const currPlayer = await Player.findOne({
  playerId: player.playerId,
});

// get players upcoming fixtures
const currentTeamFixture = await Fixture.find({
  $or: [{ homeTeam: currPlayer.eplTeamId }, { awayTeam: currPlayer.eplTeamId }],

  gameweekId: { $gt: gameWeekId },
})
  .select("homeTeam awayTeam")
  .limit(8);

const upComingFixture = [];

for (let i = 0; i < currentTeamFixture.length; i++) {
  if (
    currentTeamFixture[i].homeTeam.toString() ===
    currPlayer.eplTeamId.toString()
  ) {
    upComingFixture.push(
      currentTeamFixture[i].awayTeam.toString() + "+-" + "H"
    );
  } else {
    upComingFixture.push(
      currentTeamFixture[i].homeTeam.toString() + "+-" + "A"
    );
  }
}

const currentTeam = allTeams.filter(
  (team) => team.teamName.toString() === currPlayer.eplTeamId.toString()
);

playerInfo.playerName = currPlayer.playerName.toString().trim();
playerInfo.eplTeamId = currPlayer.eplTeamId.toString().trim();
playerInfo.eplTeamLogo = currentTeam[0].teamLogo;
playerInfo.currentPrice = parseFloat(currPlayer.currentPrice);
playerInfo.position = currPlayer.position.toString().trim();
playerInfo.availability = currPlayer.availability
  ? currPlayer.availability
  : { injuryStatus: "", injuryMessage: "" };
playerInfo.score = sumEplPlayerScore(currPlayer.score, gameWeekId);
playerInfo.upComingFixtures = upComingFixture;

allUserPlayersList[`${value}`] = playerInfo;
