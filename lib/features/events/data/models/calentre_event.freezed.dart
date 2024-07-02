// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'calentre_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

CalentreEvent _$CalentreEventFromJson(Map<String, dynamic> json) {
  return _CalentreEvent.fromJson(json);
}

/// @nodoc
mixin _$CalentreEvent {
  String get eventName => throw _privateConstructorUsedError;
  String get eventDescription => throw _privateConstructorUsedError;
  String get platformType => throw _privateConstructorUsedError;
  String get duration => throw _privateConstructorUsedError;
  String get eventLink => throw _privateConstructorUsedError;
  String get eventType => throw _privateConstructorUsedError;
  num? get amount => throw _privateConstructorUsedError;
  bool? get isMultiple =>
      throw _privateConstructorUsedError; //not supporting this feature at the moment
  AvailabilityModel get availability => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CalentreEventCopyWith<CalentreEvent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CalentreEventCopyWith<$Res> {
  factory $CalentreEventCopyWith(
          CalentreEvent value, $Res Function(CalentreEvent) then) =
      _$CalentreEventCopyWithImpl<$Res, CalentreEvent>;
  @useResult
  $Res call(
      {String eventName,
      String eventDescription,
      String platformType,
      String duration,
      String eventLink,
      String eventType,
      num? amount,
      bool? isMultiple,
      AvailabilityModel availability});

  $AvailabilityModelCopyWith<$Res> get availability;
}

/// @nodoc
class _$CalentreEventCopyWithImpl<$Res, $Val extends CalentreEvent>
    implements $CalentreEventCopyWith<$Res> {
  _$CalentreEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? eventName = null,
    Object? eventDescription = null,
    Object? platformType = null,
    Object? duration = null,
    Object? eventLink = null,
    Object? eventType = null,
    Object? amount = freezed,
    Object? isMultiple = freezed,
    Object? availability = null,
  }) {
    return _then(_value.copyWith(
      eventName: null == eventName
          ? _value.eventName
          : eventName // ignore: cast_nullable_to_non_nullable
              as String,
      eventDescription: null == eventDescription
          ? _value.eventDescription
          : eventDescription // ignore: cast_nullable_to_non_nullable
              as String,
      platformType: null == platformType
          ? _value.platformType
          : platformType // ignore: cast_nullable_to_non_nullable
              as String,
      duration: null == duration
          ? _value.duration
          : duration // ignore: cast_nullable_to_non_nullable
              as String,
      eventLink: null == eventLink
          ? _value.eventLink
          : eventLink // ignore: cast_nullable_to_non_nullable
              as String,
      eventType: null == eventType
          ? _value.eventType
          : eventType // ignore: cast_nullable_to_non_nullable
              as String,
      amount: freezed == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as num?,
      isMultiple: freezed == isMultiple
          ? _value.isMultiple
          : isMultiple // ignore: cast_nullable_to_non_nullable
              as bool?,
      availability: null == availability
          ? _value.availability
          : availability // ignore: cast_nullable_to_non_nullable
              as AvailabilityModel,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $AvailabilityModelCopyWith<$Res> get availability {
    return $AvailabilityModelCopyWith<$Res>(_value.availability, (value) {
      return _then(_value.copyWith(availability: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_CalentreEventCopyWith<$Res>
    implements $CalentreEventCopyWith<$Res> {
  factory _$$_CalentreEventCopyWith(
          _$_CalentreEvent value, $Res Function(_$_CalentreEvent) then) =
      __$$_CalentreEventCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String eventName,
      String eventDescription,
      String platformType,
      String duration,
      String eventLink,
      String eventType,
      num? amount,
      bool? isMultiple,
      AvailabilityModel availability});

  @override
  $AvailabilityModelCopyWith<$Res> get availability;
}

/// @nodoc
class __$$_CalentreEventCopyWithImpl<$Res>
    extends _$CalentreEventCopyWithImpl<$Res, _$_CalentreEvent>
    implements _$$_CalentreEventCopyWith<$Res> {
  __$$_CalentreEventCopyWithImpl(
      _$_CalentreEvent _value, $Res Function(_$_CalentreEvent) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? eventName = null,
    Object? eventDescription = null,
    Object? platformType = null,
    Object? duration = null,
    Object? eventLink = null,
    Object? eventType = null,
    Object? amount = freezed,
    Object? isMultiple = freezed,
    Object? availability = null,
  }) {
    return _then(_$_CalentreEvent(
      eventName: null == eventName
          ? _value.eventName
          : eventName // ignore: cast_nullable_to_non_nullable
              as String,
      eventDescription: null == eventDescription
          ? _value.eventDescription
          : eventDescription // ignore: cast_nullable_to_non_nullable
              as String,
      platformType: null == platformType
          ? _value.platformType
          : platformType // ignore: cast_nullable_to_non_nullable
              as String,
      duration: null == duration
          ? _value.duration
          : duration // ignore: cast_nullable_to_non_nullable
              as String,
      eventLink: null == eventLink
          ? _value.eventLink
          : eventLink // ignore: cast_nullable_to_non_nullable
              as String,
      eventType: null == eventType
          ? _value.eventType
          : eventType // ignore: cast_nullable_to_non_nullable
              as String,
      amount: freezed == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as num?,
      isMultiple: freezed == isMultiple
          ? _value.isMultiple
          : isMultiple // ignore: cast_nullable_to_non_nullable
              as bool?,
      availability: null == availability
          ? _value.availability
          : availability // ignore: cast_nullable_to_non_nullable
              as AvailabilityModel,
    ));
  }
}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
class _$_CalentreEvent with DiagnosticableTreeMixin implements _CalentreEvent {
  const _$_CalentreEvent(
      {required this.eventName,
      required this.eventDescription,
      required this.platformType,
      required this.duration,
      required this.eventLink,
      required this.eventType,
      this.amount,
      this.isMultiple,
      required this.availability});

  factory _$_CalentreEvent.fromJson(Map<String, dynamic> json) =>
      _$$_CalentreEventFromJson(json);

  @override
  final String eventName;
  @override
  final String eventDescription;
  @override
  final String platformType;
  @override
  final String duration;
  @override
  final String eventLink;
  @override
  final String eventType;
  @override
  final num? amount;
  @override
  final bool? isMultiple;
//not supporting this feature at the moment
  @override
  final AvailabilityModel availability;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'CalentreEvent(eventName: $eventName, eventDescription: $eventDescription, platformType: $platformType, duration: $duration, eventLink: $eventLink, eventType: $eventType, amount: $amount, isMultiple: $isMultiple, availability: $availability)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'CalentreEvent'))
      ..add(DiagnosticsProperty('eventName', eventName))
      ..add(DiagnosticsProperty('eventDescription', eventDescription))
      ..add(DiagnosticsProperty('platformType', platformType))
      ..add(DiagnosticsProperty('duration', duration))
      ..add(DiagnosticsProperty('eventLink', eventLink))
      ..add(DiagnosticsProperty('eventType', eventType))
      ..add(DiagnosticsProperty('amount', amount))
      ..add(DiagnosticsProperty('isMultiple', isMultiple))
      ..add(DiagnosticsProperty('availability', availability));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_CalentreEvent &&
            (identical(other.eventName, eventName) ||
                other.eventName == eventName) &&
            (identical(other.eventDescription, eventDescription) ||
                other.eventDescription == eventDescription) &&
            (identical(other.platformType, platformType) ||
                other.platformType == platformType) &&
            (identical(other.duration, duration) ||
                other.duration == duration) &&
            (identical(other.eventLink, eventLink) ||
                other.eventLink == eventLink) &&
            (identical(other.eventType, eventType) ||
                other.eventType == eventType) &&
            (identical(other.amount, amount) || other.amount == amount) &&
            (identical(other.isMultiple, isMultiple) ||
                other.isMultiple == isMultiple) &&
            (identical(other.availability, availability) ||
                other.availability == availability));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      eventName,
      eventDescription,
      platformType,
      duration,
      eventLink,
      eventType,
      amount,
      isMultiple,
      availability);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_CalentreEventCopyWith<_$_CalentreEvent> get copyWith =>
      __$$_CalentreEventCopyWithImpl<_$_CalentreEvent>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_CalentreEventToJson(
      this,
    );
  }
}

abstract class _CalentreEvent implements CalentreEvent {
  const factory _CalentreEvent(
      {required final String eventName,
      required final String eventDescription,
      required final String platformType,
      required final String duration,
      required final String eventLink,
      required final String eventType,
      final num? amount,
      final bool? isMultiple,
      required final AvailabilityModel availability}) = _$_CalentreEvent;

  factory _CalentreEvent.fromJson(Map<String, dynamic> json) =
      _$_CalentreEvent.fromJson;

  @override
  String get eventName;
  @override
  String get eventDescription;
  @override
  String get platformType;
  @override
  String get duration;
  @override
  String get eventLink;
  @override
  String get eventType;
  @override
  num? get amount;
  @override
  bool? get isMultiple;
  @override //not supporting this feature at the moment
  AvailabilityModel get availability;
  @override
  @JsonKey(ignore: true)
  _$$_CalentreEventCopyWith<_$_CalentreEvent> get copyWith =>
      throw _privateConstructorUsedError;
}

AvailabilityModel _$AvailabilityModelFromJson(Map<String, dynamic> json) {
  return _AvailabilityModel.fromJson(json);
}

/// @nodoc
mixin _$AvailabilityModel {
  List<TimeSlotModel> get monday => throw _privateConstructorUsedError;
  List<TimeSlotModel> get tuesday => throw _privateConstructorUsedError;
  List<TimeSlotModel> get wednesday => throw _privateConstructorUsedError;
  List<TimeSlotModel> get thursday => throw _privateConstructorUsedError;
  List<TimeSlotModel> get friday => throw _privateConstructorUsedError;
  List<TimeSlotModel> get saturday => throw _privateConstructorUsedError;
  List<TimeSlotModel> get sunday => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AvailabilityModelCopyWith<AvailabilityModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AvailabilityModelCopyWith<$Res> {
  factory $AvailabilityModelCopyWith(
          AvailabilityModel value, $Res Function(AvailabilityModel) then) =
      _$AvailabilityModelCopyWithImpl<$Res, AvailabilityModel>;
  @useResult
  $Res call(
      {List<TimeSlotModel> monday,
      List<TimeSlotModel> tuesday,
      List<TimeSlotModel> wednesday,
      List<TimeSlotModel> thursday,
      List<TimeSlotModel> friday,
      List<TimeSlotModel> saturday,
      List<TimeSlotModel> sunday});
}

/// @nodoc
class _$AvailabilityModelCopyWithImpl<$Res, $Val extends AvailabilityModel>
    implements $AvailabilityModelCopyWith<$Res> {
  _$AvailabilityModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? monday = null,
    Object? tuesday = null,
    Object? wednesday = null,
    Object? thursday = null,
    Object? friday = null,
    Object? saturday = null,
    Object? sunday = null,
  }) {
    return _then(_value.copyWith(
      monday: null == monday
          ? _value.monday
          : monday // ignore: cast_nullable_to_non_nullable
              as List<TimeSlotModel>,
      tuesday: null == tuesday
          ? _value.tuesday
          : tuesday // ignore: cast_nullable_to_non_nullable
              as List<TimeSlotModel>,
      wednesday: null == wednesday
          ? _value.wednesday
          : wednesday // ignore: cast_nullable_to_non_nullable
              as List<TimeSlotModel>,
      thursday: null == thursday
          ? _value.thursday
          : thursday // ignore: cast_nullable_to_non_nullable
              as List<TimeSlotModel>,
      friday: null == friday
          ? _value.friday
          : friday // ignore: cast_nullable_to_non_nullable
              as List<TimeSlotModel>,
      saturday: null == saturday
          ? _value.saturday
          : saturday // ignore: cast_nullable_to_non_nullable
              as List<TimeSlotModel>,
      sunday: null == sunday
          ? _value.sunday
          : sunday // ignore: cast_nullable_to_non_nullable
              as List<TimeSlotModel>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_AvailabilityModelCopyWith<$Res>
    implements $AvailabilityModelCopyWith<$Res> {
  factory _$$_AvailabilityModelCopyWith(_$_AvailabilityModel value,
          $Res Function(_$_AvailabilityModel) then) =
      __$$_AvailabilityModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<TimeSlotModel> monday,
      List<TimeSlotModel> tuesday,
      List<TimeSlotModel> wednesday,
      List<TimeSlotModel> thursday,
      List<TimeSlotModel> friday,
      List<TimeSlotModel> saturday,
      List<TimeSlotModel> sunday});
}

/// @nodoc
class __$$_AvailabilityModelCopyWithImpl<$Res>
    extends _$AvailabilityModelCopyWithImpl<$Res, _$_AvailabilityModel>
    implements _$$_AvailabilityModelCopyWith<$Res> {
  __$$_AvailabilityModelCopyWithImpl(
      _$_AvailabilityModel _value, $Res Function(_$_AvailabilityModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? monday = null,
    Object? tuesday = null,
    Object? wednesday = null,
    Object? thursday = null,
    Object? friday = null,
    Object? saturday = null,
    Object? sunday = null,
  }) {
    return _then(_$_AvailabilityModel(
      monday: null == monday
          ? _value._monday
          : monday // ignore: cast_nullable_to_non_nullable
              as List<TimeSlotModel>,
      tuesday: null == tuesday
          ? _value._tuesday
          : tuesday // ignore: cast_nullable_to_non_nullable
              as List<TimeSlotModel>,
      wednesday: null == wednesday
          ? _value._wednesday
          : wednesday // ignore: cast_nullable_to_non_nullable
              as List<TimeSlotModel>,
      thursday: null == thursday
          ? _value._thursday
          : thursday // ignore: cast_nullable_to_non_nullable
              as List<TimeSlotModel>,
      friday: null == friday
          ? _value._friday
          : friday // ignore: cast_nullable_to_non_nullable
              as List<TimeSlotModel>,
      saturday: null == saturday
          ? _value._saturday
          : saturday // ignore: cast_nullable_to_non_nullable
              as List<TimeSlotModel>,
      sunday: null == sunday
          ? _value._sunday
          : sunday // ignore: cast_nullable_to_non_nullable
              as List<TimeSlotModel>,
    ));
  }
}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
class _$_AvailabilityModel
    with DiagnosticableTreeMixin
    implements _AvailabilityModel {
  const _$_AvailabilityModel(
      {required final List<TimeSlotModel> monday,
      required final List<TimeSlotModel> tuesday,
      required final List<TimeSlotModel> wednesday,
      required final List<TimeSlotModel> thursday,
      required final List<TimeSlotModel> friday,
      required final List<TimeSlotModel> saturday,
      required final List<TimeSlotModel> sunday})
      : _monday = monday,
        _tuesday = tuesday,
        _wednesday = wednesday,
        _thursday = thursday,
        _friday = friday,
        _saturday = saturday,
        _sunday = sunday;

  factory _$_AvailabilityModel.fromJson(Map<String, dynamic> json) =>
      _$$_AvailabilityModelFromJson(json);

  final List<TimeSlotModel> _monday;
  @override
  List<TimeSlotModel> get monday {
    if (_monday is EqualUnmodifiableListView) return _monday;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_monday);
  }

  final List<TimeSlotModel> _tuesday;
  @override
  List<TimeSlotModel> get tuesday {
    if (_tuesday is EqualUnmodifiableListView) return _tuesday;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_tuesday);
  }

  final List<TimeSlotModel> _wednesday;
  @override
  List<TimeSlotModel> get wednesday {
    if (_wednesday is EqualUnmodifiableListView) return _wednesday;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_wednesday);
  }

  final List<TimeSlotModel> _thursday;
  @override
  List<TimeSlotModel> get thursday {
    if (_thursday is EqualUnmodifiableListView) return _thursday;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_thursday);
  }

  final List<TimeSlotModel> _friday;
  @override
  List<TimeSlotModel> get friday {
    if (_friday is EqualUnmodifiableListView) return _friday;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_friday);
  }

  final List<TimeSlotModel> _saturday;
  @override
  List<TimeSlotModel> get saturday {
    if (_saturday is EqualUnmodifiableListView) return _saturday;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_saturday);
  }

  final List<TimeSlotModel> _sunday;
  @override
  List<TimeSlotModel> get sunday {
    if (_sunday is EqualUnmodifiableListView) return _sunday;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_sunday);
  }

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'AvailabilityModel(monday: $monday, tuesday: $tuesday, wednesday: $wednesday, thursday: $thursday, friday: $friday, saturday: $saturday, sunday: $sunday)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'AvailabilityModel'))
      ..add(DiagnosticsProperty('monday', monday))
      ..add(DiagnosticsProperty('tuesday', tuesday))
      ..add(DiagnosticsProperty('wednesday', wednesday))
      ..add(DiagnosticsProperty('thursday', thursday))
      ..add(DiagnosticsProperty('friday', friday))
      ..add(DiagnosticsProperty('saturday', saturday))
      ..add(DiagnosticsProperty('sunday', sunday));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_AvailabilityModel &&
            const DeepCollectionEquality().equals(other._monday, _monday) &&
            const DeepCollectionEquality().equals(other._tuesday, _tuesday) &&
            const DeepCollectionEquality()
                .equals(other._wednesday, _wednesday) &&
            const DeepCollectionEquality().equals(other._thursday, _thursday) &&
            const DeepCollectionEquality().equals(other._friday, _friday) &&
            const DeepCollectionEquality().equals(other._saturday, _saturday) &&
            const DeepCollectionEquality().equals(other._sunday, _sunday));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_monday),
      const DeepCollectionEquality().hash(_tuesday),
      const DeepCollectionEquality().hash(_wednesday),
      const DeepCollectionEquality().hash(_thursday),
      const DeepCollectionEquality().hash(_friday),
      const DeepCollectionEquality().hash(_saturday),
      const DeepCollectionEquality().hash(_sunday));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_AvailabilityModelCopyWith<_$_AvailabilityModel> get copyWith =>
      __$$_AvailabilityModelCopyWithImpl<_$_AvailabilityModel>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_AvailabilityModelToJson(
      this,
    );
  }
}

