import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconly/iconly.dart';
import 'package:pop_reference/core/utils/utils.dart';
import 'package:pop_reference/features/search/application/bloc/search_bloc.dart';

class SearchWidget extends StatefulWidget {
  const SearchWidget({super.key});

  @override
  State<SearchWidget> createState() => _SearchWidgetState();
}

class _SearchWidgetState extends State<SearchWidget> {
  final TextEditingController _controller = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: TextFormField(
        controller: _controller,
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Search cannot be empty';
          }
          return null;
        },
        style: const TextStyle(
          color: Palette.white,
        ),
        decoration: InputDecoration(
          hintText: 'Search',
          suffixIcon: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Palette.primary,
            ),
            onPressed: () {
              if (_formKey.currentState!.validate()) {
                context.read<SearchBloc>().add(
                      SearchQuery(_controller.text),
                    );
              }
            },
            child: const Texts.regular(
              'Search',
              color: Palette.black,
              fontSize: 10,
            ).symmetric(horizontal: 1.w),
          ).only(right: .2.w),
          prefixIcon: const Icon(
            IconlyLight.search,
            color: Palette.white,
          ).only(left: 1.w, right: 1.w),
          hintStyle: TextStyle(
            color: Palette.white.withOpacity(.8),
            fontSize: 10.sp,
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(50),
            borderSide: BorderSide(color: Palette.grey.withOpacity(.3)),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(50),
            borderSide: BorderSide(color: Palette.grey.withOpacity(.3)),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(50),
            borderSide: const BorderSide(color: Palette.grey),
          ),
        ),
      ),
    );
  }
}
