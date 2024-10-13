import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pop_reference/core/dependencies/injector.dart';
import 'package:pop_reference/core/routes/router.dart';
import 'package:pop_reference/features/filter/application/bloc/filter_bloc.dart';
import 'package:pop_reference/features/search/application/bloc/search_bloc.dart';
import 'package:pop_reference/features/search/domain/repositories/search_repository.dart';
import 'package:sizer/sizer.dart';

Future<void> main() async {
  inject();
  runApp(const MyBlocs());
}

class MyBlocs extends StatelessWidget {
  const MyBlocs({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => SearchBloc(
            getIt<SearchRepository>(),
          ),
          lazy: false,
        ),
        BlocProvider(
          create: (context) => FilterBloc(
            context.read<SearchBloc>(),
          ),
          lazy: false,
        ),
      ],
      child: const MyApp(),
    );
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (p0, p1, p2) {
        return MaterialApp.router(
          routerConfig: router,
          theme: ThemeData(
            textTheme: GoogleFonts.robotoTextTheme(),
          ),
          title: 'Material App',
        );
      },
    );
  }
}
