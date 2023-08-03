// This file is "main.dart"
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'user_model.freezed.dart';
part 'user_model.g.dart';

//Build command
//flutter pub run build_runner build --delete-conflicting-outputs

@freezed
class CalentreUser with _$CalentreUser {
  const factory CalentreUser({
    required String userId,
    required String name,
    required String email,
  }) = _CalentreUser;

  factory CalentreUser.fromJson(Map<String, Object?> json) =>
      _$CalentreUserFromJson(json);
}
