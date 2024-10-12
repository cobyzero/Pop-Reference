import 'package:dio/dio.dart';
import 'package:pop_reference/core/network/dio.dart';

class SearchService {
  Future<Response> search(String query, int page) async {
    return await dio.get('/search', queryParameters: {
      'query': query,
      'page': page,
    });
  }
}
