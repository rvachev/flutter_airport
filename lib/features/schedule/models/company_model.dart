import 'dart:convert';

import 'package:airport/features/home/models/image_model.dart';

class CompanyModel {
  final int id;
  final String name;
  final ImageModel? image;

  CompanyModel({
    required this.id,
    required this.name,
    required this.image,
  });

  CompanyModel copyWith({
    int? id,
    String? name,
    ImageModel? image,
  }) {
    return CompanyModel(
      id: id ?? this.id,
      name: name ?? this.name,
      image: image ?? this.image,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'image': image?.toMap(),
    };
  }

  factory CompanyModel.fromMap(Map<String, dynamic> map) {
    return CompanyModel(
      id: map['id']?.toInt() ?? 0,
      name: map['name'] ?? '',
      image: ImageModel.fromMap(map['avatar']),
    );
  }

  String toJson() => json.encode(toMap());

  factory CompanyModel.fromJson(String source) =>
      CompanyModel.fromMap(json.decode(source));

  @override
  String toString() => 'CompanyModel(id: $id, name: $name, image: $image)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is CompanyModel &&
        other.id == id &&
        other.name == name &&
        other.image == image;
  }

  @override
  int get hashCode => id.hashCode ^ name.hashCode ^ image.hashCode;
}
