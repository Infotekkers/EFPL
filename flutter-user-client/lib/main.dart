import 'package:efpl/injectable.dart';
import 'package:efpl/presentation/core/app_widget.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:hive/hive.dart';
import 'package:injectable/injectable.dart';
import 'package:path_provider/path_provider.dart';

Future main() async {
  await dotenv.load(fileName: ".env");

  final appDocumentDirectory = await getApplicationDocumentsDirectory();

  Hive.init(appDocumentDirectory.path);

  var efplCache = await Hive.openBox('efplCache');
  // efplCache.clear();

  configureInjection(Environment.prod);
  runApp(const AppWidget());
}
