import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:efpl/domain/custom_leagues/custom_leagues.dart';
import 'package:efpl/domain/custom_leagues/custom_leagues_failures.dart';
import 'package:efpl/domain/custom_leagues/i_custom_leagues_repository.dart';
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
          const CustomLeaguesState.initial(),
        ) {
    on<_GetUserCustomLeagues>(_onGetUserCustomLeagues);
  }

  void _onGetUserCustomLeagues(
      _GetUserCustomLeagues e, Emitter<CustomLeaguesState> emit) async {
    emit(const CustomLeaguesState.loadInProgress());

    final failureOrSuccess =
        await iCustomLeaguesRepository.getUserCustomLeagues(userId: e.userId);

    failureOrSuccess.fold(
        (failure) => emit(CustomLeaguesState.loadFailure(failure)),
        (userCustomLeagues) => emit(
            CustomLeaguesState.loadUserCustomLeaguesSuccess(
                userCustomLeagues)));
  }
}
