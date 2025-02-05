import 'package:bored/buttons/to_do_button.dart';
import 'package:bored/constants.dart';
import 'package:bored/models/activity_model.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:validators/validators.dart';

class DataDetails extends StatefulWidget {
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
  State<DataDetails> createState() => _DataDetailsState();
}

class _DataDetailsState extends State<DataDetails>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animation;

  @override
  void initState() {
    _animationController = AnimationController(
      duration: Duration(seconds: 2),
      vsync: this,
    )..repeat();
    _animation =
        Tween<double>(begin: 0.0, end: 2.0).animate(_animationController);
    super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Spacer(),
          Text(
            '${widget.activityModel.activity}!',
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
                  widget.activityModel.getActivityTypeText(),
                  style: activityTextStyle,
                  textAlign: TextAlign.center,
                ),
                Text(
                  widget.activityModel.participants == 1
                      ? 'Only requires 1 person'
                      : 'Requires ${widget.activityModel.participants} people',
                  style: activityTextStyle,
                ),
                Text(
                  widget.activityModel.accessibility.toString(),
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
                  widget.activityModel.getPriceForActivity(),
                  style: activityTextStyle,
                ),
              ],
            ),
          ),
          const Spacer(),
          if (isURL(widget.activityModel.link))
            GestureDetector(
              onTap: () async {
                final uri = Uri.parse(widget.activityModel.link);
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
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  AnimatedBuilder(
                    animation: _animationController,
                    builder: (context, child) {
                      return AnimatedRotation(
                        turns: 0.25 - (_animation.value * 0.25),
                        duration: Duration(seconds: 2),
                        child: Icon(
                          Icons.arrow_forward,
                          color: Colors.purple.shade600,
                        ),
                      );
                    },
                  ),
                  Text(
                'Learn More!',
                style: linkTextStyle,
                textAlign: TextAlign.center,
              ),
                  AnimatedBuilder(
                    animation: _animationController,
                    builder: (context, child) {
                      return AnimatedRotation(
                        turns: -0.25 - (_animation.value * 0.25),
                        duration: Duration(seconds: 2),
                        child: Icon(
                          Icons.arrow_forward,
                          color: Colors.purple.shade600,
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          const Spacer(),
          ToDoButton(
            icon: Icons.redo,
            label: widget.label,
            onPressed: widget.onPressed,
          ),
          const Spacer(),
        ],
      ),
    );
  }
}
