import 'package:bored/constants.dart';
import 'package:bored/buttons/filter_button.dart';
import 'package:bored/buttons/to_do_button.dart';
import 'package:bored/screens/display_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ActivityRequestScreen extends ConsumerStatefulWidget {
  const ActivityRequestScreen({super.key});

  @override
  ConsumerState<ActivityRequestScreen> createState() =>
      _ActivityDetailsScreenState();
}

class _ActivityDetailsScreenState extends ConsumerState<ActivityRequestScreen> {
  String? selectedType;
  String? selectedParticipants;

  final Map<String, String> types = {
    "education": "education",
    "recreational": "recreational",
    "social": "social",
    "charity": "charity",
    "cooking": "cooking",
    "relaxation": "relaxation",
    "busywork": "busywork",
    "diy": "diy",
    "music": "music",
  };

  final Map<String, String> participants = {
    "One": "1",
    "Two": "2",
    "Three": "3",
    "Four": "4",
    "Five": "5",
    "Six": "6",
    "Eight": "8",
  };

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          const Spacer(),
          Text(
            'Bored? Do something!',
            style: AppTextStyles.mainTextStyleWithColor,
          ),
          const Spacer(),
          ToDoButton(
            icon: Icons.shuffle,
            label: 'Random!',
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const DisplayScreen(
                    userTappedRandom: true,
                  ),
                ),
              );
            },
          ),
          const Spacer(),
          Text(
            'Filter:',
            style: AppTextStyles.mainTextStyleWithColor,
            textAlign: TextAlign.center,
          ),
          Container(
            padding: const EdgeInsets.all(10.0),
            decoration: BoxDecoration(
              color: AppColors.backgroundFilterColor,
              border: Border.all(
                color: AppColors.standardDarkColor,
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
                  value: selectedType,
                  onChanged: (value) {
                    setState(() {
                      selectedType = value;
                    });
                  },
                  items: types,
                ),
                const SizedBox(
                  height: 20,
                ),
                FilterButton(
                  hint: 'Participants',
                  value: selectedParticipants,
                  onChanged: (value) {
                    setState(() {
                      selectedParticipants = value;
                    });
                  },
                  items: participants,
                ),
                const SizedBox(
                  height: 20,
                ),
                ToDoButton(
                  icon: Icons.view_list_outlined,
                  label: 'Get activities!',
                  onPressed: () {
                    if (selectedType == null && selectedParticipants == null) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text(
                            'No filters selected',
                            textAlign: TextAlign.center,
                          ),
                        ),
                      );
                      return;
                    }

                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DisplayScreen(
                          userTappedRandom: false,
                          selectedType: selectedType,
                          selectedParticipants: selectedParticipants,
                        ),
                      ),
                    );
                  },
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
