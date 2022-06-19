// Imports the Flutter Driver API.
import 'package:flutter_driver/flutter_driver.dart';
import 'package:test/test.dart';

void main() {
  group('Initial Team Tests', () {
    final emailInputField = find.byValueKey('loginViewUserName');
    final passwordInputField = find.byValueKey('loginViewPassword');
    final loginButton = find.byValueKey("loginViewLoginButton");

    final transferListViewMainView =
        find.byValueKey("transferListViewListViewMain");
    final transferPlayerCardTransferButton =
        find.byValueKey("transferPlayerCardTransferButton");
    final intialTransferSaveButton =
        find.byValueKey("initialTransferViewSaveKey");
    final intialTransferScrollView =
        find.byValueKey("initialTransferMainScrollKey");

    final initialTransferGKKey1 = find.byValueKey("initialTransferViewGKKey1");
    final initialTransferGKKey2 = find.byValueKey("initialTransferViewGKKey2");
    final initialTransferDEFKey1 =
        find.byValueKey("initialTransferViewDEFKey1");
    final initialTransferDEFKey2 =
        find.byValueKey("initialTransferViewDEFKey2");
    final initialTransferDEFKey3 =
        find.byValueKey("initialTransferViewDEFKey3");
    final initialTransferDEFKey4 =
        find.byValueKey("initialTransferViewDEFKey4");
    final initialTransferDEFKey5 =
        find.byValueKey("initialTransferViewDEFKey5");
    final initialTransferMIDKey1 =
        find.byValueKey("initialTransferViewMIDKey1");
    final initialTransferMIDKey2 =
        find.byValueKey("initialTransferViewMIDKey2");
    final initialTransferMIDKey3 =
        find.byValueKey("initialTransferViewMIDKey3");
    final initialTransferMIDKey4 =
        find.byValueKey("initialTransferViewMIDKey4");
    final initialTransferMIDKey5 =
        find.byValueKey("initialTransferViewMIDKey5");

    final initialTransferATTKey1 =
        find.byValueKey("initialTransferViewATTKey1");
    final initialTransferATTKey2 =
        find.byValueKey("initialTransferViewATTKey2");
    final initialTransferATTKey3 =
        find.byValueKey("initialTransferViewATTKey3");

    // 5.5
    final selectedGK1 = find.text("Abel Mamo");
    // 6.5
    final selectedGK2 = find.text("Yohannes Shikur");

    // 3.8
    final selectedDEF1 = find.text("Mignot Debebe");
    // 4.8
    final selectedDEF2 = find.text("Abel Wudu");
    // 4.0
    final selectedDEF3 = find.text("Abdulkerim Mohammed");
    // 6.0
    final selectedDEF4 = find.text("Adane Belayneh");
    // 4.8
    final selectedDEF5 = find.text("Amin Nesru");

    // 9.0
    final selectedMID1 = find.text("Elias Ahmed");
    // 7.0
    final selectedMID2 = find.text("Elias Mamo");
    // 6.0
    final selectedMID3 = find.text("Abayne Amelo");
    // 6.0
    final selectedMID4 = find.text("Abdulkerim Worku");
    // 5.0
    final selectedMID5 = find.text("Abel Kebede");

    // 7.8
    final selectedATT1 = find.text("Abel Yalew");
    // 6.5
    final selectedATT2 = find.text("Addis Gidey");
    // 11.6
    final selectedATT3 = find.text("Abubeker Nassir");
    final teamCountExceedATT = find.text("Abdisa Jemal");
    // 6.5
    final budgetExceedATT1 = find.text("Oumed Oukri");
    final budgetExceedATT2 = find.text("Ali Sulieman");
    final budgetExceedATT3 = find.text("Girma Dissasa");

    // final budget -5.7
    late FlutterDriver driver;
    setUpAll(() async {
      driver = await FlutterDriver.connect();
    });

    test('Full Test', () async {
      // await render
      await driver.waitUntilFirstFrameRasterized();

      await driver.tap(find.byValueKey("publicPageSignInButton"));

      // Valid email Valid password
      await driver.tap(emailInputField);
      await driver.enterText("efpltest@gmail.com");

      await driver.tap(passwordInputField);
      await driver.enterText("StrongPass@123456");

      await driver.tap(loginButton);

      await driver.waitFor(initialTransferGKKey1);

      // select GK1
      await driver.tap(initialTransferGKKey1);
      await driver.scrollUntilVisible(transferListViewMainView, selectedGK1,
          dyScroll: -100);
      await driver.tap(selectedGK1);
      await driver.tap(transferPlayerCardTransferButton);

      // select gk2
      await driver.tap(initialTransferGKKey2);
      await driver.scrollUntilVisible(transferListViewMainView, selectedGK2,
          dyScroll: -100);
      await driver.tap(selectedGK2);
      await driver.tap(transferPlayerCardTransferButton);

      // select DEF 1
      await driver.tap(initialTransferDEFKey1);
      await driver.scrollUntilVisible(transferListViewMainView, selectedDEF1,
          dyScroll: -100);
      await driver.tap(selectedDEF1);
      await driver.tap(transferPlayerCardTransferButton);

      // select DEF 2
      await driver.tap(initialTransferDEFKey2);
      await driver.scrollUntilVisible(transferListViewMainView, selectedDEF2,
          dyScroll: -100);
      await driver.tap(selectedDEF2);
      await driver.tap(transferPlayerCardTransferButton);

      // select DEF 3
      await driver.tap(initialTransferDEFKey3);
      await driver.scrollUntilVisible(transferListViewMainView, selectedDEF3,
          dyScroll: 100);
      await driver.tap(selectedDEF3);
      await driver.tap(transferPlayerCardTransferButton);

      // select DEF 4
      await driver.tap(initialTransferDEFKey4);
      await driver.scrollUntilVisible(transferListViewMainView, selectedDEF4,
          dyScroll: -100);
      await driver.tap(selectedDEF4);
      await driver.tap(transferPlayerCardTransferButton);

      // select DEF 5
      await driver.tap(initialTransferDEFKey5);
      await driver.scrollUntilVisible(transferListViewMainView, selectedDEF5,
          dyScroll: -100);
      await driver.tap(selectedDEF5);
      await driver.tap(transferPlayerCardTransferButton);

      // select MID 1
      await driver.tap(initialTransferMIDKey1);
      await driver.scrollUntilVisible(transferListViewMainView, selectedMID1,
          dyScroll: -100);
      await driver.tap(selectedMID1);
      await driver.tap(transferPlayerCardTransferButton);

      // select MID 2
      await driver.tap(initialTransferMIDKey2);
      await driver.scrollUntilVisible(transferListViewMainView, selectedMID2,
          dyScroll: -100);
      await driver.tap(selectedMID2);
      await driver.tap(transferPlayerCardTransferButton);

      // select MID 3
      await driver.tap(initialTransferMIDKey3);
      await driver.scrollUntilVisible(transferListViewMainView, selectedMID3,
          dyScroll: -100);
      await driver.tap(selectedMID3);
      await driver.tap(transferPlayerCardTransferButton);

      // select MID 4
      await driver.tap(initialTransferMIDKey4);
      await driver.scrollUntilVisible(transferListViewMainView, selectedMID4,
          dyScroll: -100);
      await driver.tap(selectedMID4);
      await driver.tap(transferPlayerCardTransferButton);

      // select MID 5
      await driver.tap(initialTransferMIDKey5);
      await driver.scrollUntilVisible(transferListViewMainView, selectedMID5,
          dyScroll: -100);
      await driver.tap(selectedMID5);
      await driver.tap(transferPlayerCardTransferButton);

      // EXCEED BUDGET ATT 1
      await driver.scrollUntilVisible(
        intialTransferScrollView,
        initialTransferATTKey1,
        dyScroll: -100,
      );
      await driver.tap(initialTransferATTKey1);
      await driver.scrollUntilVisible(
          transferListViewMainView, budgetExceedATT1,
          dyScroll: -100);
      await driver.tap(budgetExceedATT1);
      await driver.tap(transferPlayerCardTransferButton);
      // EXCEED BUDGET  ATT 2
      await driver.scrollUntilVisible(
        intialTransferScrollView,
        initialTransferATTKey2,
        dyScroll: -100,
      );
      await driver.tap(initialTransferATTKey2);
      await driver.scrollUntilVisible(
          transferListViewMainView, budgetExceedATT2,
          dyScroll: -100);
      await driver.tap(budgetExceedATT2);
      await driver.tap(transferPlayerCardTransferButton);
      // EXCEED BUDGET  ATT 3
      await driver.scrollUntilVisible(
        intialTransferScrollView,
        initialTransferATTKey3,
        dyScroll: -100,
      );
      await driver.tap(initialTransferATTKey3);
      await driver.scrollUntilVisible(
          transferListViewMainView, budgetExceedATT3,
          dyScroll: -100);
      await driver.tap(budgetExceedATT3);
      await driver.tap(transferPlayerCardTransferButton);

      // SAVE EXCEEDED TEAM
      await driver.scrollUntilVisible(
        intialTransferScrollView,
        intialTransferSaveButton,
        dyScroll: -100,
      );
      await driver.tap(intialTransferSaveButton);

      await driver.waitFor(find.text("Price Limit Exceeded!"));

      // Exceed Team Count 1
      await driver.tap(initialTransferATTKey1);
      await driver.scrollUntilVisible(transferListViewMainView, selectedATT1,
          dyScroll: -100);
      await driver.tap(selectedATT1);
      await driver.tap(transferPlayerCardTransferButton);

      // Exceed Team Count 2
      await driver.tap(initialTransferATTKey2);
      await driver.scrollUntilVisible(transferListViewMainView, selectedATT2,
          dyScroll: -100);
      await driver.tap(selectedATT2);
      await driver.tap(transferPlayerCardTransferButton);

      // Exceed Team Count 3
      await driver.tap(initialTransferATTKey3);
      await driver.scrollUntilVisible(
          transferListViewMainView, teamCountExceedATT,
          dyScroll: -100);
      await driver.tap(teamCountExceedATT);
      await driver.tap(transferPlayerCardTransferButton);

      await driver.tap(intialTransferSaveButton);

      await driver.waitFor(find.text("Players from Team!"));

      //Valid  ATT 1
      // await driver.tap(find.text("Abel"));
      // await driver.scrollUntilVisible(transferListViewMainView, selectedATT1,
      //     dyScroll: -100);
      // await driver.tap(selectedATT1);
      // await driver.tap(transferPlayerCardTransferButton);
      // await Future.delayed(const Duration(seconds: 3));

      // Valid ATT 2
      await driver.tap(find.text("Abdisa"));
      await driver.scrollUntilVisible(transferListViewMainView, selectedATT2,
          dyScroll: -100);
      await driver.tap(selectedATT2);
      await driver.tap(transferPlayerCardTransferButton);

      // Valid Att 3
      await driver.tap(find.text("Ali"));
      await driver.scrollUntilVisible(transferListViewMainView, selectedATT3,
          dyScroll: -100);
      await driver.tap(selectedATT3);
      await driver.tap(transferPlayerCardTransferButton);

      ;

      await driver.tap(intialTransferSaveButton);

      await driver.tap(find.byValueKey("confirmTransfersPageSaveButton"));
    });

    tearDownAll(() async {
      await driver.close();
    });
  }, timeout: Timeout.none);
}
