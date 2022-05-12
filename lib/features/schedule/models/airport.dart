import 'package:freezed_annotation/freezed_annotation.dart';

part '../../../generated/airport.freezed.dart';
part '../../../generated/airport.g.dart';

@freezed
class Airport with _$Airport {
  factory Airport({required int id, required String name}) = _Airport;

  factory Airport.fromJson(Map<String, dynamic> json) =>
      _$AirportFromJson(json);
}
