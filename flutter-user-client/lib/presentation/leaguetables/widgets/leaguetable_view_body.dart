import 'package:efpl/application/leagueTable/leaguetable_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:efpl/presentation/core/widgets/bouncing_ball_loading_indicator.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LeagueTableViewBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LeagueTableBloc, LeagueTableState>(
        listener: (_, __) => {},
        builder: (context, state) => state.map(
            initial: (_) => Container(),
            loadFailure: (_) => Container(),
            loadInProgress: (_) => const BouncingBallLoadingIndicator(),
            loadSuccess: (state) => Column(children: [])));
  }
}
