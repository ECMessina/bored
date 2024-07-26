import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'random_activity_provider.g.dart';

@riverpod
Future<String> randomActivity(RandomActivityRef ref) async {
  await Future.delayed(const Duration(seconds: 3));
  // throw Exception();
  return 'Got the data!';
}
