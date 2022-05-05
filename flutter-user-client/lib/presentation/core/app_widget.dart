import 'package:efpl/presentation/core/MainTabView.dart';
import 'package:efpl/presentation/routes/Routes.dart';
import 'package:flutter/material.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final AppRouter _appRouter = AppRouter();
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: "/",
      routes: _appRouter.allRoutes,
    );
  }
}
