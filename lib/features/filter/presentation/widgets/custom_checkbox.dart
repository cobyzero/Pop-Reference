import 'package:flutter/material.dart';
import 'package:pop_reference/core/utils/texts.dart';
import 'package:pop_reference/core/utils/utils.dart';

class CustomCheckbox extends StatelessWidget {
  const CustomCheckbox({
    super.key,
    required this.value,
    required this.onChanged,
    required this.label,
  });

  final bool value;
  final Function(bool?) onChanged;
  final String label;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Checkbox(
          value: value,
          onChanged: onChanged,
        ),
        Expanded(
          child: Texts.regular(
            label,
            fontSize: 11,
            color: Palette.darkBlack,
          ),
        ),
      ],
    );
  }
}
