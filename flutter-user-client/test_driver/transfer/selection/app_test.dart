// Imports the Flutter Driver API.
import 'package:flutter_driver/flutter_driver.dart';
import 'package:test/test.dart';

void main() {
  group('Login User Tests', () {
    final emailInputField = find.byValueKey('loginViewUserName');
    final passwordInputField = find.byValueKey('loginViewPassword');
    final loginButton = find.byValueKey("loginViewLoginButton");
    final initialTransferMainKey = find.byValueKey("intialTransferViewMainKey");

    final transferListViewMainView =
        find.byValueKey("transferListViewListViewMain");
    final transferPlayerCardTransferButton =
        find.byValueKey("transferPlayerCardTransferButton");

    // Player selection
    final initialTransferGKKey1 = find.byValueKey("initialTransferViewGKKey1");
    final initialTransferGKKey2 = find.byValueKey("initialTransferViewGKKey2");
    final selectedGK1 = find.text("Abel Mamo");
    final selectedGK2 = find.text("Harriston Hessou");

    late FlutterDriver driver;

    // Connect to the Flutter driver before running any tests.
    setUpAll(() async {
      driver = await FlutterDriver.connect();
    });

    // Close the connection to the driver after the tests have completed.

    test('Full Test', () async {
      // await render
      await driver.waitUntilFirstFrameRasterized();

      // Valid email Valid password
      await driver.tap(emailInputField);
      await driver.enterText("efpltest@gmail.com");

      await driver.tap(passwordInputField);
      await driver.enterText("StrongPass@123456");

      await driver.tap(loginButton);

      // expect
      await driver.waitFor(initialTransferMainKey);

      await driver.waitFor(transferListViewMainView);

      await driver.waitFor(initialTransferMainKey);
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
    });

    tearDownAll(() async {
      await driver.close();
    });
  });
}
