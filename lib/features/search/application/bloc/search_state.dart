part of 'search_bloc.dart';

abstract class SearchState {
  const SearchState({this.isActive});
  final bool? isActive;
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
