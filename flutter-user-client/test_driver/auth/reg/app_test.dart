// Imports the Flutter Driver API.
import 'package:flutter_driver/flutter_driver.dart';
import 'package:test/test.dart';

void main() {
  group('Register User Tests', () {
    // public page

    // login page
    final goToRegisterPageButton = find.byValueKey("loginViewSignUpRedirect");
    final emailInputField = find.byValueKey('registerViewEmailField');
    final userNameInputField = find.byValueKey('registerViewUsernameField');
    final teamNameInputField = find.byValueKey('registerViewTeamNameField');
    final passwordInputField = find.byValueKey('registerViewPasswordField');
    final confirmPasswordInputField =
        find.byValueKey('registerViewConfirmPasswordField');
    final signUpButton = find.byValueKey('registerViewRegisterButton');
    final initialTransferMainKey = find.byValueKey("intialTransferViewMainKey");

    // final transferListViewMainView =
    // find.byValueKey("transferListViewListViewMain");
    // final transferPlayerCardTransferButton =
    // find.byValueKey("transferPlayerCardTransferButton");

    // Player selection
    // final initialTransferGKKey1 = find.byValueKey("initialTransferViewGKKey1");
    // final initialTransferGKKey2 = find.byValueKey("initialTransferViewGKKey2");
    // final selectedGK1 = find.text("Abel Mamo");
    // final selectedGK2 = find.text("Harriston Hessou");

    late FlutterDriver driver;

    // Connect to the Flutter driver before running any tests.
    setUpAll(() async {
      driver = await FlutterDriver.connect();
    });

    // Close the connection to the driver after the tests have completed.

    test('Full Test', () async {
      // await render
      await driver.waitUntilFirstFrameRasterized();

      await driver.tap(find.byValueKey("publicPageSignInButton"));

      // go to register page
      await driver.waitFor(goToRegisterPageButton);
      await driver.tap(goToRegisterPageButton);

      // sign up
      await driver.tap(signUpButton);

      // expect
      await driver.waitFor(
        find.text("Invalid Email"),
      );
      await driver.waitFor(
        find.text("Invalid Username"),
      );
      await driver.waitFor(
        find.text("Invalid Team Name"),
      );

      /*
        Invalid Email
      */
      await driver.tap(emailInputField);
      await driver.enterText("efpltestemail");

      // expect
      await driver.waitFor(
        find.text("Invalid Email"),
      );
      await driver.waitFor(
        find.text("Invalid Username"),
      );
      await driver.waitFor(
        find.text("Invalid Team Name"),
      );

      /*
        Valid Email
      */
      await driver.waitFor(emailInputField);
      await driver.enterText("efpltest@gmail.com");

      // expect
      await driver.waitFor(
        find.text("Invalid Username"),
      );
      await driver.waitFor(
        find.text("Invalid Team Name"),
      );

      /*
        Invalid Username
      */
      await driver.tap(userNameInputField);
      await driver.enterText("Ef");

      await driver.waitFor(
        find.text("Invalid Username"),
      );
      await driver.waitFor(
        find.text("Invalid Team Name"),
      );

      /*
        Valid Username
      */
      // username
      await driver.tap(userNameInputField);
      await driver.enterText("Efpluser");

      // expect
      await driver.waitFor(
        find.text("Invalid Team Name"),
      );

      /*
        Invalid Team name 
      */
      // team name
      await driver.tap(teamNameInputField);
      await driver.enterText("In");

      // expect
      await driver.waitFor(
        find.text("Invalid Team Name"),
      );

      /*
        Valid Team name 
      */
      // team name
      await driver.tap(teamNameInputField);
      await driver.enterText("Infotekkers");

      // expect
      await driver.waitFor(
        find.text(
            "Password must be 8 characters and include at least one uppercase, one lowercase, a symbol and a number"),
      );

      /*
        Invalid Password 
      */
      await driver.tap(passwordInputField);
      await driver.enterText("StrongPass");

      // expect
      await driver.waitFor(
        find.text(
            "Password must be 8 characters and include at least one uppercase, one lowercase, a symbol and a number"),
      );

      /*
        Valid Password 
      */
      await driver.tap(passwordInputField);
      await driver.enterText("StrongPass@123456");

      // expect
      await driver.waitFor(
        find.text(
            "Password must be 8 characters and include at least one uppercase, one lowercase, a symbol and a number"),
      );

      /*
        Invalid C Password 
      */
      await driver.tap(confirmPasswordInputField);
      await driver.enterText("StrongPass");

      // expect
      await driver.waitFor(
        find.text(
            "Password must be 8 characters and include at least one uppercase, one lowercase, a symbol and a number"),
      );

      /*
        Valid  C Password no match 
      */
      await driver.tap(confirmPasswordInputField);
      await driver.enterText("StrongPass@1234567");

      // button
      await driver.tap(signUpButton);

      // expect
      await driver.waitFor(
        find.text(
          "Password do not match",
        ),
      );

      /*
        Valid  C Password with match 
      */
      await driver.tap(confirmPasswordInputField);
      await driver.enterText("StrongPass@123456");

      // button
      await driver.tap(signUpButton);

      // expect
      await driver.waitFor(initialTransferMainKey);
    });

    tearDownAll(() async {
      await driver.close();
    });
  }, timeout: Timeout.none);
}
