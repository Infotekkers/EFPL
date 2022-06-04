import 'package:bloc/bloc.dart';
import 'package:efpl/domain/efpl_stats/i_efpl_stats_facade..dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'efpl_stats_event.dart';
part 'efpl_stats_state.dart';
part 'efpl_stats_bloc.freezed.dart';

@lazySingleton
class EfplStatsBloc extends Bloc<EfplStatsEvent, EfplStatsState> {
  final IEFPLStatsRepository iefplStatsRepository;

  EfplStatsBloc(this.iefplStatsRepository) : super(EfplStatsState.initial()) {
    on<_GetEfplStats>((event, emit) {
      // TODO: implement event handler
      print("@BLOC");
    });
  }
}
