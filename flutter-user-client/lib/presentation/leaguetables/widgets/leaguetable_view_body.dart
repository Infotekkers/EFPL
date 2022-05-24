import 'package:efpl/application/leagueTable/leaguetable_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:efpl/presentation/core/widgets/bouncing_ball_loading_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LeagueTableViewBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LeagueTableBloc, LeagueTableState>(
      listener: (_, __) => {},
      builder: (context, state) => state.map(
        initial: (_) => Container(
          child: const Text("Initial"),
        ),
        loadFailure: (_) => Container(
          child: const Text("Failure"),
        ),
        loadInProgress: (_) => const BouncingBallLoadingIndicator(),
        loadSuccess: (state) => Scaffold(
          appBar: AppBar(
            title: Text("EPL Table"),
          ),
          body: Column(
            children: [
              Container(
                child: Row(
                  children: const [Text("POS")],
                ),
              ),
              Expanded(
                  child: ListView.builder(
                      itemCount: state.leagueTable.length,
                      itemBuilder: ((context, index) =>
                          Text(index.toString()))))
            ],
          ),
        ),
      ),
    );
  }
}
