import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'pages_event.dart';
part 'pages_state.dart';
part 'pages_bloc.freezed.dart';

class PagesBloc extends Bloc<PagesEvent, PagesState> {
  PagesBloc() : super(const _Initial()) {
    on<PagesEvent>((event, emit) {
      emit(state.when(
          initial: () => const PagesState.running(0),
          running: (id) {
            return event.when(started: (id) => PagesState.running(id));
          }));
    });
  }
}
