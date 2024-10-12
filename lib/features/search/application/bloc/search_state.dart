part of 'search_bloc.dart';

@immutable
sealed class SearchState {
  final bool? isActive;

  const SearchState({this.isActive = false});
}

final class SearchInitial extends SearchState {
  const SearchInitial();
}

final class SearchLoading extends SearchState {
  const SearchLoading();
}

final class SearchSuccess extends SearchState {
  final SearchEntity searchEntity;

  const SearchSuccess({required this.searchEntity, super.isActive = true});
}

final class SearchFailure extends SearchState {
  final String message;

  const SearchFailure({required this.message});
}
