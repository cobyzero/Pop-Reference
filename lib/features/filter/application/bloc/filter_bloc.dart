import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:pop_reference/features/filter/domain/entities/filter_entity.dart';
import 'package:pop_reference/features/search/application/bloc/search_bloc.dart';

part 'filter_event.dart';
part 'filter_state.dart';

class FilterBloc extends Bloc<FilterEvent, FilterState> {
  final SearchBloc searchBloc;
  FilterBloc(this.searchBloc)
      : super(FilterState(
            filter: FilterEntity(
          google: true,
          scielo: true,
          secureMode: true,
        ))) {
    on<FilterFiltersEvent>(_onFilterFiltersEvent);
  }

  void _onFilterFiltersEvent(
      FilterFiltersEvent event, Emitter<FilterState> emit) {
    final filter = FilterEntity(
      google: event.google ?? state.filter.google,
      scielo: event.scielo ?? state.filter.scielo,
      secureMode: event.secureMode ?? state.filter.secureMode,
    );
    emit(FilterState(filter: filter));
    searchBloc.add(SearchQuery(
      event.query,
      event.page,
      filter,
    ));
  }
}
