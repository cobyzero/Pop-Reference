import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:pop_reference/features/search/domain/entities/search_dto.dart';
import 'package:pop_reference/features/search/domain/entities/search_entity.dart';
import 'package:pop_reference/features/search/domain/repositories/search_repository.dart';

part 'search_event.dart';
part 'search_state.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  SearchBloc(this.repository) : super(const SearchInitial()) {
    on<SearchQuery>(_onSearchQuery);
    on<SearchFilters>(_onSearchFilters);
  }

  final SearchRepository repository;

  Future<void> _onSearchQuery(
      SearchQuery event, Emitter<SearchState> emit) async {
    emit(const SearchLoading());
    final result = await repository.search(
      SearchDto(
        query: event.query,
        page: event.page,
        google: state.google,
        scielo: state.scielo,
        secureMode: state.secureMode,
      ),
    );
    emit(SearchSuccess(searchEntity: result));
  }

  Future<void> _onSearchFilters(
      SearchFilters event, Emitter<SearchState> emit) async {
    emit(state.copyWith(
      google: event.google,
      scielo: event.scielo,
      secureMode: event.secureMode,
    ));

    add(SearchQuery(event.query, event.page));
  }
}
