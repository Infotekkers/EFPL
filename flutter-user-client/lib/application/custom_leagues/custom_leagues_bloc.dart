import 'package:bloc/bloc.dart';
import 'package:efpl/domain/custom_leagues/custom_leagues.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'custom_leagues_bloc.freezed.dart';

part 'custom_leagues_event.dart';
part 'custom_leagues_state.dart';

class CustomLeaguesBloc extends Bloc<CustomLeaguesEvent, CustomLeaguesState> {
  CustomLeaguesBloc() : super(CustomLeaguesState.initial()) {
    on<CustomLeaguesEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
