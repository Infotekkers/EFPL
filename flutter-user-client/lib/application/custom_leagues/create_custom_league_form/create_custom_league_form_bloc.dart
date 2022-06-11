import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:efpl/application/custom_leagues/custom_leagues_bloc.dart';
import 'package:efpl/domain/custom_leagues/custom_leagues.dart';
import 'package:efpl/domain/custom_leagues/i_custom_leagues_repository.dart';
import 'package:efpl/domain/custom_leagues/value_objects.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'create_custom_league_form_event.dart';
part 'create_custom_league_form_state.dart';

part 'create_custom_league_form_bloc.freezed.dart';

@injectable
class CreateCustomLeagueFormBloc
    extends Bloc<CreateCustomLeagueFormEvent, CreateCustomLeagueFormState> {
  final ICustomLeaguesRepository _customLeaguesRepository;
  CreateCustomLeagueFormBloc(this._customLeaguesRepository)
      : super(CreateCustomLeagueFormState.initial()) {
    on<_leagueNameChanged>(
      (event, emit) {
        emit(state.copyWith(
          leagueName: LeagueName(value: event.leagueNameStr),
        ));
      },
    );

    on<_createLeaguePressed>(
      (event, emit) async {
        emit(
          state.copyWith(
            isLoading: true,
          ),
        );

        final Either<dynamic, CustomLeaguesInfo> failureOrSuccess =
            await _customLeaguesRepository.createCustomLeague(
          userId: event.userId,
          leagueName: event.leagueName,
        );

        final CustomLeaguesInfo customLeaguesInfo = failureOrSuccess.fold(
          (l) => l,
          (r) => r,
        );

        // emit(
        //   state.copyWith();
        // );
      },
    );
  }
}
