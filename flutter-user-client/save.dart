// import 'package:flutter/material.dart';

// class TestMe extends StatelessWidget {
//   const TestMe({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(
//           getMatchAcronym(fixture: fixture),
//           style: const TextStyle(
//             letterSpacing: 0.5,
//             fontFamily: "Architect",
//             fontWeight: FontWeight.bold,
//           ),
//         ),
//         backgroundColor: ConstantColors.primary_800,
//         foregroundColor: ConstantColors.neutral_200,
//       ),
//       body: SingleChildScrollView(
//         child: Column(
//           children: [
//             // HEADER
//             Container(
//               height: 205,
//               color: ConstantColors.neutral_200,
//               padding: const EdgeInsets.symmetric(vertical: 15),
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   // Home Team
//                   SizedBox(
//                     height: 180,
//                     width: MediaQuery.of(context).size.width * 0.30,
//                     child: Column(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: [
//                         SizedBox(
//                           height: 105,
//                           child: CachedNetworkImage(
//                             fit: BoxFit.fill,
//                             imageUrl: getImageUrl(fixture: fixture, isHome: 1),
//                             placeholder: (context, url) =>
//                                 const CircularProgressIndicator(),
//                             errorWidget: (context, url, error) => const Icon(
//                               Icons.error,
//                               color: Colors.red,
//                             ),
//                           ),
//                         ),
//                         const SizedBox(
//                           height: 10,
//                         ),
//                         Text(
//                           getShortName(fixture: fixture, isHome: 1),
//                           style: const TextStyle(
//                             fontSize: 14,
//                             fontWeight: FontWeight.bold,
//                           ),
//                           textAlign: TextAlign.center,
//                         ),
//                       ],
//                     ),
//                   ),

//                   // match Info
//                   SizedBox(
//                     height: 165,
//                     width: MediaQuery.of(context).size.width * 0.35,
//                     child: Column(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: [
//                         getShortStatus(fixture: fixture) != "Not Live"
//                             ? Text(
//                                 getShortStatus(fixture: fixture),
//                               )
//                             : const Text(""),
//                         //
//                         const SizedBox(
//                           height: 8,
//                         ),

//                         getShortStatus(fixture: fixture) != "Not Live"
//                             ? Text(
//                                 fixture['fixture']!.score.value.fold(
//                                       (l) => '',
//                                       (r) =>
//                                           r.toString().split("v").join(" - "),
//                                     ),
//                                 style: const TextStyle(
//                                   fontSize: 30,
//                                   fontWeight: FontWeight.bold,
//                                 ),
//                               )
//                             : Text(
//                                 getFormattedTime(fixture: fixture),
//                                 style: const TextStyle(
//                                   fontSize: 30,
//                                   fontWeight: FontWeight.bold,
//                                 ),
//                               ),
//                         const SizedBox(
//                           height: 8,
//                         ),
//                         Text(
//                           fixture['fixture']!.homeTeamCity.value.fold(
//                                 (l) => '',
//                                 (r) => r.toString(),
//                               ),
//                         ),
//                         const SizedBox(
//                           height: 8,
//                         ),
//                         Text(
//                           fixture['fixture']!.homeTeamStadium.value.fold(
//                                 (l) => '',
//                                 (r) => r.toString(),
//                               ),
//                           textAlign: TextAlign.center,
//                         ),

//                         Text(
//                           "( " +
//                               fixture['fixture']!.homeTeamCapacity.value.fold(
//                                     (l) => '',
//                                     (r) => r.toString(),
//                                   ) +
//                               " )",
//                           style: const TextStyle(fontSize: 10),
//                         ),
//                       ],
//                     ),
//                   ),

//                   SizedBox(
//                     height: 175,
//                     width: MediaQuery.of(context).size.width * 0.30,
//                     child: Column(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       crossAxisAlignment: CrossAxisAlignment.center,
//                       children: [
//                         SizedBox(
//                           height: 100,
//                           child: CachedNetworkImage(
//                             fit: BoxFit.fill,
//                             imageUrl: getImageUrl(fixture: fixture, isHome: 0),
//                             placeholder: (context, url) =>
//                                 const CircularProgressIndicator(),
//                             errorWidget: (context, url, error) => const Icon(
//                               Icons.error,
//                               color: Colors.red,
//                             ),
//                           ),
//                         ),
//                         const SizedBox(
//                           height: 10,
//                         ),
//                         Text(
//                           getShortName(fixture: fixture, isHome: 0),
//                           style: const TextStyle(
//                             fontSize: 14,
//                             fontWeight: FontWeight.bold,
//                           ),
//                           textAlign: TextAlign.center,
//                         ),
//                       ],
//                     ),
//                   ),
//                 ],
//               ),
//             ),

//             // SCORE INFO
//             Container(
//               height: 80,
//               decoration: const BoxDecoration(
//                 color: ConstantColors.neutral_200,
//                 border: Border(
//                   bottom: BorderSide(
//                     width: 0.5,
//                     color: ConstantColors.primary_800,
//                   ),
//                   top: BorderSide(
//                     width: 0.5,
//                     color: ConstantColors.primary_800,
//                   ),
//                 ),
//               ),
//             ),

//             // Tab View

//             ConstrainedBox(
//               // height: 1060,
//               constraints: const BoxConstraints(
//                 minHeight: 40,
//                 maxHeight: 1050,
//               ),
//               child: TabContainer(
//                 radius: 0,
//                 color: ConstantColors.primary_200,
//                 children: [
//                   FixtureDetailLineUp(fixture: fixture),
//                   FixtureDetailEvent(fixture: fixture),
//                 ],
//                 tabs: const [
//                   'Line Ups',
//                   'Events',
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
