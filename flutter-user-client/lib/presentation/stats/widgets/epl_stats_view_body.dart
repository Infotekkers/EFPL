import 'package:efpl/application/epl_stats/epl_stats_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EPLStatsViewBody extends StatelessWidget {
  const EPLStatsViewBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<EPLStatsBloc, EPLStatsState>(
      listener: (_, state) => {},
      builder: (context, state) => state.map(
        initial: (_) => Container(),
        loadInProgress: (_) => const Center(
          child: Text('Loading'),
        ),
        loadSuccess: (state) => Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ListView.builder(
                  itemCount: state.eplStats.length,
                  shrinkWrap: true,
                  itemBuilder: (BuildContext context, int index) {
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("${state.eplStats[index].name.getOrCrash()}"),
                        Text("${state.eplStats[index].amount.getOrCrash()}"),
                      ],
                    );
                  },
                ),
              ],
            ),
          ),
        ),
        loadFailure: (_) => const Center(
          child: Text("Error"),
        ),
      ),
    );
  }
}
