import 'package:flutter/material.dart';
import 'package:pop_reference/core/utils/utils.dart';
import 'package:pop_reference/features/search/presentation/widgets/custom_checkbox.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
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
            value: false,
            onChanged: (value) {},
            label: 'Google Scholar',
          ),
          CustomCheckbox(
            value: false,
            onChanged: (value) {},
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
            value: true,
            onChanged: (value) {},
            label: 'Secure mode',
          ),
        ],
      ),
    );
  }
}
