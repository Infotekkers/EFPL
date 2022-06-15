import 'package:efpl/application/auth/auth/auth_bloc.dart';
import 'package:efpl/application/util/util_bloc.dart';
import 'package:efpl/domain/auth/i_auth_repository.dart';
import 'package:efpl/infrastructure/auth/auth_repository.dart';
import 'package:efpl/presentation/authentication/register/register_view.dart';
import 'package:efpl/presentation/authentication/sign_in/widgets/sign_in_form.dart';
import 'package:efpl/presentation/authentication/splash_view.dart';
import 'package:efpl/presentation/core/app_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:integration_test/integration_test.dart';

import 'package:efpl/main.dart' as app;
import 'package:mockito/mockito.dart';

final getIt = GetIt.instance;

void setupDependencyInjection() {
  GetIt.instance.registerSingleton<AuthBloc>(AuthBloc(authorize()));
  GetIt.instance.registerSingleton<UtilBloc>(UtilBloc());
}

class MockNavigatorObserver extends Mock implements NavigatorObserver {}

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  group('Authentication Tests', () {
    setUpAll(() {
      setupDependencyInjection();
    });
    final mockObserver = MockNavigatorObserver();

    testWidgets(
      "Test",
      (WidgetTester tester) async {
        await tester.pumpWidget(MaterialApp(
          home: RegisterPage(),
          navigatorObservers: [mockObserver],
        ));
        await tester.pumpAndSettle();

        // Enter Email
        await tester.enterText(
            find.byKey(Key('registerViewEmailField')), "efpluser@gmail.com");

        // expect(find.byType(SplashView), findsOneWidget);
        // await Future.delayed(const Duration(seconds: 2));
        // await tester.tap(find.byKey(const Key("loginViewSignUpRedirect")));
      },
    );
  });
}
