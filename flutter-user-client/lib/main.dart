import 'package:efpl/infrastructure/my_team/my_team_remote_data_provider.dart';
import 'package:efpl/injectable.dart';
import 'package:efpl/presentation/core/app_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:injectable/injectable.dart';

Future main() async {
  await dotenv.load(fileName: "../.env");
  dynamic result =
      await MyTeamRemoteDataProvider().getUserTeam('623b101b9a85861e924388dd');
  print(result);
  configureInjection(Environment.prod);
  runApp(AppWidget());
}
