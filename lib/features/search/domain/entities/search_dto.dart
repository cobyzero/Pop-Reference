import 'package:pop_reference/features/filter/domain/entities/filter_entity.dart';

class SearchDto {
  final String query;
  final int page;
  final FilterEntity filter;
  SearchDto({
    required this.query,
    required this.page,
    required this.filter,
  });
}
