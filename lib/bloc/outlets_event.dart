part of 'outlets_bloc.dart';

@freezed
class OutletsEvent with _$OutletsEvent {
  const factory OutletsEvent.started(Outlets outlets) = _Started;
}