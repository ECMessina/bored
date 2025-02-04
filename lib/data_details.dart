import 'package:bored/buttons/to_do_button.dart';
import 'package:bored/constants.dart';
import 'package:bored/models/activity_model.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class DataDetails extends StatelessWidget {
  const DataDetails({
    super.key,
    required this.activityModel,
    required this.label,
    required this.onPressed,
  });

  final ActivityModel activityModel;
  final String label;
  final Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Spacer(),
          Text(
            '${activityModel.activity}!',
            style: boldActivityTextStyle,
            textAlign: TextAlign.center,
          ),
          const Spacer(),
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
              mainAxisAlignment: MainAxisAlignment.center,
              spacing: 10,
              children: [
                Text(
                  activityModel.getActivityTypeText(),
                  style: activityTextStyle,
                  textAlign: TextAlign.center,
                ),
                Text(
                  activityModel.participants == 1 ? 'Only requires 1 person' : 'Requires ${activityModel.participants} people',
                  style: activityTextStyle,
                ),
                Text(
                  activityModel.accessibility,
                  style: activityTextStyle,
                ),
                Text(
                  'Can take a few ${activityModel.duration}',
                  style: activityTextStyle,
                ),
                Text(
                  activityModel.kidFriendly == true ? 'Kid friendly!' : 'Not for kids!',
                  style: activityTextStyle,
                ),
                Text(
                  activityModel.getAvailabilityForActivity(),
                  style: activityTextStyle,
                  textAlign: TextAlign.center,
                ),
                ),
                Text(
                  activityModel.getPriceForActivity(),
                  style: activityTextStyle,
                ),
              ],
            ),
          ),
          const Spacer(),
          if (activityModel.link.isNotEmpty)
            GestureDetector(
              onTap: () async {
                final uri = Uri.parse(activityModel.link);
                if (!await launchUrl(uri)) {
                  if (context.mounted) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(
                          'Unable to launch \n$uri',
                          textAlign: TextAlign.center,
                        ),
                      ),
                    );
                  }
                }
              },
              child: Text(
                'Learn More!',
                style: linkTextStyle,
                textAlign: TextAlign.center,
              ),
            ),
          const Spacer(),
          ToDoButton(
            icon: Icons.redo,
            label: label,
            onPressed: onPressed,
          ),
          const Spacer(),
        ],
      ),
    );
  }
}
