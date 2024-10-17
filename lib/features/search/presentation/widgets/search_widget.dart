import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconly/iconly.dart';
import 'package:pop_reference/core/utils/utils.dart';
import 'package:pop_reference/features/filter/application/bloc/filter_bloc.dart';
import 'package:pop_reference/features/search/application/bloc/search_bloc.dart';

class SearchWidget extends StatefulWidget {
  const SearchWidget({super.key, required this.controller});
  final TextEditingController controller;

  @override
  State<SearchWidget> createState() => _SearchWidgetState();
}

class _SearchWidgetState extends State<SearchWidget> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: TextFormField(
        controller: widget.controller,
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Search cannot be empty';
          }
          return null;
        },
        style: const TextStyle(
          color: Palette.black,
        ),
        decoration: InputDecoration(
          filled: true,
          fillColor: Palette.white,
          hintText: 'Search for reference',
          contentPadding: EdgeInsets.symmetric(horizontal: 1.w),
          suffixIcon: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Palette.blue,
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.horizontal(
                  right: Radius.circular(24),
                ),
              ),
            ),
            onPressed: () {
              if (_formKey.currentState!.validate()) {
                context.read<SearchBloc>().add(
                      SearchQuery(
                        widget.controller.text,
                        1,
                        context.read<FilterBloc>().state.filter,
                      ),
                    );
              }
            },
            child: Icon(
              IconlyBold.search,
              color: Palette.white,
              size: 13.sp,
            ),
          ).only(right: .2.w),
          hintStyle: TextStyle(
            color: Palette.black.withOpacity(.3),
            fontSize: 10.sp,
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(24),
            borderSide: BorderSide(color: Palette.grey.withOpacity(.3)),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(24),
            borderSide: BorderSide(color: Palette.grey.withOpacity(.3)),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(24),
            borderSide: BorderSide(color: Palette.grey.withOpacity(.3)),
          ),
        ),
      ),
    );
  }
}
