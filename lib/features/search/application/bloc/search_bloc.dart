import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:pop_reference/features/search/domain/entities/search_entity.dart';
import 'package:pop_reference/features/search/domain/repositories/search_repository.dart';

part 'search_event.dart';
part 'search_state.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  SearchBloc(this.repository) : super(SearchInitial()) {
    on<SearchQuery>(_onSearchQuery);
  }

  final SearchRepository repository;

  Future<void> _onSearchQuery(
      SearchQuery event, Emitter<SearchState> emit) async {
    emit(SearchLoading());
    final result = await repository.search(event.query, 1);
    emit(SearchSuccess(searchEntity: result));
  }
}
