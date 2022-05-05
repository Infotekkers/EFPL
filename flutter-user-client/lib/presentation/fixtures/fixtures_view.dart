import 'package:flutter/material.dart';

class FixtureView extends StatelessWidget {
  const FixtureView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        "Fixtures",
        style: Theme.of(context).textTheme.headline1,
      ),
    );
  }
}
