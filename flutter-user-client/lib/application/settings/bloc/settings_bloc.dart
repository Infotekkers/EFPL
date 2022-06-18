import 'package:bloc/bloc.dart';
import 'package:efpl/domain/settings/settings.dart';
import 'package:efpl/domain/settings/settings_failures.dart';
import 'package:efpl/domain/settings/i_settings_repository.dart';
import 'package:efpl/domain/settings/value_objects.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'settings_event.dart';
part 'settings_state.dart';
part 'settings_bloc.freezed.dart';

@lazySingleton
class SettingsBloc extends Bloc<SettingsEvent, SettingsState> {
  final ISettingsRepository iSettingsRepository;

  SettingsBloc(this.iSettingsRepository)
      : super(const SettingsState.initial()) {
    on<_LoadUserDetail>(_onLoadUserDetail);
    on<_UpdateUserDetail>(_onUpdateUserDetail);
  }

  void _onLoadUserDetail(_LoadUserDetail e, Emitter<SettingsState> emit) async {
    emit(const SettingsState.loadInProgress());

    final failureOrSuccess = await iSettingsRepository.getUserDetail(e.userId);
    // print(failureOrSuccess);

    failureOrSuccess.fold(
      (failure) => emit(
        SettingsState.loadFailure(failure),
      ),
      (userDetail) => emit(
        SettingsState.loadSuccess(userDetail),
      ),
    );
  }

  void _onUpdateUserDetail(
      _UpdateUserDetail e, Emitter<SettingsState> emit) async {
    emit(const SettingsState.loadInProgress());
    final failureOrSuccess =
        await iSettingsRepository.updateUserDetail(e.userDetail, e.userId);

    if (failureOrSuccess.fold(
      (failure) => false,
      (success) => true,
    )) {
      emit(SettingsState.update(e.userDetail));
    } else {
      emit(SettingsState.loadFailure(failureOrSuccess.foldLeft(
          const SettingsFailure.localDBError(), (failure, r) => failure)));
    }
  }
}
