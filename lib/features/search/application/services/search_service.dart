import 'package:dio/dio.dart';
import 'package:pop_reference/core/network/dio.dart';
import 'package:pop_reference/features/search/domain/entities/search_dto.dart';

class SearchService {
  Future<Response> search(SearchDto searchDto) async {
    return await dio.get('/search', queryParameters: {
      'query': searchDto.query,
      'page': searchDto.page,
      'google': searchDto.filter.google,
      'scielo': searchDto.filter.scielo,
      'secureMode': searchDto.filter.secureMode,
    });
  }
}
