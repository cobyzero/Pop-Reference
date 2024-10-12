part of 'search_bloc.dart';

class SearchState {
  final bool? isActive;
  final bool google;
  final bool scielo;
  final bool secureMode;
  const SearchState({
    this.isActive = false,
    this.google = true,
    this.scielo = true,
    this.secureMode = true,
  });

  SearchState copyWith({
    bool? isActive,
    bool? google,
    bool? scielo,
    bool? secureMode,
  }) {
    return SearchState(
      isActive: isActive ?? this.isActive,
      google: google ?? this.google,
      scielo: scielo ?? this.scielo,
      secureMode: secureMode ?? this.secureMode,
    );
  }
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
