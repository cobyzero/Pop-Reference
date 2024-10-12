import 'package:get_it/get_it.dart';
import 'package:pop_reference/features/search/application/repositories/search_irepository.dart';
import 'package:pop_reference/features/search/application/services/search_service.dart';
import 'package:pop_reference/features/search/domain/repositories/search_repository.dart';

final getIt = GetIt.instance;

void inject() {
  getIt.registerLazySingleton<SearchRepository>(
    () => SearchIRepository(SearchService()),
  );
}
