import 'package:pop_reference/features/search/domain/entities/search_dto.dart';
import 'package:pop_reference/features/search/domain/entities/search_entity.dart';

abstract class SearchRepository {
  Future<SearchEntity> search(SearchDto searchDto);
}
