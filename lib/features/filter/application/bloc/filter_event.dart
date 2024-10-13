part of 'filter_bloc.dart';

@immutable
sealed class FilterEvent {}

class FilterFiltersEvent extends FilterEvent {
  final bool? google;
  final bool? scielo;
  final bool? secureMode;
  final String query;
  final int page;
  FilterFiltersEvent({
    this.google,
    this.scielo,
    this.secureMode,
    required this.query,
    required this.page,
  });
}
