import 'package:bloc/bloc.dart';
import 'package:efpl/domain/epl_stats/epl_stats.dart';
import 'package:efpl/domain/epl_stats/epl_stats_failure.dart';
import 'package:efpl/domain/epl_stats/i_epl_stats_repository.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'epl_stats_event.dart';
part 'epl_stats_state.dart';

part 'epl_stats_bloc.freezed.dart';

@lazySingleton
class EPLStatsBloc extends Bloc<EPLStatsEvent, EPLStatsState> {
  final IEPLStatsRepository ieplStatsRepository;

  EPLStatsBloc(this.ieplStatsRepository)
      : super(const EPLStatsState.initial()) {
    on<_GetEPLStats>(_onGetEPLStats);
  }

  void _onGetEPLStats(_GetEPLStats e, Emitter<EPLStatsState> emit) async {
    emit(const EPLStatsState.loadInProgress());

    final failureOrSuccess =
        await ieplStatsRepository.getEPLStats(statType: e.statType);

    failureOrSuccess.fold(
      (failure) => emit(EPLStatsState.loadFailure(failure)),
      (eplStats) => emit(EPLStatsState.loadSuccess(eplStats)),
    );
  }
}
