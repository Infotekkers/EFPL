// Imports the Flutter Driver API.
import 'package:flutter_driver/flutter_driver.dart';
import 'package:test/test.dart';

void main() {
  group('Points Test', () {
    final emailInputField = find.byValueKey('loginViewUserName');
    final passwordInputField = find.byValueKey('loginViewPassword');
    final loginButton = find.byValueKey("loginViewLoginButton");

    // final budget -5.7
    late FlutterDriver driver;
    setUpAll(() async {
      driver = await FlutterDriver.connect();
    });

    test('View Gameweek Points , Player Score Detail and Player Information',
        () async {
      // await render
      await driver.waitUntilFirstFrameRasterized();

      await driver.tap(find.byValueKey("publicPageSignInButton"));

      // Valid email Valid password
      await driver.tap(emailInputField);
      await driver.enterText("efpltest@gmail.com");

      await driver.tap(passwordInputField);
      await driver.enterText("StrongPass@123456");

      await driver.tap(loginButton);

      // go to points tab
      await driver.tap(find.byTooltip("Points"));

      await driver.waitFor(find.text("Mignot"));
      await driver.tap(find.text("Mignot"));

      await driver.waitFor(find.text("Total Sum"));

      await driver.tap(find.text("Player Information"));

      await driver.waitFor(find.text("Mignot Debebe"));

      await driver.waitFor(find.byTooltip("Back"));
    });

    tearDownAll(() async {
      await driver.close();
    });
  }, timeout: Timeout.none);
}
