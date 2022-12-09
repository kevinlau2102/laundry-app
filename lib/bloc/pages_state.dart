part of 'pages_bloc.dart';

@freezed
class PagesState with _$PagesState {
  const factory PagesState.initial() = _Initial;
  const factory PagesState.running(int id) = _Running;
}
