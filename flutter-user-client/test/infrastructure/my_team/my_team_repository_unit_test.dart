import 'package:efpl/domain/my_team/my_team.dart';
import 'package:efpl/infrastructure/my_team/my_team_local_data_provider.dart';
import 'package:efpl/infrastructure/my_team/my_team_remote_data_provider.dart';
import 'package:efpl/infrastructure/my_team/my_team_repository.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:http/testing.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

@GenerateMocks([http.Client])
void main() async {
  final String _baseUrl = "${dotenv.env["API"]}";

  setUpAll(() async {
    TestWidgetsFlutterBinding.ensureInitialized();
    await dotenv.load();
  });

  group("My team", () {
    test("should return a valid my team object", () async {
      // final http.Client client = MockClient();
      const String userId = "101";
      const String gameweekId = "1";
      // final Uri url = Uri.parse("$_baseUrl/user/fetchOne/$userId");

      final myTeamLocalDataProvider = MyTeamLocalDataProvider();
      final myTeamRemoteDataProvider = MyTeamRemoteDataProvider();
      final myTeamRepo =
          MyTeamRepository(myTeamLocalDataProvider, myTeamRemoteDataProvider);

      final result = await myTeamRepo.getUserTeam(userId, gameweekId);

      expect(result.fold((l) => l, (r) => r), isA<MyTeam>());
    });
  });
}
