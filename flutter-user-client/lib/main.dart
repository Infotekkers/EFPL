import 'package:efpl/injectable.dart';
import 'package:efpl/presentation/core/app_widget.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:injectable/injectable.dart';

Future main() async {
  await dotenv.load(fileName: ".env");
  configureInjection(Environment.prod);
  runApp(const AppWidget());
}
