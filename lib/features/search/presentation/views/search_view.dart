import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pop_reference/core/utils/utils.dart';
import 'package:pop_reference/features/search/application/bloc/search_bloc.dart';
import 'package:pop_reference/features/filter/presentation/views/filter_view.dart';
import 'package:pop_reference/features/search/presentation/widgets/reference_item.dart';
import 'package:pop_reference/features/search/presentation/widgets/search_widget.dart';

class SearchView extends StatefulWidget {
  const SearchView({super.key});

  @override
  State<SearchView> createState() => _SearchViewState();
}

class _SearchViewState extends State<SearchView> {
  final _controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Palette.greyScale,
      body: BlocBuilder<SearchBloc, SearchState>(
        builder: (context, state) {
          return Row(
            children: [
              Expanded(
                child: FilterView(
                  query: _controller.text,
                  page: 1,
                ),
              ),
              Expanded(
                flex: 5,
                child: Column(
                  children: [
                    AnimatedContainer(
                      margin: EdgeInsets.symmetric(vertical: 2.h),
                      width: double.infinity,
                      height: state is SearchLoading || state is SearchSuccess
                          ? 7.h
                          : 80.h,
                      duration: const Duration(milliseconds: 500),
                      child: SearchWidget(controller: _controller),
                    ),
                    if (state is SearchSuccess)
                      Expanded(
                        flex: 5,
                        child: state.searchEntity.results.isEmpty
                            ? const Center(
                                child: Text('No results found'),
                              )
                            : ListView.separated(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 2.w, vertical: 2.h),
                                separatorBuilder: (context, index) {
                                  return SizedBox(
                                    height: 2.h,
                                  );
                                },
                                itemCount: state.searchEntity.results.length,
                                itemBuilder: (context, index) {
                                  return ReferenceItem(
                                    reference:
                                        state.searchEntity.results[index],
                                  );
                                },
                              ),
                      ),
                    if (state is SearchLoading)
                      const Expanded(
                        child: Center(
                          child: CircularProgressIndicator(),
                        ),
                      ),
                  ],
                ).symmetric(horizontal: 2.w),
              ),
            ],
          );
        },
      ),
    );
  }
}
