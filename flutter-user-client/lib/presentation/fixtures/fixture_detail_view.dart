import 'package:efpl/domain/fixture/fixture.dart';
import 'package:flutter/material.dart';

class FixtureDetailView extends StatelessWidget {
  const FixtureDetailView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Map<String, Fixture> fixture =
        ModalRoute.of(context)?.settings.arguments as Map<String, Fixture>;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber,
        foregroundColor: Colors.black,
      ),
      body: Text(
        fixture['fixture']!.gameWeekId.value.fold(
              (l) => '',
              (r) => r.toString(),
            ),
      ),
    );
  }
}
