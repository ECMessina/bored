import 'package:bored/constants.dart';
import 'package:flutter/material.dart';

class FilterButton extends StatelessWidget {
  const FilterButton({
    super.key,
    required this.hint,
    required this.onChanged,
    required this.items,
    this.value,
  });

  final String hint;
  final Map<String, String> items;
  final String? value;
  final ValueChanged<String?> onChanged;

  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      value: value,
      borderRadius: BorderRadius.circular(10),
      iconSize: 48,
      iconEnabledColor: AppColors.standardDarkColor,
      dropdownColor: AppColors.backgroundButtonColor,
      onChanged: onChanged,
      hint: Text(
        hint,
        style: AppTextStyles.activityTextStyle,
      ),
      underline: Container(
        height: 2,
        color: AppColors.standardDarkColor,
      ),
      items: [
        if (value != null)
          const DropdownMenuItem<String>(
            alignment: Alignment.center,
            value: null,
            child: Text('Clear Selection'),
          ),
        ...items.entries.map((entry) {
          return DropdownMenuItem<String>(
            alignment: Alignment.center,
            value: entry.value[0].toUpperCase() +
                entry.value.substring(1).toLowerCase(),
            child: Text(
              entry.value[0].toUpperCase() +
                  entry.value.substring(1).toLowerCase(),
              style: AppTextStyles.activityTextStyle,
            ),
          );
        }),
      ],
    );
  }
}
