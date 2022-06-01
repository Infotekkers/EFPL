import 'package:efpl/application/custom_leagues/custom_leagues_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UserCustomLeaguesView extends StatelessWidget {
  const UserCustomLeaguesView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CustomLeaguesBloc, CustomLeaguesState>(
      listener: (_, state) => {},
      builder: (_, state) => state.map(
        initial: (_) => Container(),
        loadFailure: (_) => const Text("Failure"),
        loadInProgress: (_) => const Text("Loading"),
        loadUserCustomLeaguesSuccess: (_) => const Text("Load Success!"),
      ),
    );
  }
}
