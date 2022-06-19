// Imports the Flutter Driver API.
import 'package:flutter_driver/flutter_driver.dart';
import 'package:test/test.dart';

void main() {
  group('Login User Tests', () {
    final emailInputField = find.byValueKey('loginViewUserName');
    final passwordInputField = find.byValueKey('loginViewPassword');
    final loginButton = find.byValueKey("loginViewLoginButton");
    final initialTransferMainKey = find.byValueKey("intialTransferViewMainKey");

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

      await driver.tap(loginButton);

      // expect
      await driver.waitFor(
        find.text("Invalid Email"),
      );
      await driver.waitFor(
        find.text(
            "Password must be 8 characters and include at least one uppercase, one lowercase, a symbol and a number"),
      );

      // Invalid Email Empty Password
      await driver.tap(emailInputField);
      await driver.enterText("efpl");

      await driver.tap(loginButton);

      // expect
      await driver.waitFor(
        find.text("Invalid Email"),
      );
      await driver.waitFor(
        find.text(
            "Password must be 8 characters and include at least one uppercase, one lowercase, a symbol and a number"),
      );

      // Valid email Invalid password
      await driver.tap(emailInputField);
      await driver.enterText("efpltest@gmail.com");

      await driver.tap(passwordInputField);
      await driver.enterText("StrongP");

      await driver.tap(loginButton);

      // expect
      await driver.waitFor(
        find.text(
            "Password must be 8 characters and include at least one uppercase, one lowercase, a symbol and a number"),
      );

      // Empty email Valid password
      await driver.tap(emailInputField);
      await driver.enterText("");

      await driver.tap(passwordInputField);
      await driver.enterText("StrongPass@123456");

      await driver.tap(loginButton);

      // expect
      await driver.waitFor(
        find.text("Invalid Email"),
      );

      // Invalid email Valid password
      await driver.tap(emailInputField);
      await driver.enterText("efpl");

      await driver.tap(passwordInputField);
      await driver.enterText("StrongPass@123456");

      await driver.tap(loginButton);

      // expect
      await driver.waitFor(
        find.text("Invalid Email"),
      );

      // Valid email Valid password
      await driver.tap(emailInputField);
      await driver.enterText("efpltest@gmail.com");

      await driver.tap(passwordInputField);
      await driver.enterText("StrongPass@123456");

      await driver.tap(loginButton);

      // expect
      await driver.waitFor(initialTransferMainKey);
    });

    tearDownAll(() async {
      await driver.close();
    });
  });
}
