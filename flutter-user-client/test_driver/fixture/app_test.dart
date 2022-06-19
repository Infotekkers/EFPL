// Imports the Flutter Driver API.
import 'package:flutter_driver/flutter_driver.dart';
import 'package:test/test.dart';

void main() {
  group('Fixtures Test', () {
    final emailInputField = find.byValueKey('loginViewUserName');
    final passwordInputField = find.byValueKey('loginViewPassword');
    final loginButton = find.byValueKey("loginViewLoginButton");

    final nextGameWeekButton = find.byValueKey("fixtureViewNextGWKey");
    final prevGameWeekButton = find.byValueKey("fixtureViewPrevGWKey");

    // final budget -5.7
    late FlutterDriver driver;
    setUpAll(() async {
      driver = await FlutterDriver.connect();
    });

    test('View Next Gameweek & Previous Gameweek ,View Fixture Detail',
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

      // go to fixtures tab
      await driver.tap(find.byTooltip("Fixtures"));

      await driver.waitFor(find.text("Saint George"));

      await driver.tap(nextGameWeekButton);
      await driver.waitFor(find.text("Saint George"));
      // await Future.delayed(const Duration(seconds: 2));

      await driver.tap(prevGameWeekButton);
      await driver.waitFor(find.text("Saint George"));
      // await Future.delayed(const Duration(seconds: 2));

      await driver.tap(prevGameWeekButton);
      await driver.waitFor(find.text("Saint George"));
      // await Future.delayed(const Duration(seconds: 2));

      await driver.tap(nextGameWeekButton);
      await driver.waitFor(find.text("Saint George"));
      await driver.tap(find.text("Saint George"));
      await driver.waitFor(find.text("Saint George"));
      await driver.waitFor(find.text("Events"));

      await driver.tap(find.byTooltip("Back"));
    });

    tearDownAll(() async {
      await driver.close();
    });
  }, timeout: Timeout.none);
}
