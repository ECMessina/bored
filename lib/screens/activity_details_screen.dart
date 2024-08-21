import 'package:bored/constants.dart';
import 'package:bored/buttons/filter_button.dart';
import 'package:bored/buttons/to_do_button.dart';
import 'package:flutter/material.dart';

class ActivityDetailsScreen extends StatelessWidget {
  ActivityDetailsScreen({super.key});

  final List<Map<String, String>> types = [
    {
      "Running": "Running",
      "Jogging": "Jogging"
    }
  ];

  final List<Map<String, String>> participants = [
    {
      "One": "1",
      "Two": "2"
    }
  ];

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          const Spacer(),
          ToDoButton(
            icon: Icons.shuffle,
            label: 'Random!',
            onPressed: () {},
          ),
          const Spacer(),
          Text(
            'Filter:',
            style: activityTextStyle,
            textAlign: TextAlign.center,
          ),
          Container(
            padding: const EdgeInsets.all(10.0),
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.purple.shade600,
                width: 2,
              ),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              children: [
                const SizedBox(
                  height: 10,
                ),
                FilterButton(
                  hint: 'Types',
                  onChanged: (Object? value) {},
                  items: types,
                ),
                const SizedBox(
                  height: 20,
                ),
                FilterButton(
                  hint: 'Participants',
                  onChanged: (Object? value) {},
                  items: participants,
                ),
                const SizedBox(
                  height: 20,
                ),
                ToDoButton(
                  icon: Icons.view_list_outlined,
                  label: 'Get activities!',
                  onPressed: () {},
                ),
                const SizedBox(
                  height: 10,
                ),
              ],
            ),
          ),
          const Spacer(),
        ],
      ),
    );
  }
}
