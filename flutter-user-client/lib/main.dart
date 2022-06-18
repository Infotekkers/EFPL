import 'package:efpl/Blocobserver.dart';
import 'package:efpl/injectable.dart';
import 'package:efpl/presentation/core/app_widget.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:injectable/injectable.dart';

Future main() async {
  await dotenv.load(fileName: ".env");
  await Hive.initFlutter();

  await Hive.openBox("myTeamCache");
  await Hive.openBox("transferCache");
  await Hive.openBox("fixtureCache");
  await Hive.openBox("pointsCache");
  await Hive.openBox("userDetailCache");

  configureInjection(Environment.prod);
  BlocOverrides.runZoned(() {
    runApp(const AppWidget());
  }, blocObserver: MyBlocObserver());
}
