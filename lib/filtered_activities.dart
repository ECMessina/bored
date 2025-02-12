import 'package:bored/constants.dart';
import 'package:bored/models/filtered_activity_model.dart';

class FilteredActivities {
  static List<FilteredActivityModel> filteredActivities({
    String? type,
    int? participants,
  }) {
    final filteredList = _listOfFilteredActivities.where((activity) {
      final matchesType = type == null || activity.type == type.toLowerCase();
      final matchesParticipants =
          participants == null || activity.participants == participants;

      return matchesType && matchesParticipants;
    }).toList();

    if (filteredList.isEmpty) {
      throw CustomException('No activities match the selected filters.');
    }

    return filteredList;
  }

  static final _listOfFilteredActivities = [
    // Education
    FilteredActivityModel(
      activity: 'Online Course: Flutter Basics',
      availability: 0.2,
      type: 'education',
      participants: 1,
      price: 0.5,
      accessibility: 'High',
      duration: 'hours',
      kidFriendly: false,
      link: 'https://docs.flutter.dev/resources/courses',
      key: 'edu_001',
    ),
    FilteredActivityModel(
      activity: 'Learn the NATO phonetic alphabet',
      availability: 0.2,
      type: 'education',
      participants: 1,
      price: 0.0,
      accessibility: 'Easy',
      duration: 'hours',
      kidFriendly: true,
      link: 'https://en.wikipedia.org/wiki/NATO_phonetic_alphabet',
      key: 'edu_002',
    ),

    // Recreational
    FilteredActivityModel(
      activity: 'Go hiking',
      availability: 0.3,
      type: 'recreational',
      participants: 1,
      price: 0.1,
      accessibility: 'Medium',
      duration: 'hours',
      kidFriendly: true,
      link: '',
      key: 'rec_001',
    ),
    FilteredActivityModel(
      activity: 'Play a Beach Volleyball Game',
      availability: 0.7,
      type: 'recreational',
      participants: 6,
      price: 0.6,
      accessibility: 'Medium',
      duration: 'hours',
      kidFriendly: true,
      link: 'https://en.wikipedia.org/wiki/Beach_volleyball',
      key: 'rec_002',
    ),

    // Social
    FilteredActivityModel(
      activity: 'Game Night with Friends',
      availability: 0.5,
      type: 'social',
      participants: 4,
      price: 0.3,
      accessibility: 'Medium',
      duration: 'hours',
      kidFriendly: true,
      link: '',
      key: 'soc_001',
    ),
    FilteredActivityModel(
      activity: 'Outdoor Picnic',
      availability: 0.4,
      type: 'social',
      participants: 6,
      price: 0.2,
      accessibility: 'Easy',
      duration: 'hours',
      kidFriendly: true,
      link: '',
      key: 'soc_003',
    ),

    // Charity
    FilteredActivityModel(
      activity: 'Volunteer at a Food Bank',
      availability: 0.4,
      type: 'charity',
      participants: 3,
      price: 0.0,
      accessibility: 'Easy',
      duration: 'hours',
      kidFriendly: true,
      link: '',
      key: 'char_001',
    ),
    FilteredActivityModel(
      activity: 'Organize a Charity Run',
      availability: 0.6,
      type: 'charity',
      participants: 8,
      price: 0.3,
      accessibility: 'Medium',
      duration: 'hours',
      kidFriendly: false,
      link: '',
      key: 'char_002',
    ),

    // Cooking
    FilteredActivityModel(
      activity: 'Bake a Cake',
      availability: 0.1,
      type: 'cooking',
      participants: 2,
      price: 0.2,
      accessibility: 'Easy',
      duration: 'minutes',
      kidFriendly: true,
      link: 'https://www.google.com/search?q=cake+baking+tips',
      key: 'cook_001',
    ),
    FilteredActivityModel(
      activity: 'Group Cooking Class',
      availability: 0.5,
      type: 'cooking',
      participants: 6,
      price: 0.7,
      accessibility: 'Medium',
      duration: 'hours',
      kidFriendly: false,
      link: '',
      key: 'cook_002',
    ),

    // Relaxation
    FilteredActivityModel(
      activity: 'Yoga and Meditation',
      availability: 0.2,
      type: 'relaxation',
      participants: 1,
      price: 0.1,
      accessibility: 'Easy',
      duration: 'minutes',
      kidFriendly: true,
      link: '',
      key: 'relax_001',
    ),
    FilteredActivityModel(
      activity: 'Spa Day with Friends',
      availability: 0.4,
      type: 'relaxation',
      participants: 4,
      price: 0.9,
      accessibility: 'Medium',
      duration: 'hours',
      kidFriendly: false,
      link: '',
      key: 'relax_002',
    ),

    // Busywork
    FilteredActivityModel(
      activity: 'Declutter Your Room',
      availability: 0.0,
      type: 'busywork',
      participants: 1,
      price: 0.0,
      accessibility: 'Easy',
      duration: 'hours',
      kidFriendly: true,
      link: '',
      key: 'busy_001',
    ),
    FilteredActivityModel(
      activity: 'Help a Friend Organize Their Closet',
      availability: 0.1,
      type: 'busywork',
      participants: 2,
      price: 0.1,
      accessibility: 'Easy',
      duration: 'hours',
      kidFriendly: true,
      link: 'https://www.google.com/search?q=closet+organization+ideas',
      key: 'busy_002',
    ),

    // DIY
    FilteredActivityModel(
      activity: 'Build a Bookshelf',
      availability: 0.5,
      type: 'diy',
      participants: 1,
      price: 0.8,
      accessibility: 'Medium',
      duration: 'hours',
      kidFriendly: false,
      link: 'https://www.google.com/search?q=building+a+bookshelf',
      key: 'diy_001',
    ),
    FilteredActivityModel(
      activity: 'Make Handmade Greeting Cards',
      availability: 0.2,
      type: 'diy',
      participants: 3,
      price: 0.2,
      accessibility: 'Easy',
      duration: 'minutes',
      kidFriendly: true,
      link: '',
      key: 'diy_002',
    ),

    // Music
    FilteredActivityModel(
      activity: 'Learn a New Song on Guitar',
      availability: 0.4,
      type: 'music',
      participants: 1,
      price: 0.2,
      accessibility: 'Medium',
      duration: 'hours',
      kidFriendly: true,
      link: '',
      key: 'music_001',
    ),
    FilteredActivityModel(
      activity: 'Karaoke Night with Friends',
      availability: 0.3,
      type: 'music',
      participants: 5,
      price: 0.7,
      accessibility: 'Easy',
      duration: 'hours',
      kidFriendly: true,
      link: 'https://www.google.com/search?q=popular+songs+for+guitar',
      key: 'music_002',
    ),
  ];
}
