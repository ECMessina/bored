import 'package:bored/buttons/to_do_button.dart';
import 'package:bored/constants.dart';
import 'package:bored/models/activity_model.dart';
import 'package:bored/models/filtered_activity_model.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:validators/validators.dart';

class DataDetails extends StatefulWidget {
  const DataDetails({
    super.key,
    this.activityModel,
    this.filteredActivityModel,
    required this.label,
    required this.onPressed,
  });

  final ActivityModel? activityModel;
  final FilteredActivityModel? filteredActivityModel;
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
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(
            '${widget.activityModel != null ? widget.activityModel!.activity : widget.filteredActivityModel!.activity}!',
            style: AppTextStyles.boldActivityTextStyle,
            textAlign: TextAlign.center,
          ),
          Flexible(
            child: Container(
              padding: const EdgeInsets.all(10.0),
              decoration: BoxDecoration(
                border: Border.all(
                  color: AppColors.standardDarkColor,
                  width: 2,
                ),
                borderRadius: BorderRadius.circular(10),
              ),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  spacing: 10,
                  children: [
                    Text(
                      widget.activityModel != null
                          ? widget.activityModel!.getActivityTypeText()
                          : widget.filteredActivityModel!.getActivityTypeText(),
                      style: AppTextStyles.activityTextStyle,
                      textAlign: TextAlign.center,
                    ),
                    Text(
                      widget.activityModel != null
                          ? widget.activityModel!.participants == 1
                              ? 'Only requires 1 person'
                              : 'Requires ${widget.activityModel!.participants} people'
                          : widget.filteredActivityModel!.participants == 1
                              ? 'Only requires 1 person'
                              : 'Requires ${widget.filteredActivityModel!.participants} people',
                      style: AppTextStyles.activityTextStyle,
                    ),
                    Text(
                      widget.activityModel != null
                          ? widget.activityModel!.getAccessibility()
                          : widget.filteredActivityModel!.getAccessibility(),
                      style: AppTextStyles.activityTextStyle,
                      textAlign: TextAlign.center,
                    ),
                    if (widget.filteredActivityModel != null) ...[
                      Text(
                        'Can take a few ${widget.filteredActivityModel!.duration}',
                        style: AppTextStyles.activityTextStyle,
                        textAlign: TextAlign.center,
                      ),
                      Text(
                        widget.filteredActivityModel!.kidFriendly == true
                            ? 'Kid friendly!'
                            : 'Not for kids!',
                        style: AppTextStyles.activityTextStyle,
                      ),
                      Text(
                        widget.filteredActivityModel!
                            .getAvailabilityForActivity(),
                        style: AppTextStyles.activityTextStyle,
                        textAlign: TextAlign.center,
                      ),
                    ],
                    Text(
                      widget.activityModel != null
                          ? widget.activityModel!.getPriceForActivity()
                          : widget.filteredActivityModel!.getPriceForActivity(),
                      style: AppTextStyles.activityTextStyle,
                    ),
                  ],
                ),
              ),
            ),
          ),
          if (isURL(widget.activityModel != null
              ? widget.activityModel!.link
              : widget.filteredActivityModel!.link)) ...[
            GestureDetector(
              onTap: () async {
                final uri = Uri.parse(widget.activityModel != null
                    ? widget.activityModel!.link
                    : widget.filteredActivityModel!.link);
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
                          color: AppColors.standardDarkColor,
                        ),
                      );
                    },
                  ),
                  Text(
                    'Learn More!',
                    style: AppTextStyles.linkTextStyle,
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
                          color: AppColors.standardDarkColor,
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ],
          ToDoButton(
            icon: Icons.redo,
            label: widget.label,
            onPressed: widget.onPressed,
          ),
        ],
      ),
    );
  }
}
