import 'package:bored/constants.dart';
import 'package:flutter/material.dart';

class FilterButton extends StatelessWidget {
  const FilterButton({
    super.key,
    required this.hint,
    required this.onChanged,
    required this.items,
  });

  final String hint;
  final List<Map<String, String>> items;

  final ValueChanged<String?> onChanged;

  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
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
      items: items.map((Map<String, String> item) {
        return DropdownMenuItem<String>(
          alignment: Alignment.center,
          value: item[item.keys.first]!,
          child: Text(
            item.keys.first,
            style: activityTextStyle,
          ),
        );
      }).toList(),
    );
  }
}
