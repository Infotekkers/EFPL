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

      // Valid email Valid password
      await driver.tap(emailInputField);
      await driver.enterText("efpltest@gmail.com");

      await driver.tap(passwordInputField);
      await driver.enterText("StrongPass@123456");

      await driver.tap(loginButton);

      await driver.waitFor(find.text("Daniel"));
      await driver.tap(find.text("Daniel"));

      await driver.waitFor(find.text("Total Sum"));

      await driver.tap(find.text("Player Information"));

      await driver.waitFor(find.text("Daniel Teshome"));
    });

    tearDownAll(() async {
      await driver.close();
    });
  }, timeout: Timeout.none);
}
