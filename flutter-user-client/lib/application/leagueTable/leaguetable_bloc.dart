import 'package:bloc/bloc.dart';
import 'package:efpl/domain/league_table/i_league_table_repository.dart';
import 'package:efpl/domain/league_table/league_table.dart';
import 'package:efpl/domain/league_table/league_table_failure.dart';
import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import '../../domain/league_table/league_table.dart';

part 'leaguetable_event.dart';
part 'leaguetable_state.dart';

part 'leaguetable_bloc.freezed.dart';

@injectable
class LeagueTableBloc extends Bloc<LeagueTableEvent, LeagueTableState> {
  final ILeagueTableRepository iLeagueTableRepository;

  LeagueTableBloc(this.iLeagueTableRepository)
      : super(const LeagueTableState.initial()) {
    on<_LoadLeagueTable>(_onLoadLeagueTable);
  }

  void _onLoadLeagueTable(
      _LoadLeagueTable e, Emitter<LeagueTableState> emit) async {
    emit(const LeagueTableState.loadInProgress());

    final failureOrSuccess = await iLeagueTableRepository.getTeams();
    failureOrSuccess.fold(
      (failure) => emit(
        LeagueTableState.loadFailure(failure),
      ),
      (leagueTable) {
        // print(leagueTable);
        emit(
          LeagueTableState.loadSuccess(leagueTable),
        );
      },
    );
  }
}
