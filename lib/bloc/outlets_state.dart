part of 'outlets_bloc.dart';

@freezed
class OutletsState with _$OutletsState {
  const factory OutletsState.initial() = _Initial;
  const factory OutletsState.running(Outlets outlets) = _Running;
}
