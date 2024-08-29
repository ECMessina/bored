import 'package:bored/buttons/to_do_button.dart';
import 'package:bored/loading_spinner.dart';
import 'package:bored/providers/filtered_activities_provider.dart';
import 'package:bored/providers/random_activity_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:bored/constants.dart';
import 'package:url_launcher/url_launcher.dart';

class DisplayScreen extends ConsumerStatefulWidget {
  const DisplayScreen({
    super.key,
    required this.userTappedRandom,
    this.selectedType,
    this.selectedParticipants,
  });

  final bool userTappedRandom;
  final String? selectedType;
  final String? selectedParticipants;

  @override
  ConsumerState<DisplayScreen> createState() => _DisplayScreenState();
}

class _DisplayScreenState extends ConsumerState<DisplayScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              Expanded(
                child: Consumer(
                  builder: (BuildContext context, WidgetRef ref, Widget? child) {
                    if (!widget.userTappedRandom) {
                      final filteredActivities = ref.watch(FilteredActivitiesProvider(
                        type: widget.selectedType,
                        participants: widget.selectedParticipants,
                      ));

                      return filteredActivities.when(
                        data: (data) {
                          return Text("$data");
                        },
                        error: (error, stackTrace) {
                          return Text('$error');
                        },
                        loading: () => const LoadingSpinner(),
                      );
                    } else {
                      final randomActivity = ref.watch(randomActivityProvider);

                      return randomActivity.when(
                        skipLoadingOnRefresh: false,
                        loading: () => const LoadingSpinner(),
                        data: (returnedActivity) => Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Spacer(),
                              Text(
                                '${returnedActivity.activity}!',
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
                                  children: [
                                    Text(
                                      activityType(returnedActivity.type),
                                      style: activityTextStyle,
                                      textAlign: TextAlign.center,
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    Text(
                                      returnedActivity.participants == 1 ? 'Only requires 1 person' : 'Requires ${returnedActivity.participants} people',
                                      style: activityTextStyle,
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    Text(
                                      returnedActivity.accessibility,
                                      style: activityTextStyle,
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    Text(
                                      'Can take a few ${returnedActivity.duration}',
                                      style: activityTextStyle,
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    Text(
                                      returnedActivity.kidFriendly == true ? 'Kid friendly!' : 'Not for kids!',
                                      style: activityTextStyle,
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    Text(
                                      availabilityForActivity(returnedActivity.availability),
                                      style: activityTextStyle,
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    Text(
                                      priceForActivity(returnedActivity.price),
                                      style: activityTextStyle,
                                    ),
                                  ],
                                ),
                              ),
                              const Spacer(),
                              if (returnedActivity.link.isNotEmpty) ...[
                                GestureDetector(
                                  onTap: () async {
                                    final uri = Uri.parse(returnedActivity.link);
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
                              ],
                              const Spacer(),
                              ToDoButton(
                                  label: "Find something else to do!",
                                  onPressed: () {
                                    ref.invalidate(randomActivityProvider);
                                  }),
                              const Spacer(),
                            ],
                          ),
                        ),
                        error: (err, stack) => AlertDialog(
                          backgroundColor: AppColors.backgroundButtonColor,
                          title: Text('Error: $err'),
                          titleTextStyle: mainTextStyle,
                          actions: [
                            Center(
                              child: TextButton.icon(
                                style: ButtonStyle(
                                  backgroundColor: const WidgetStatePropertyAll(
                                    AppColors.backgroundButtonColor,
                                  ),
                                  shadowColor: const WidgetStatePropertyAll(Colors.black),
                                  elevation: const WidgetStatePropertyAll(20.0),
                                  shape: WidgetStatePropertyAll(
                                    RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                  ),
                                ),
                                onPressed: () {
                                  ref.invalidate(randomActivityProvider);
                                },
                                icon: const Icon(Icons.refresh),
                                label: const Text(
                                  'Try Again',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      );
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  String activityType(String activity) {
    switch (activity) {
      case 'education':
        return 'This is educational';
      case 'recreational' || 'social':
        return 'This is a $activity activity';
      case 'charity':
        return 'This is a charitable activity';
      case 'cooking':
        return 'This activity will improve your cooking skills';
      case 'relaxation':
        return 'This will help you relax';
      case 'busywork':
        return 'This activity is for keeping busy';
      case 'diy':
        return 'This is a "Do It Yourself" crafting project';
      case 'music':
        return 'This activity will improve your musicality';
      default:
        return activity;
    }
  }

  String availabilityForActivity(double availability) {
    if (availability <= 0.2) {
      return 'Easy to access';
    } else if (availability > 0.2 && availability <= 0.5) {
      return 'Somewhat easy to access';
    } else if (availability > 0.5 && availability <= 0.8) {
      return 'Hard to come by';
    } else if (availability > 0.8 && availability <= 1.0) {
      return 'Very hard to come by';
    }
    return availability.toString();
  }

  String priceForActivity(double price) {
    if (price <= 0.2) {
      return 'Cheap!';
    } else if (price > 0.2 && price <= 0.5) {
      return 'Somewhat cheap';
    } else if (price > 0.5 && price <= 0.8) {
      return 'A little pricey';
    } else if (price > 0.8 && price <= 1.0) {
      return 'Expensive';
    }
    return price.toString();
  }
}
