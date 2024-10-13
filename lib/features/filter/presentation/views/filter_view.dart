import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pop_reference/core/utils/utils.dart';
import 'package:pop_reference/features/search/application/bloc/search_bloc.dart';
import 'package:pop_reference/features/filter/presentation/widgets/custom_checkbox.dart';

class FilterView extends StatelessWidget {
  const FilterView({
    super.key,
    required this.query,
    required this.page,
  });
  final String query;
  final int page;
  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      height: 100.h,
      duration: const Duration(milliseconds: 300),
      decoration: BoxDecoration(
        color: Palette.white,
        boxShadow: const [
          BoxShadow(
            color: Palette.grey,
            blurRadius: 10,
          ),
        ],
        borderRadius: BorderRadius.circular(10),
      ),
      padding: EdgeInsets.symmetric(horizontal: 1.w, vertical: 3.h),
      child: BlocBuilder<SearchBloc, SearchState>(
        builder: (context, state) {
          return SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Texts.bold(
                  'Source',
                  fontSize: 11,
                ),
                Container(
                  margin: EdgeInsets.symmetric(vertical: 1.h),
                  width: double.infinity,
                  height: 1,
                  color: Palette.grey,
                ),
                CustomCheckbox(
                  value: state.google ?? true,
                  onChanged: (value) {
                    context.read<SearchBloc>().add(SearchFilters(
                          google: value ?? false,
                        ));
                    context.read<SearchBloc>().add(SearchQuery(query, page));
                  },
                  label: 'Google Scholar',
                ),
                CustomCheckbox(
                  value: state.scielo ?? true,
                  onChanged: (value) {
                    context.read<SearchBloc>().add(SearchFilters(
                          scielo: value ?? false,
                        ));
                    context.read<SearchBloc>().add(SearchQuery(query, page));
                  },
                  label: 'Scielo',
                ).only(bottom: 2.h),
                const Texts.bold(
                  'Settings',
                  fontSize: 11,
                ),
                Container(
                  margin: EdgeInsets.symmetric(vertical: 1.h),
                  width: double.infinity,
                  height: 1,
                  color: Palette.grey,
                ),
                CustomCheckbox(
                  value: state.secureMode ?? true,
                  onChanged: (value) {
                    context.read<SearchBloc>().add(SearchFilters(
                          secureMode: value ?? false,
                        ));

                    context.read<SearchBloc>().add(SearchQuery(query, page));
                  },
                  label: 'Secure mode',
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
