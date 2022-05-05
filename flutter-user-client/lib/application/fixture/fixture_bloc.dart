import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:efpl/domain/core/value_failures.dart';
import 'package:efpl/domain/fixture/fixture.dart';
import 'package:efpl/domain/fixture/fixture_failures.dart';
import 'package:efpl/domain/fixture/i_fixture_facade.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'fixture_event.dart';
part 'fixture_state.dart';
part 'fixture_bloc.freezed.dart';

@injectable
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
        final Either<FixtureFailures, List<Fixture>> failureOrSuccess =
            await _iFixtureRepository.getFixtureByGameWeekId(
          gameWeekId: state.gameWeekId,
        );

        final List<Fixture> allFixtures = failureOrSuccess.fold(
          (l) => [],
          (r) => r,
        );

        emit(
          state.copyWith(
            allFixtures: allFixtures,
            isLoading: false,
            fixtureFailureOrSuccess: some(failureOrSuccess),
          ),
        );
      },
    );

    // Increase GameWeek
    on<_increaseGameWeek>((event, emit) async {
      // increase GWN
      emit(
        state.copyWith(
          gameWeekId: state.gameWeekId >= 30 ? 1 : state.gameWeekId + 1,
          isLoading: true,
        ),
      );

      // get fixtures
      final Either<FixtureFailures, List<Fixture>> failureOrSuccess =
          await _iFixtureRepository.getFixtureByGameWeekId(
        gameWeekId: state.gameWeekId >= 30 ? 1 : state.gameWeekId + 1,
      );

      final List<Fixture> allFixtures = failureOrSuccess.fold(
        (l) => [],
        (r) => r,
      );

      emit(
        state.copyWith(
          allFixtures: allFixtures,
          fixtureFailureOrSuccess: some(failureOrSuccess),
          isLoading: false,
        ),
      );
    });

    // Decrease GameWeek
    on<_decreaseGameWeek>((event, emit) async {
      // increase GWN
      emit(
        state.copyWith(
          gameWeekId: state.gameWeekId <= 1 ? 30 : state.gameWeekId - 1,
          isLoading: true,
        ),
      );

      // get fixtures
      final Either<FixtureFailures, List<Fixture>> failureOrSuccess =
          await _iFixtureRepository.getFixtureByGameWeekId(
        gameWeekId: state.gameWeekId >= 30 ? 1 : state.gameWeekId + 1,
      );

      final List<Fixture> allFixtures = failureOrSuccess.fold(
        (l) => [],
        (r) => r,
      );

      emit(
        state.copyWith(
          allFixtures: allFixtures,
          fixtureFailureOrSuccess: some(failureOrSuccess),
          isLoading: false,
        ),
      );
    });

    // Fixture Changed
    on<_fixtureChanged>((event, emit) async {
      print("Changed Event");
    });
  }
}
