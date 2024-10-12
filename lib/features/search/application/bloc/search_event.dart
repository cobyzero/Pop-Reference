part of 'search_bloc.dart';

@immutable
sealed class SearchEvent {}

final class SearchQuery extends SearchEvent {
  final String query;

  SearchQuery(this.query);
}
