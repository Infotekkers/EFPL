const allTeams = [
  "Saint George S.C",
  "Wolaita Dicha S.C",
  "Hawassa Kenema S.C",
  "Fasil Kenema S.C",
  "Adama City S.C",
  "Sidama Coffee S.C",
  "Bahir Dar Kenema S.C",
  "Ethiopian Coffee S.C",
  "Wolkite City F.C",
  "Arba Minch City F.C",
  "Defence Force S.C",
  "Hadiya Hossana F.C",
  "Dire Dawa City S.C",
  "Addis Ababa City F.C",
  "Jimma Aba Jifar F.C",
  "Sebeta City F.C",
];
const numberOfGameWeeks = (allTeams.length - 1) * 2;
// Tracks all the matches
const allPairedMatches = [];
// teams already paired
const allAlreadyMatched = [];
function generateMatch() {
  for (let i = 0; i < numberOfGameWeeks; i++) {
    const gwMatches = generateGameWeekMatches(i + 1);
    allPairedMatches.push(gwMatches);
  }
}
// Generate gameweek macthes
function generateGameWeekMatches(gameWeekNumber) {
  let allGwTeams = Array.from(allTeams);
  const allGwMatches = [];
  //   While team not paired
  while (allGwTeams.length > 0) {
    let pickedTeamIndexes = pickTwoTeams(allGwTeams);
    let homeTeamIndex = pickedTeamIndexes[0];
    let awayTeamIndex = pickedTeamIndexes[1];
    let match = {
      homeTeam: allGwTeams[homeTeamIndex],
      awayTeam: allGwTeams[awayTeamIndex],
    };
    let isAlreadyMatched = allAlreadyMatched.filter((alreadyMatched) => {
      return (
        alreadyMatched.homeTeam === match.homeTeam &&
        allAlreadyMatched.awayTeam === match.awayTeam
      );
    });
    // As long as played re do
    while (isAlreadyMatched.length > 0) {
      pickedTeamIndexes = pickTwoTeams(allGwTeams);
      homeTeamIndex = pickedTeamIndexes[0];
      awayTeamIndex = pickedTeamIndexes[1];
      match = {
        homeTeam: allGwTeams[homeTeamIndex],
        awayTeam: allGwTeams[awayTeamIndex],
      };
      isAlreadyMatched = allAlreadyMatched.filter((alreadyMatched) => {
        return (
          alreadyMatched.homeTeam === match.homeTeam &&
          allAlreadyMatched.awayTeam === match.awayTeam
        );
      });
    }
    // save to game week matches
    allGwMatches.push(match);
    // save to all matches
    allAlreadyMatched.push(match);
    // remove matched teams from available gw teams
    allGwTeams = allGwTeams.filter((team) => {
      return (
        team !== allGwTeams[homeTeamIndex] && team !== allGwTeams[awayTeamIndex]
      );
    });
  }
  return allGwMatches;
}
function pickTwoTeams(availableTeams) {
  const homeTeamPickedIndex = pickRandomNumber(availableTeams);
  let awayTeamPickedIndex = pickRandomNumber(availableTeams);
  while (homeTeamPickedIndex === awayTeamPickedIndex) {
    awayTeamPickedIndex = pickRandomNumber(availableTeams);
  }
  return [homeTeamPickedIndex, awayTeamPickedIndex];
}
function pickRandomNumber(teams) {
  return Math.floor(Math.random() * teams.length);
}

generateMatch();

module.exports = { allPairedMatches };
