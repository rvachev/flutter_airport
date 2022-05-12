// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of '../features/schedule/models/schedule_item.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ScheduleItem _$ScheduleItemFromJson(Map<String, dynamic> json) {
  return _ScheduleItem.fromJson(json);
}

/// @nodoc
mixin _$ScheduleItem {
  int get id => throw _privateConstructorUsedError;
  String get date => throw _privateConstructorUsedError;
  Airport get airport => throw _privateConstructorUsedError;
  String get flight => throw _privateConstructorUsedError;
  Company get company => throw _privateConstructorUsedError;
  String get scheduleTime => throw _privateConstructorUsedError;
  String? get waitingTime => throw _privateConstructorUsedError;
  String? get actualTime => throw _privateConstructorUsedError;
  ScheduleStatus get status => throw _privateConstructorUsedError;
  ScheduleType get type => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ScheduleItemCopyWith<ScheduleItem> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ScheduleItemCopyWith<$Res> {
  factory $ScheduleItemCopyWith(
          ScheduleItem value, $Res Function(ScheduleItem) then) =
      _$ScheduleItemCopyWithImpl<$Res>;
  $Res call(
      {int id,
      String date,
      Airport airport,
      String flight,
      Company company,
      String scheduleTime,
      String? waitingTime,
      String? actualTime,
      ScheduleStatus status,
      ScheduleType type});

  $AirportCopyWith<$Res> get airport;
  $CompanyCopyWith<$Res> get company;
}

/// @nodoc
class _$ScheduleItemCopyWithImpl<$Res> implements $ScheduleItemCopyWith<$Res> {
  _$ScheduleItemCopyWithImpl(this._value, this._then);

  final ScheduleItem _value;
  // ignore: unused_field
  final $Res Function(ScheduleItem) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? date = freezed,
    Object? airport = freezed,
    Object? flight = freezed,
    Object? company = freezed,
    Object? scheduleTime = freezed,
    Object? waitingTime = freezed,
    Object? actualTime = freezed,
    Object? status = freezed,
    Object? type = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      date: date == freezed
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as String,
      airport: airport == freezed
          ? _value.airport
          : airport // ignore: cast_nullable_to_non_nullable
              as Airport,
      flight: flight == freezed
          ? _value.flight
          : flight // ignore: cast_nullable_to_non_nullable
              as String,
      company: company == freezed
          ? _value.company
          : company // ignore: cast_nullable_to_non_nullable
              as Company,
      scheduleTime: scheduleTime == freezed
          ? _value.scheduleTime
          : scheduleTime // ignore: cast_nullable_to_non_nullable
              as String,
      waitingTime: waitingTime == freezed
          ? _value.waitingTime
          : waitingTime // ignore: cast_nullable_to_non_nullable
              as String?,
      actualTime: actualTime == freezed
          ? _value.actualTime
          : actualTime // ignore: cast_nullable_to_non_nullable
              as String?,
      status: status == freezed
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as ScheduleStatus,
      type: type == freezed
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as ScheduleType,
    ));
  }

  @override
  $AirportCopyWith<$Res> get airport {
    return $AirportCopyWith<$Res>(_value.airport, (value) {
      return _then(_value.copyWith(airport: value));
    });
  }

  @override
  $CompanyCopyWith<$Res> get company {
    return $CompanyCopyWith<$Res>(_value.company, (value) {
      return _then(_value.copyWith(company: value));
    });
  }
}

/// @nodoc
abstract class _$ScheduleItemCopyWith<$Res>
    implements $ScheduleItemCopyWith<$Res> {
  factory _$ScheduleItemCopyWith(
          _ScheduleItem value, $Res Function(_ScheduleItem) then) =
      __$ScheduleItemCopyWithImpl<$Res>;
  @override
  $Res call(
      {int id,
      String date,
      Airport airport,
      String flight,
      Company company,
      String scheduleTime,
      String? waitingTime,
      String? actualTime,
      ScheduleStatus status,
      ScheduleType type});

  @override
  $AirportCopyWith<$Res> get airport;
  @override
  $CompanyCopyWith<$Res> get company;
}

