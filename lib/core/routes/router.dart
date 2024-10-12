import 'package:go_router/go_router.dart';
import 'package:pop_reference/core/routes/def_router.dart';
import 'package:pop_reference/features/search/presentation/views/search_view.dart';

final router = GoRouter(
  initialLocation: DefRouter.search,
  routes: [
    GoRoute(
      path: DefRouter.search,
      builder: (context, state) => const SearchView(),
    ),
  ],
);
