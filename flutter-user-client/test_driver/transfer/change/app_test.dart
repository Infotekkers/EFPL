// Imports the Flutter Driver API.
import 'package:flutter_driver/flutter_driver.dart';
import 'package:test/test.dart';

void main() {
  group('Transfer Team Tests', () {
    final emailInputField = find.byValueKey('loginViewUserName');
    final passwordInputField = find.byValueKey('loginViewPassword');
    final loginButton = find.byValueKey("loginViewLoginButton");

    final transferListViewMainView =
        find.byValueKey("transferListViewListViewMain");
    final transferPlayerCardTransferButton =
        find.byValueKey("transferPlayerCardTransferButton");

    final transferPlayerSaveButton = find.byValueKey("transfersViewSaveButton");
    final transferPlayerCancelButton =
        find.byValueKey("transfersViewCancelButton");

    final confirmPageSaveButton =
        find.byValueKey("confirmTransfersPageSaveButton");
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

      // make transfer
      await driver.tap(find.byValueKey("transferViewGKKey2"));
      await driver.tap(find.byValueKey("transferViewModalTransferButton"));
      await driver.scrollUntilVisible(
          transferListViewMainView, find.text("Alazar Markos"),
          dyScroll: -100);
      await driver.tap(find.text("Alazar Markos"));
      await driver.tap(transferPlayerCardTransferButton);

      // cancel transfer
      await driver.tap(transferPlayerCancelButton);

      // transfer again
      await driver.tap(find.byValueKey("transferViewGKKey2"));
      await driver.tap(find.byValueKey("transferViewModalTransferButton"));
      await driver.scrollUntilVisible(
          transferListViewMainView, find.text("Alazar Markos"),
          dyScroll: -100);

      await driver.tap(find.text("Alazar Markos"));
      await driver.tap(transferPlayerCardTransferButton);

      // player 2
      await driver.tap(find.text("Amin"));
      await driver.tap(find.byValueKey("transferViewModalTransferButton"));
      await driver.scrollUntilVisible(
          transferListViewMainView, find.text("Abel Eyayu"),
          dyScroll: -100);
      await driver.tap(find.text("Abel Eyayu"));
      await driver.tap(transferPlayerCardTransferButton);

      // save
      await driver.tap(transferPlayerSaveButton);
      await driver.tap(find.byValueKey("confirmTransfersPageSaveButton"));

      await driver.waitFor(find.text("Abel"));
      await driver.waitFor(find.text("Alazar"));

      // select GK1
    });

    tearDownAll(() async {
      await driver.close();
    });
  }, timeout: Timeout.none);
}
