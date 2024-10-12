part of 'search_bloc.dart';

@immutable
sealed class SearchEvent {}

final class SearchQuery extends SearchEvent {
  final String query;
  final int page;

  SearchQuery(this.query, this.page);
}

final class SearchFilters extends SearchEvent {
  final bool google;
  final bool scielo;
  final bool secureMode;
  final String query;
  final int page;
  SearchFilters({
    this.google = false,
    this.scielo = false,
    this.secureMode = true,
    required this.query,
    required this.page,
  });
}
