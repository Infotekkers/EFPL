// Imports the Flutter Driver API.
import 'package:flutter_driver/flutter_driver.dart';
import 'package:test/test.dart';

void main() {
  group('EPL Stats Test', () {
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
        'View Most Goals, Most Assists ,Most Reds, Most Yellows, Most Saves & Check League Table',
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
      await driver.tap(find.byTooltip("EPL Stats"));

      await driver.waitFor(find.text("Most Goals"));
      await driver.waitFor(find.text("Most Assists"));

      await driver.scrollUntilVisible(
          eflStatsScrollView, find.text("Most Saves"),
          dyScroll: -100);

      final SerializableFinder locateDrawer =
          find.byTooltip('Open navigation menu');

      await driver.tap(locateDrawer);
      await driver.tap(find.text("EPL Table"));

      await driver.waitFor(find.text("EFPL Standings"));
    });

    tearDownAll(() async {
      await driver.close();
    });
  }, timeout: Timeout.none);
}
