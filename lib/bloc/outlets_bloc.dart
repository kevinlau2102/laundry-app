import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:laundry_app/entities/outlets.dart';

part 'outlets_event.dart';
part 'outlets_state.dart';
part 'outlets_bloc.freezed.dart';

class OutletsBloc extends Bloc<OutletsEvent, OutletsState> {
  OutletsBloc() : super(_Initial()) {
    Outlets outlets = Outlets();
    on<OutletsEvent>((event, emit) {
      emit(state.when(initial: () => OutletsState.running(outlets), running: (outlets) {
        return event.when(started: (outlets) => OutletsState.running(outlets));
      }));
    });
  }
}
