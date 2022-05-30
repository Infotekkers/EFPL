import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:efpl/domain/custom_leagues/custom_leagues.dart';
import 'package:efpl/domain/custom_leagues/i_custom_leagues_repository.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'custom_leagues_bloc.freezed.dart';

part 'custom_leagues_event.dart';
part 'custom_leagues_state.dart';

@lazySingleton
class CustomLeaguesBloc extends Bloc<CustomLeaguesEvent, CustomLeaguesState> {
  final ICustomLeaguesRepository _iCustomLeaguesRepository;

  CustomLeaguesBloc(this._iCustomLeaguesRepository)
      : super(CustomLeaguesState.initial()) {
    on<_getUserCustomLeagues>(
      (event, emit) async {
        emit(
          state.copyWith(
            isLoading: true,
          ),
        );

        final Either<dynamic, List> failureOrSuccess =
            await _iCustomLeaguesRepository.getUserCustomLeagues(
                userId: '628a258d9c666191581a83f9');

        final List userCustomLeagues = failureOrSuccess.fold(
          (l) => l[0],
          (r) => r,
        );

        print("here");

        emit(
          state.copyWith(
            userCustomLeagues: userCustomLeagues,
            isLoading: false,
          ),
        );
      },
    );
  }
}
