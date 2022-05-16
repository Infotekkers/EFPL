import 'package:bloc/bloc.dart';
import 'package:efpl/domain/my_team/i_my_team_repository.dart';
import 'package:efpl/domain/my_team/my_team.dart';
import 'package:efpl/domain/my_team/my_team_failures.dart';
import 'package:efpl/domain/my_team/value_objects.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'myteam_event.dart';
part 'myteam_state.dart';

part 'myteam_bloc.freezed.dart';

@injectable
class MyTeamBloc extends Bloc<MyTeamEvent, MyTeamState> {
  final IMyTeamRepository _iMyTeamRepository;

  MyTeamBloc(this._iMyTeamRepository) : super(const MyTeamState.initial()) {
    on<MyTeamEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
