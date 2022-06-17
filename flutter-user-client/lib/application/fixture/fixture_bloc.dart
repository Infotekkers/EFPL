import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:efpl/domain/fixture/fixture.dart';
import 'package:efpl/domain/fixture/i_fixture_facade.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'fixture_event.dart';
part 'fixture_state.dart';
part 'fixture_bloc.freezed.dart';

@lazySingleton
class FixtureBloc extends Bloc<FixtureEvent, FixtureState> {
  final IFixtureRepository _iFixtureRepository;
  FixtureBloc(this._iFixtureRepository) : super(FixtureState.initial()) {
    // Load Fixtures
    on<_loadFixtures>(
      (event, emit) async {
        // Start Loading
        emit(
          state.copyWith(
            isLoading: true,
          ),
        );

        // get fixtures
        final Either<dynamic, List<Fixture>> failureOrSuccess =
            await _iFixtureRepository.getFixtureByGameWeekId(
          gameWeekId: state.gameWeekId,
        );

        final List<Fixture> allFixtures = failureOrSuccess.fold(
          (l) => l[0],
          (r) => r,
        );

        emit(
          state.copyWith(
            gameWeekId: allFixtures.isNotEmpty
                ? allFixtures[0].gameWeekId.value.fold(
                      (l) => 1,
                      (r) => r,
                    )
                : 1,
            allFixtures: allFixtures,
            isLoading: false,
            valueFailureOrSuccess: some(failureOrSuccess),
          ),
        );
      },
    );

    // Increase GameWeek
    on<_increaseGameWeek>((event, emit) async {
      // increase GWN
      int toSetGameWeek = state.gameWeekId + 1;
      if (state.gameWeekId == 30) {
        toSetGameWeek = 1;
      }

      emit(
        state.copyWith(
          gameWeekId: toSetGameWeek,
          isLoading: true,
        ),
      );

      // get fixtures
      final Either<dynamic, List<Fixture>> failureOrSuccess =
          await _iFixtureRepository.getFixtureByGameWeekId(
        gameWeekId: toSetGameWeek,
      );

      final List<Fixture> allFixtures = failureOrSuccess.fold(
        (l) => l[0],
        (r) => r,
      );

      emit(
        state.copyWith(
          allFixtures: allFixtures,
          valueFailureOrSuccess: some(failureOrSuccess),
          isLoading: false,
        ),
      );
    });

    // Decrease GameWeek
    on<_decreaseGameWeek>((event, emit) async {
      // decrease GWN
      int toSetGameWeek = state.gameWeekId - 1;
      if (state.gameWeekId == 1) {
        toSetGameWeek = 30;
      }

      emit(
        state.copyWith(
          gameWeekId: toSetGameWeek,
          isLoading: true,
        ),
      );

      // get fixtures
      final Either<dynamic, List<Fixture>> failureOrSuccess =
          await _iFixtureRepository.getFixtureByGameWeekId(
        gameWeekId: toSetGameWeek,
      );

      final List<Fixture> allFixtures = failureOrSuccess.fold(
        (l) => l[0],
        (r) => r,
      );

      emit(
        state.copyWith(
          allFixtures: allFixtures,
          valueFailureOrSuccess: some(failureOrSuccess),
          isLoading: false,
        ),
      );
    });

    // Fixture Changed
    on<_fixtureChanged>((event, emit) async {});
  }
}
