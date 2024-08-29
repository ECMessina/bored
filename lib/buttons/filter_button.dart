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
      iconEnabledColor: Colors.purple.shade600,
      dropdownColor: AppColors.backgroundButtonColor,
      onChanged: onChanged,
      hint: Text(
        hint,
        style: activityTextStyle,
      ),
      underline: Container(
        height: 2,
        color: Colors.purple.shade600,
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
            value: entry.value,
            child: Text(
              entry.value,
              style: activityTextStyle,
            ),
          );
        }),
      ],
    );
  }
}
