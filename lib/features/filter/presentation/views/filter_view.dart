import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pop_reference/core/utils/utils.dart';
import 'package:pop_reference/features/filter/application/bloc/filter_bloc.dart';
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
      child: BlocBuilder<FilterBloc, FilterState>(
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
                  value: state.filter.google,
                  onChanged: (value) {
                    context.read<FilterBloc>().add(FilterFiltersEvent(
                          google: value ?? false,
                          query: query,
                          page: page,
                        ));
                  },
                  label: 'Google Scholar',
                ),
                CustomCheckbox(
                  value: state.filter.scielo,
                  onChanged: (value) {
                    context.read<FilterBloc>().add(FilterFiltersEvent(
                          scielo: value ?? false,
                          query: query,
                          page: page,
                        ));
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
                  value: state.filter.secureMode,
                  onChanged: (value) {
                    context.read<FilterBloc>().add(FilterFiltersEvent(
                          secureMode: value ?? false,
                          query: query,
                          page: page,
                        ));
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
