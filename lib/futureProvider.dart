// ignore_for_file: public_member_api_docs, sort_constructors_first
// future Provider

import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;

//creating the future provider
final fetchUserProvider = FutureProvider((ref) {
  const url = 'https://jsonplaceholder.typicode.com/users/1';
  return http.get(Uri.parse(url)).then((value) => User.fromJson(value.body));
});

@immutable
class User {
  final String name;
  final String email;
  const User({
    required this.name,
    required this.email,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'email': email,
    };
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      name: map['name'] as String,
      email: map['email'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory User.fromJson(String source) =>
      User.fromMap(json.decode(source) as Map<String, dynamic>);

  User copyWith({
    String? name,
    String? email,
  }) {
    return User(
      name: name ?? this.name,
      email: email ?? this.email,
    );
  }
}
