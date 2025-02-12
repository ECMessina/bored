import 'package:bored/data_details.dart';
import 'package:bored/error_alert.dart';
import 'package:bored/loading_spinner.dart';
import 'package:bored/providers/filtered_activities_provider.dart';
import 'package:bored/providers/random_activity_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:bored/constants.dart';

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
  final PageController _pageController = PageController(viewportFraction: 0.8);

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  Widget getUserTappedFiltered() {
    final filteredActivities = ref.watch(
      FilteredActivitiesProvider(
        type: widget.selectedType,
        participants: widget.selectedParticipants,
      ),
    );

    return filteredActivities.when(
      loading: () => const LoadingSpinner(),
      error: (error, stackTrace) => ErrorAlert(
        error: error,
        onPressed: () {
          Navigator.pop(context);
        },
      ),
      data: (filteredActivities) => Stack(
        children: [
          PageView.builder(
            controller: _pageController,
            itemCount: filteredActivities.length,
            itemBuilder: (BuildContext context, int index) {
              final activity = filteredActivities[index];
              return AnimatedBuilder(
                animation: _pageController,
                builder: (context, child) {
                  double value = 1.0;
                  if (_pageController.position.haveDimensions) {
                    value = _pageController.page! - index;
                    value = (1 - (value.abs() * 0.3)).clamp(0.0, 1.0);
                  }
                  return Center(
                    child: SizedBox(
                      height: Curves.easeOut.transform(value) *
                              MediaQuery.sizeOf(context).height -
                          40,
                      width: Curves.easeOut.transform(value) *
                              MediaQuery.sizeOf(context).width -
                          50,
                      child: child,
                    ),
                  );
                },
                child: Card(
                  color: AppColors.backgroundCardColor,
                  margin: const EdgeInsets.all(15),
                  elevation: 5,
                  child: DataDetails(
                    filteredActivityModel: activity,
                    label: "Re-do",
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }

  Widget getUserTappedRandom() {
    final randomActivity = ref.watch(randomActivityProvider);

    return randomActivity.when(
      skipLoadingOnRefresh: false,
      loading: () => const LoadingSpinner(),
      error: (error, stack) => ErrorAlert(
        error: error,
        onPressed: () {
          ref.invalidate(randomActivityProvider);
        },
      ),
      data: (returnedActivity) => DataDetails(
        activityModel: returnedActivity,
        label: "Find something else to do!",
        onPressed: () {
          ref.invalidate(randomActivityProvider);
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: SafeArea(
        child: Center(
          child: (widget.userTappedRandom)
              ? getUserTappedRandom()
              : getUserTappedFiltered(),
        ),
      ),
    );
  }
}
