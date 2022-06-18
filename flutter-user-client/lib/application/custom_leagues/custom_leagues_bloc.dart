import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:efpl/domain/custom_leagues/custom_leagues.dart';
import 'package:efpl/domain/custom_leagues/custom_leagues_failures.dart';
import 'package:efpl/domain/custom_leagues/i_custom_leagues_repository.dart';
import 'package:efpl/domain/custom_leagues/value_objects.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'custom_leagues_bloc.freezed.dart';

part 'custom_leagues_event.dart';
part 'custom_leagues_state.dart';

@lazySingleton
class CustomLeaguesBloc extends Bloc<CustomLeaguesEvent, CustomLeaguesState> {
  final ICustomLeaguesRepository iCustomLeaguesRepository;

  CustomLeaguesBloc(this.iCustomLeaguesRepository)
      : super(
          CustomLeaguesState.initial(),
        ) {
    on<_getUserCustomLeagues>(_onGetUserCustomLeagues);
    on<_getCustomLeagueInfo>(_onGetCustomLeagueInfo);
    on<_leaveCustomLeague>(_onLeaveCustomLeague);
  }

  void _onGetUserCustomLeagues(
    _getUserCustomLeagues e,
    Emitter<CustomLeaguesState> emit,
  ) async {
    emit(
      state.copyWith(
        isLoading: true,
      ),
    );

    print("here");

    final Either<dynamic, List<CustomLeagues>> failureOrSuccess =
        await iCustomLeaguesRepository.getUserCustomLeagues(userId: e.userId);

    final List<CustomLeagues> userCustomLeagues = failureOrSuccess.fold(
      (l) => l,
      (r) => r,
    );

    emit(
      state.copyWith(
        userCustomLeagues: userCustomLeagues,
        isLoading: false,
        valueFailureOrSuccess: some(failureOrSuccess),
      ),
    );
  }

  void _onGetCustomLeagueInfo(
    _getCustomLeagueInfo e,
    Emitter<CustomLeaguesState> emit,
  ) async {
    emit(
      state.copyWith(
        isLoading: true,
      ),
    );

    final Either<dynamic, CustomLeaguesInfo> failureOrSuccess =
        await iCustomLeaguesRepository.getCustomLeagueInfo(
            leagueId: e.leagueId);

    final CustomLeaguesInfo customLeaguesInfo = failureOrSuccess.fold(
      (l) => l,
      (r) => r,
    );

    emit(
      state.copyWith(
        isLoading: false,
        customLeaguesInfo: customLeaguesInfo,
      ),
    );
  }

  void _onLeaveCustomLeague(
    _leaveCustomLeague e,
    Emitter<CustomLeaguesState> emit,
  ) async {
    emit(
      state.copyWith(
        isLoading: true,
      ),
    );

    final Either<dynamic, dynamic> failureOrSuccess =
        await iCustomLeaguesRepository.leaveCustomLeague(
      userId: e.userId,
      leagueCode: e.leagueCode,
    );

    emit(state.copyWith(
      isLoading: false,
    ));
  }
}