/// @nodoc
class __$ScheduleItemCopyWithImpl<$Res> extends _$ScheduleItemCopyWithImpl<$Res>
    implements _$ScheduleItemCopyWith<$Res> {
  __$ScheduleItemCopyWithImpl(
      _ScheduleItem _value, $Res Function(_ScheduleItem) _then)
      : super(_value, (v) => _then(v as _ScheduleItem));

  @override
  _ScheduleItem get _value => super._value as _ScheduleItem;

  @override
  $Res call({
    Object? id = freezed,
    Object? date = freezed,
    Object? airport = freezed,
    Object? flight = freezed,
    Object? company = freezed,
    Object? scheduleTime = freezed,
    Object? waitingTime = freezed,
    Object? actualTime = freezed,
    Object? status = freezed,
    Object? type = freezed,
  }) {
    return _then(_ScheduleItem(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      date: date == freezed
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as String,
      airport: airport == freezed
          ? _value.airport
          : airport // ignore: cast_nullable_to_non_nullable
              as Airport,
      flight: flight == freezed
          ? _value.flight
          : flight // ignore: cast_nullable_to_non_nullable
              as String,
      company: company == freezed
          ? _value.company
          : company // ignore: cast_nullable_to_non_nullable
              as Company,
      scheduleTime: scheduleTime == freezed
          ? _value.scheduleTime
          : scheduleTime // ignore: cast_nullable_to_non_nullable
              as String,
      waitingTime: waitingTime == freezed
          ? _value.waitingTime
          : waitingTime // ignore: cast_nullable_to_non_nullable
              as String?,
      actualTime: actualTime == freezed
          ? _value.actualTime
          : actualTime // ignore: cast_nullable_to_non_nullable
              as String?,
      status: status == freezed
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as ScheduleStatus,
      type: type == freezed
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as ScheduleType,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ScheduleItem implements _ScheduleItem {
  _$_ScheduleItem(
      {required this.id,
      required this.date,
      required this.airport,
      required this.flight,
      required this.company,
      required this.scheduleTime,
      this.waitingTime,
      this.actualTime,
      required this.status,
      required this.type});

  factory _$_ScheduleItem.fromJson(Map<String, dynamic> json) =>
      _$$_ScheduleItemFromJson(json);

  @override
  final int id;
  @override
  final String date;
  @override
  final Airport airport;
  @override
  final String flight;
  @override
  final Company company;
  @override
  final String scheduleTime;
  @override
  final String? waitingTime;
  @override
  final String? actualTime;
  @override
  final ScheduleStatus status;
  @override
  final ScheduleType type;

  @override
  String toString() {
    return 'ScheduleItem(id: $id, date: $date, airport: $airport, flight: $flight, company: $company, scheduleTime: $scheduleTime, waitingTime: $waitingTime, actualTime: $actualTime, status: $status, type: $type)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ScheduleItem &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.date, date) &&
            const DeepCollectionEquality().equals(other.airport, airport) &&
            const DeepCollectionEquality().equals(other.flight, flight) &&
            const DeepCollectionEquality().equals(other.company, company) &&
            const DeepCollectionEquality()
                .equals(other.scheduleTime, scheduleTime) &&
            const DeepCollectionEquality()
                .equals(other.waitingTime, waitingTime) &&
            const DeepCollectionEquality()
                .equals(other.actualTime, actualTime) &&
            const DeepCollectionEquality().equals(other.status, status) &&
            const DeepCollectionEquality().equals(other.type, type));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(date),
      const DeepCollectionEquality().hash(airport),
      const DeepCollectionEquality().hash(flight),
      const DeepCollectionEquality().hash(company),
      const DeepCollectionEquality().hash(scheduleTime),
      const DeepCollectionEquality().hash(waitingTime),
      const DeepCollectionEquality().hash(actualTime),
      const DeepCollectionEquality().hash(status),
      const DeepCollectionEquality().hash(type));

  @JsonKey(ignore: true)
  @override
  _$ScheduleItemCopyWith<_ScheduleItem> get copyWith =>
      __$ScheduleItemCopyWithImpl<_ScheduleItem>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ScheduleItemToJson(this);
  }
}

abstract class _ScheduleItem implements ScheduleItem {
  factory _ScheduleItem(
      {required final int id,
      required final String date,
      required final Airport airport,
      required final String flight,
      required final Company company,
      required final String scheduleTime,
      final String? waitingTime,
      final String? actualTime,
      required final ScheduleStatus status,
      required final ScheduleType type}) = _$_ScheduleItem;

  factory _ScheduleItem.fromJson(Map<String, dynamic> json) =
      _$_ScheduleItem.fromJson;

  @override
  int get id => throw _privateConstructorUsedError;
  @override
  String get date => throw _privateConstructorUsedError;
  @override
  Airport get airport => throw _privateConstructorUsedError;
  @override
  String get flight => throw _privateConstructorUsedError;
  @override
  Company get company => throw _privateConstructorUsedError;
  @override
  String get scheduleTime => throw _privateConstructorUsedError;
  @override
  String? get waitingTime => throw _privateConstructorUsedError;
  @override
  String? get actualTime => throw _privateConstructorUsedError;
  @override
  ScheduleStatus get status => throw _privateConstructorUsedError;
  @override
  ScheduleType get type => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$ScheduleItemCopyWith<_ScheduleItem> get copyWith =>
      throw _privateConstructorUsedError;
}
