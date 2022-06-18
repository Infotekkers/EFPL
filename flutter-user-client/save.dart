// // Imports the Flutter Driver API.
// import 'package:flutter_driver/flutter_driver.dart';
// import 'package:test/test.dart';

// void main() {
//   group('Login User Tests', () {
//     final emailInputField = find.byValueKey('loginViewUserName');
//     final passwordInputField = find.byValueKey('loginViewPassword');
//     final loginButton = find.byValueKey("loginViewLoginButton");
//     final initialTransferMainKey = find.byValueKey("intialTransferViewMainKey");

//     final transferListViewMainView =
//         find.byValueKey("transferListViewListViewMain");
//     final transferPlayerCardTransferButton =
//         find.byValueKey("transferPlayerCardTransferButton");

//     final initialTransferGKKey1 = find.byValueKey("initialTransferViewGKKey1");
//     final initialTransferGKKey2 = find.byValueKey("initialTransferViewGKKey2");
//     final initialTransferDEFKey1 =
//         find.byValueKey("initialTransferViewDEFKey1");
//     final initialTransferDEFKey2 =
//         find.byValueKey("initialTransferViewDEFKey2");
//     final initialTransferDEFKey3 =
//         find.byValueKey("initialTransferViewDEFKey1");
//     final initialTransferDEFKey4 =
//         find.byValueKey("initialTransferViewDEFKey2");
//     final initialTransferDEFKey5 =
//         find.byValueKey("initialTransferViewDEFKey2");

//     // 5.5
//     final selectedGK1 = find.text("Abel Mamo");
//     // 6.5
//     final selectedGK2 = find.text("Yohannes Shikur");

//     // 3.8
//     final selectedDEF1 = find.text("Mignot Debebe");
//     // 4.8
//     final selectedDEF2 = find.text("Abel Wudu");
//     // 4.0
//     final selectedDEF3 = find.text("Yared Belayneh");
//     // 6.0
//     final selectedDEF4 = find.text("Adane Belayneh");
//     // 4.8
//     final selectedDEF5 = find.text("Amin Nesru");

//     // 9.0
//     final selectedMID1 = find.text("Elias Ahmed");
//     // 7.0
//     final selectedMID2 = find.text("Elias Mamo");
//     // 6.0
//     final selectedMID3 = find.text("Abayne Amelo");
//     // 6.0
//     final selectedMID4 = find.text("Abdulkerim Worku");
//     // 5.0
//     final selectedMID5 = find.text("Abel Kebede");

//     // 7.8
//     final selectedATT1 = find.text("Abel Yalew");
//     // 6.5
//     final selectedATT2 = find.text("Addis Gidey");
//     // 11.6
//     final selectedATT3 = find.text("Abubeker Nassir");

//     final teamCountExceedATT = find.text("Abdissa Jemal");

//     // 6.5
//     final budgetExceedATT1 = find.text("Oumed Oukri");
//     final budgetExceedATT2 = find.text("Ali Sulieman");
//     final budgetExceedATT3 = find.text("Girma Dissasa");

//     // final budget -5.7

//     late FlutterDriver driver;

//     // Connect to the Flutter driver before running any tests.
//     setUpAll(() async {
//       driver = await FlutterDriver.connect();
//     });

//     // Close the connection to the driver after the tests have completed.

//     test('Full Test', () async {
//       // await render
//       await driver.waitUntilFirstFrameRasterized();

//       // Valid email Valid password
//       await driver.tap(emailInputField);
//       await driver.enterText("efpltest@gmail.com");

//       await driver.tap(passwordInputField);
//       await driver.enterText("StrongPass@123456");

//       await driver.tap(loginButton);

//       // expect
//       await driver.waitFor(initialTransferMainKey);

//       await driver.waitFor(transferListViewMainView);

//       await driver.waitFor(initialTransferMainKey);
//       await driver.waitFor(initialTransferGKKey1);

//       // select GK1
//       await driver.tap(initialTransferGKKey1);
//       await driver.scrollUntilVisible(transferListViewMainView, selectedGK1,
//           dyScroll: -100);
//       await driver.tap(selectedGK1);
//       await driver.tap(transferPlayerCardTransferButton);

//       // select gk2
//       await driver.tap(initialTransferGKKey2);
//       await driver.scrollUntilVisible(transferListViewMainView, selectedGK2,
//           dyScroll: -100);
//       await driver.tap(selectedGK2);
//       await driver.tap(transferPlayerCardTransferButton);
//     });

//     tearDownAll(() async {
//       await driver.close();
//     });
//   });
// }
