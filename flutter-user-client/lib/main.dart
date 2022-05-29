import 'package:efpl/injectable.dart';
import 'package:efpl/presentation/core/app_widget.dart';
// import 'package:efpl/presentation/team/team_view.dart';
// import 'package:efpl/services/test_data_providers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:injectable/injectable.dart';

Future main() async {
  await dotenv.load(fileName: "../.env");
  await Hive.initFlutter();
  await Hive.openBox("myTeamCache");
  await Hive.openBox("transferCache");
  await Hive.openBox("fixtureCache");
  await Hive.openBox("pointsCache");

  configureInjection(Environment.prod);
  runApp(const AppWidget());
}
