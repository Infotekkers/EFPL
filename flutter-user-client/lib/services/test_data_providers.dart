// import 'package:efpl/domain/my_team/my_team.dart';
// import 'package:efpl/domain/my_team/value_objects.dart';
// import 'package:efpl/infrastructure/my_team/my_team_local_data_provider.dart';
// import 'package:efpl/infrastructure/my_team/my_team_remote_data_provider.dart';
// import 'package:efpl/infrastructure/player/player_remote_data_provider.dart';

// void testDataProviders() async {
//   // * MY TEAM: GET USER TEAM
//   dynamic result = await MyTeamRemoteDataProvider()
//       .getUserTeam('623b101b9a85861e924388dd', '1');
//   // print("GET USER TEAM: $result");

//   MyTeam myTeam = MyTeam(
//       activeChip: Chip(''),
//       activeGameweek: Gameweek('1'),
//       availableChips: AvailableChips(['FH', 'BB', 'WC', 'TC'], ''),
//       teamName: TeamName('The Testies'),
//       players: {
//         'gk': PositionalContainer({
//           "101": {
//             "playerId": 101,
//             "multiplier": 1,
//             "eplTeamId": "10",
//             "price": 5,
//             "isCaptain": true,
//             "isViceCaptain": false,
//             "_id": "623b101b9a85861e924388df",
//             "name": "Keeper",
//             "position": "GK"
//           }
//         }, 'gk'),
//         'def': PositionalContainer({
//           "201": {
//             "playerId": 201,
//             "multiplier": 1,
//             "eplTeamId": "10",
//             "price": 5,
//             "isCaptain": false,
//             "isViceCaptain": false,
//             "_id": "623b101b9a85861e924388e1",
//             "name": "Defender",
//             "position": "DEF"
//           },
//           "202": {
//             "playerId": 202,
//             "multiplier": 1,
//             "eplTeamId": "20",
//             "price": 5,
//             "isCaptain": false,
//             "isViceCaptain": false,
//             "_id": "623b101b9a85861e924388e2",
//             "name": "Defender2",
//             "position": "DEF"
//           },
//           "203": {
//             "playerId": 203,
//             "multiplier": 1,
//             "eplTeamId": "20",
//             "price": 5,
//             "isCaptain": false,
//             "isViceCaptain": false,
//             "_id": "623b101b9a85861e924388e3",
//             "name": "Defender3",
//             "position": "DEF"
//           },
//           "204": {
//             "playerId": 204,
//             "multiplier": 1,
//             "eplTeamId": "20",
//             "price": 5,
//             "isCaptain": false,
//             "isViceCaptain": false,
//             "_id": "623b101b9a85861e924388e4",
//             "name": "Defender4",
//             "position": "DEF"
//           },
//         }, 'def'),
//         'mid': PositionalContainer({
//           "301": {
//             "playerId": 301,
//             "multiplier": 1,
//             "eplTeamId": "30",
//             "price": 5,
//             "isCaptain": false,
//             "isViceCaptain": false,
//             "_id": "623b101b9a85861e924388e6",
//             "name": "Not Kicker",
//             "position": "MID"
//           },
//           "302": {
//             "playerId": 302,
//             "multiplier": 1,
//             "eplTeamId": "30",
//             "price": 5,
//             "isCaptain": false,
//             "isViceCaptain": false,
//             "_id": "623b101b9a85861e924388e7",
//             "name": "Not Kicker2",
//             "position": "MID"
//           },
//           "303": {
//             "playerId": 303,
//             "multiplier": 1,
//             "eplTeamId": "40",
//             "price": 5,
//             "isCaptain": false,
//             "isViceCaptain": false,
//             "_id": "623b101b9a85861e924388e8",
//             "name": "Not Kicker3",
//             "position": "MID"
//           },
//         }, 'mid'),
//         'att': PositionalContainer({
//           "401": {
//             "playerId": 401,
//             "multiplier": 0,
//             "eplTeamId": "50",
//             "price": 5,
//             "isCaptain": false,
//             "isViceCaptain": false,
//             "_id": "623b101b9a85861e924388eb",
//             "name": "Kicker",
//             "position": "ATT"
//           },
//           "402": {
//             "playerId": 402,
//             "multiplier": 0,
//             "eplTeamId": "50",
//             "price": 5,
//             "isCaptain": false,
//             "isViceCaptain": false,
//             "_id": "623b101b9a85861e924388ec",
//             "name": "Kicker2",
//             "position": "ATT"
//           },
//           "403": {
//             "playerId": 403,
//             "multiplier": 0,
//             "eplTeamId": "50",
//             "price": 5,
//             "isCaptain": false,
//             "isViceCaptain": false,
//             "_id": "623b101b9a85861e924388ed",
//             "name": "Kicker3",
//             "position": "ATT"
//           },
//         }, 'att'),
//         'sub': PositionalContainer({
//           "102": {
//             "playerId": 102,
//             "multiplier": 1,
//             "eplTeamId": "10",
//             "price": 5,
//             "isCaptain": false,
//             "isViceCaptain": true,
//             "_id": "623b101b9a85861e924388e0"
//           },
//           "205": {
//             "playerId": 205,
//             "multiplier": 1,
//             "eplTeamId": "30",
//             "price": 5,
//             "isCaptain": false,
//             "isViceCaptain": false,
//             "_id": "623b101b9a85861e924388e5",
//             "name": "DefenderB",
//             "position": "DEF"
//           },
//           "304": {
//             "playerId": 304,
//             "multiplier": 1,
//             "eplTeamId": "40",
//             "price": 5,
//             "isCaptain": false,
//             "isViceCaptain": false,
//             "_id": "623b101b9a85861e924388e9"
//           },
//           "305": {
//             "playerId": 305,
//             "multiplier": 0,
//             "eplTeamId": "40",
//             "price": 5,
//             "isCaptain": false,
//             "isViceCaptain": false,
//             "_id": "623b101b9a85861e924388ea"
//           },
//         }, 'sub'),
//       });
//   // result = await MyTeamRemoteDataProvider()
//   // .saveUserTeam(myTeam, '623b101b9a85861e924388dd');
//   // print("SAVE USER TEAM: $result");

//   result = await MyTeamLocalDataProvider()
//       .saveUserTeam(myTeam, '623b101b9a85861e924388dd');
//   print("SAVE USER TEAM: $result");

//   result = await MyTeamLocalDataProvider()
//       .getUserTeam('623b101b9a85861e924388dd', '1');
//   // print("GET USER TEAM: $result");

//   result = await PlayerRemoteDataProvider().getPlayer("101");
//   print("GET PLAYER FULL: $result");
// }
