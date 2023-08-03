// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

CalentreUser _$CalentreUserFromJson(Map<String, dynamic> json) {
  return _CalentreUser.fromJson(json);
}

/// @nodoc
mixin _$CalentreUser {
  String get userId => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get email => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CalentreUserCopyWith<CalentreUser> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CalentreUserCopyWith<$Res> {
  factory $CalentreUserCopyWith(
          CalentreUser value, $Res Function(CalentreUser) then) =
      _$CalentreUserCopyWithImpl<$Res, CalentreUser>;
  @useResult
  $Res call({String userId, String name, String email});
}

/// @nodoc
class _$CalentreUserCopyWithImpl<$Res, $Val extends CalentreUser>
    implements $CalentreUserCopyWith<$Res> {
  _$CalentreUserCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userId = null,
    Object? name = null,
    Object? email = null,
  }) {
    return _then(_value.copyWith(
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_CalentreUserCopyWith<$Res>
    implements $CalentreUserCopyWith<$Res> {
  factory _$$_CalentreUserCopyWith(
          _$_CalentreUser value, $Res Function(_$_CalentreUser) then) =
      __$$_CalentreUserCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String userId, String name, String email});
}

/// @nodoc
class __$$_CalentreUserCopyWithImpl<$Res>
    extends _$CalentreUserCopyWithImpl<$Res, _$_CalentreUser>
    implements _$$_CalentreUserCopyWith<$Res> {
  __$$_CalentreUserCopyWithImpl(
      _$_CalentreUser _value, $Res Function(_$_CalentreUser) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userId = null,
    Object? name = null,
    Object? email = null,
  }) {
    return _then(_$_CalentreUser(
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_CalentreUser with DiagnosticableTreeMixin implements _CalentreUser {
  const _$_CalentreUser(
      {required this.userId, required this.name, required this.email});

  factory _$_CalentreUser.fromJson(Map<String, dynamic> json) =>
      _$$_CalentreUserFromJson(json);

  @override
  final String userId;
  @override
  final String name;
  @override
  final String email;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'CalentreUser(userId: $userId, name: $name, email: $email)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'CalentreUser'))
      ..add(DiagnosticsProperty('userId', userId))
      ..add(DiagnosticsProperty('name', name))
      ..add(DiagnosticsProperty('email', email));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_CalentreUser &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.email, email) || other.email == email));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, userId, name, email);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_CalentreUserCopyWith<_$_CalentreUser> get copyWith =>
      __$$_CalentreUserCopyWithImpl<_$_CalentreUser>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_CalentreUserToJson(
      this,
    );
  }
}

abstract class _CalentreUser implements CalentreUser {
  const factory _CalentreUser(
      {required final String userId,
      required final String name,
      required final String email}) = _$_CalentreUser;

  factory _CalentreUser.fromJson(Map<String, dynamic> json) =
      _$_CalentreUser.fromJson;

  @override
  String get userId;
  @override
  String get name;
  @override
  String get email;
  @override
  @JsonKey(ignore: true)
  _$$_CalentreUserCopyWith<_$_CalentreUser> get copyWith =>
      throw _privateConstructorUsedError;
}
