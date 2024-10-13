part of 'filter_bloc.dart';

@immutable
sealed class FilterEvent {}

class FilterFiltersEvent extends FilterEvent {
  final bool? google;
  final bool? scielo;
  final bool? secureMode;

  FilterFiltersEvent({this.google, this.scielo, this.secureMode});
}
