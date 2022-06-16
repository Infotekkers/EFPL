// Imports the Flutter Driver API.
import 'package:flutter_driver/flutter_driver.dart';
import 'package:test/test.dart';

void main() {
  group('Register Account', () {
    final goToRegisterPageButton = find.byValueKey("loginViewSignUpRedirect");
    final emailInputField = find.byValueKey('registerViewEmailField');
    final userNameInputField = find.byValueKey('registerViewUsernameField');
    final teamNameInputField = find.byValueKey('registerViewTeamNameField');
    final passwordInputField = find.byValueKey('registerViewPasswordField');
    final confirmPasswordInputField =
        find.byValueKey('registerViewConfirmPasswordField');
    final signUpButton = find.byValueKey('registerViewRegisterButton');
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

    Future<bool> isPresent(SerializableFinder byValueKey,
        {Duration timeout = const Duration(seconds: 1)}) async {
      try {
        await driver.waitFor(byValueKey, timeout: timeout);
        return true;
      } catch (exception) {
        return false;
      }
    }

    // Connect to the Flutter driver before running any tests.
    setUpAll(() async {
      driver = await FlutterDriver.connect();
    });

    // Close the connection to the driver after the tests have completed.
    tearDownAll(() async {
      if (driver != null) {
        driver.close();
      }
    });

    test('Register User', () async {
      await driver.waitUntilFirstFrameRasterized();

      await driver.waitFor(goToRegisterPageButton);
      await driver.tap(goToRegisterPageButton);

      // email
      await driver.waitFor(emailInputField);
      await driver.tap(emailInputField);
      await driver.enterText("efpltest@gmail.com");

      // username
      await driver.tap(userNameInputField);
      await driver.enterText("Efpluser");

      // team name
      await driver.tap(teamNameInputField);
      await driver.enterText("Infotekkers");

      // password
      await driver.tap(passwordInputField);
      await driver.enterText("StrongPass@123456");

      // c password
      await driver.tap(confirmPasswordInputField);
      await driver.enterText("StrongPass@123456");

      // click button
      await driver.tap(signUpButton);

      //
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

      await Future.delayed(const Duration(seconds: 2));
    });
  });
}