abstract class _AvailabilityModel implements AvailabilityModel {
  const factory _AvailabilityModel(
      {required final List<TimeSlotModel> monday,
      required final List<TimeSlotModel> tuesday,
      required final List<TimeSlotModel> wednesday,
      required final List<TimeSlotModel> thursday,
      required final List<TimeSlotModel> friday,
      required final List<TimeSlotModel> saturday,
      required final List<TimeSlotModel> sunday}) = _$_AvailabilityModel;

  factory _AvailabilityModel.fromJson(Map<String, dynamic> json) =
      _$_AvailabilityModel.fromJson;

  @override
  List<TimeSlotModel> get monday;
  @override
  List<TimeSlotModel> get tuesday;
  @override
  List<TimeSlotModel> get wednesday;
  @override
  List<TimeSlotModel> get thursday;
  @override
  List<TimeSlotModel> get friday;
  @override
  List<TimeSlotModel> get saturday;
  @override
  List<TimeSlotModel> get sunday;
  @override
  @JsonKey(ignore: true)
  _$$_AvailabilityModelCopyWith<_$_AvailabilityModel> get copyWith =>
      throw _privateConstructorUsedError;
}

TimeSlotModel _$TimeSlotModelFromJson(Map<String, dynamic> json) {
  return _TimeSlotModel.fromJson(json);
}

