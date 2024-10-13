part of 'search_bloc.dart';

@immutable
sealed class SearchEvent {}

final class SearchQuery extends SearchEvent {
  final String query;
  final int page;
  final FilterEntity filter;
  SearchQuery(this.query, this.page, this.filter);
}
