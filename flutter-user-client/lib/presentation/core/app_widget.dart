import 'package:efpl/presentation/routes/routes.dart';
import 'package:flutter/material.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final AppRouter _appRouter = AppRouter();
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // Background Colors
        colorScheme: ColorScheme.fromSwatch(
          primarySwatch: Colors.blue,
        )
            .copyWith(
              secondary: Colors.amber,
            )
            .copyWith(
              tertiary: Colors.black,
            ),

        // text styles
        textTheme: const TextTheme(
          headline1: TextStyle(
            fontSize: 72.0,
            fontWeight: FontWeight.bold,
            color: Colors.pink,
            fontFamily: "Architect",
          ),
        ),
      ),
      initialRoute: "/",
      routes: _appRouter.allRoutes,
    );
  }
}
