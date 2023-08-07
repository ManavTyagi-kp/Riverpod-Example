import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// Provider
// final myProvider = Provider<String>((ref) => 'Manav Tyagi');

// Name Provider
// final nameProvider = StateProvider<String?>((ref) => null);

// StateNotifierProvider
final userProvider = StateNotifierProvider<UserNotifier, User>(
  (ref) => UserNotifier(
    User(
      name: '',
      age: 0,
    ),
  ),
);

@immutable
class User {
  final String name;
  final int age;
  User({
    required this.name,
    required this.age,
  });
}

class UserNotifier extends StateNotifier<User> {
  UserNotifier(super.state);

  void updateCreds(String n, int age) {
    state = User(name: n, age: age);
  }

  void updateName(String n) {
    state = User(name: n, age: state.age);
  }

  void updateAge(int age) {
    state = User(name: state.name, age: age);
  }
}
