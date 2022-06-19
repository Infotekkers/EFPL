// Imports the Flutter Driver API.
import 'package:flutter_driver/flutter_driver.dart';
import 'package:test/test.dart';

void main() {
  group('EFPL Stats Test', () {
    final emailInputField = find.byValueKey('loginViewUserName');
    final passwordInputField = find.byValueKey('loginViewPassword');
    final loginButton = find.byValueKey("loginViewLoginButton");

    final eflStatsScrollView = find.byValueKey("eplStatsScrollView");

    // final budget -5.7
    late FlutterDriver driver;
    setUpAll(() async {
      driver = await FlutterDriver.connect();
    });

    test(
        'View Highest & Average Points, Most Captained Player .. and Dream Team',
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

      final SerializableFinder locateDrawer =
          find.byTooltip('Open navigation menu');

      await driver.tap(locateDrawer);

      await driver.tap(find.text("EFPL Stats"));
      await driver.waitFor(find.text("Highest Points"));

      await driver.tap(find.byTooltip("Show Gameweek Dream Team"));
    });

    tearDownAll(() async {
      await driver.close();
    });
  }, timeout: Timeout.none);
}
