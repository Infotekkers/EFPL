import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'leaguetable_event.dart';
part 'leaguetable_state.dart';

class LeaguetableBloc extends Bloc<LeaguetableEvent, LeaguetableState> {
  LeaguetableBloc() : super(LeaguetableInitial()) {
    on<LeaguetableEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
