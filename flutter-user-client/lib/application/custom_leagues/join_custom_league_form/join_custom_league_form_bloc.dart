import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:efpl/domain/custom_leagues/custom_leagues.dart';
import 'package:efpl/domain/custom_leagues/i_custom_leagues_repository.dart';
import 'package:efpl/domain/custom_leagues/value_objects.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'join_custom_league_form_event.dart';
part 'join_custom_league_form_state.dart';

part 'join_custom_league_form_bloc.freezed.dart';

@injectable
class JoinCustomLeagueFormBloc
    extends Bloc<JoinCustomLeagueFormEvent, JoinCustomLeagueFormState> {
  final ICustomLeaguesRepository _customLeaguesRepository;

  JoinCustomLeagueFormBloc(this._customLeaguesRepository)
      : super(JoinCustomLeagueFormState.initial()) {
    on<_leagueCodeChanged>(
      (event, emit) {
        emit(
          state.copyWith(
            leagueCode: LeagueCode(value: event.leagueCodeStr),
          ),
        );
      },
    );

    on<_joinLeaguePressed>(
      (event, emit) async {
        final leagueCodeStr = state.leagueCode.getOrCrash();

        emit(
          state.copyWith(
            isLoading: true,
          ),
        );

        final Either<dynamic, CustomLeaguesInfo> failureOrSuccess =
            await _customLeaguesRepository.joinCustomLeague(
          userId: "62960c04c1a572a276b6e08b",
          leagueCode: leagueCodeStr,
        );

        final CustomLeaguesInfo customLeaguesInfo = failureOrSuccess.fold(
          (l) => l,
          (r) => r,
        );

        emit(
          state.copyWith(
            isLoading: false,
          ),
        );
      },
    );
  }
}
