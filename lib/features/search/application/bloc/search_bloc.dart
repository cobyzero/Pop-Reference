import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:pop_reference/features/filter/domain/entities/filter_entity.dart';
import 'package:pop_reference/features/search/domain/entities/search_dto.dart';
import 'package:pop_reference/features/search/domain/entities/search_entity.dart';
import 'package:pop_reference/features/search/domain/repositories/search_repository.dart';

part 'search_event.dart';
part 'search_state.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  SearchBloc(this.repository) : super(const SearchInitial()) {
    on<SearchQuery>(_onSearchQuery);
  }

  final SearchRepository repository;

  Future<void> _onSearchQuery(
      SearchQuery event, Emitter<SearchState> emit) async {
    emit(const SearchLoading());
    final result = await repository.search(
      SearchDto(
        query: event.query,
        page: event.page,
        filter: event.filter,
      ),
    );
    emit(SearchSuccess(searchEntity: result));
  }
}
