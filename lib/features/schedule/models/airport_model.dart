import 'dart:convert';

class AirportModel {
  final int id;
  final String name;

  AirportModel({
    required this.id,
    required this.name,
  });

  AirportModel copyWith({
    int? id,
    String? name,
  }) {
    return AirportModel(
      id: id ?? this.id,
      name: name ?? this.name,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
    };
  }

  factory AirportModel.fromMap(Map<String, dynamic> map) {
    return AirportModel(
      id: map['id']?.toInt() ?? 0,
      name: map['name'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory AirportModel.fromJson(String source) =>
      AirportModel.fromMap(json.decode(source));

  @override
  String toString() => 'Airport(id: $id, name: $name)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is AirportModel && other.id == id && other.name == name;
  }

  @override
  int get hashCode => id.hashCode ^ name.hashCode;
}