/// @nodoc
mixin _$TimeSlotModel {
  String get start => throw _privateConstructorUsedError;
  String get end => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TimeSlotModelCopyWith<TimeSlotModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TimeSlotModelCopyWith<$Res> {
  factory $TimeSlotModelCopyWith(
          TimeSlotModel value, $Res Function(TimeSlotModel) then) =
      _$TimeSlotModelCopyWithImpl<$Res, TimeSlotModel>;
  @useResult
  $Res call({String start, String end});
}

/// @nodoc
class _$TimeSlotModelCopyWithImpl<$Res, $Val extends TimeSlotModel>
    implements $TimeSlotModelCopyWith<$Res> {
  _$TimeSlotModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? start = null,
    Object? end = null,
  }) {
    return _then(_value.copyWith(
      start: null == start
          ? _value.start
          : start // ignore: cast_nullable_to_non_nullable
              as String,
      end: null == end
          ? _value.end
          : end // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_TimeSlotModelCopyWith<$Res>
    implements $TimeSlotModelCopyWith<$Res> {
  factory _$$_TimeSlotModelCopyWith(
          _$_TimeSlotModel value, $Res Function(_$_TimeSlotModel) then) =
      __$$_TimeSlotModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String start, String end});
}

/// @nodoc
class __$$_TimeSlotModelCopyWithImpl<$Res>
    extends _$TimeSlotModelCopyWithImpl<$Res, _$_TimeSlotModel>
    implements _$$_TimeSlotModelCopyWith<$Res> {
  __$$_TimeSlotModelCopyWithImpl(
      _$_TimeSlotModel _value, $Res Function(_$_TimeSlotModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? start = null,
    Object? end = null,
  }) {
    return _then(_$_TimeSlotModel(
      start: null == start
          ? _value.start
          : start // ignore: cast_nullable_to_non_nullable
              as String,
      end: null == end
          ? _value.end
          : end // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake)
class _$_TimeSlotModel with DiagnosticableTreeMixin implements _TimeSlotModel {
  const _$_TimeSlotModel({required this.start, required this.end});

  factory _$_TimeSlotModel.fromJson(Map<String, dynamic> json) =>
      _$$_TimeSlotModelFromJson(json);

  @override
  final String start;
  @override
  final String end;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'TimeSlotModel(start: $start, end: $end)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'TimeSlotModel'))
      ..add(DiagnosticsProperty('start', start))
      ..add(DiagnosticsProperty('end', end));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_TimeSlotModel &&
            (identical(other.start, start) || other.start == start) &&
            (identical(other.end, end) || other.end == end));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, start, end);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_TimeSlotModelCopyWith<_$_TimeSlotModel> get copyWith =>
      __$$_TimeSlotModelCopyWithImpl<_$_TimeSlotModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_TimeSlotModelToJson(
      this,
    );
  }
}

abstract class _TimeSlotModel implements TimeSlotModel {
  const factory _TimeSlotModel(
      {required final String start,
      required final String end}) = _$_TimeSlotModel;

  factory _TimeSlotModel.fromJson(Map<String, dynamic> json) =
      _$_TimeSlotModel.fromJson;

  @override
  String get start;
  @override
  String get end;
  @override
  @JsonKey(ignore: true)
  _$$_TimeSlotModelCopyWith<_$_TimeSlotModel> get copyWith =>
      throw _privateConstructorUsedError;
}
