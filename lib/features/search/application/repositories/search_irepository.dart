import 'package:pop_reference/features/search/application/services/search_service.dart';
import 'package:pop_reference/features/search/domain/entities/search_entity.dart';
import 'package:pop_reference/features/search/domain/repositories/search_repository.dart';

class SearchIRepository implements SearchRepository {
  final SearchService service;

  SearchIRepository(this.service);

  @override
  Future<SearchEntity> search(String query, int page) async {
    final response = await service.search(query, page);
    return SearchEntity.fromJson(response.data);
  }
}
