import 'dart:convert';

class ImageModel {
  final int id;
  final String? url;
  final String? thumbnailUrl;

  ImageModel({
    required this.id,
    required this.url,
    required this.thumbnailUrl,
  });

  ImageModel copyWith({
    int? id,
    String? url,
    String? thumbnailUrl,
  }) {
    return ImageModel(
      id: id ?? this.id,
      url: url ?? this.url,
      thumbnailUrl: thumbnailUrl ?? this.thumbnailUrl,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'url': url,
      'thumbnailUrl': thumbnailUrl,
    };
  }

  factory ImageModel.fromMap(Map<String, dynamic> map) {
    return ImageModel(
      id: map['id']?.toInt() ?? 0,
      url: map['url'] ?? '',
      thumbnailUrl:
          map['formats'] != null ? map['formats']['thumbnail']['url'] : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory ImageModel.fromJson(String source) =>
      ImageModel.fromMap(json.decode(source));

  @override
  String toString() =>
      'ImageModel(id: $id, url: $url, thumbnailUrl: $thumbnailUrl)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is ImageModel &&
        other.id == id &&
        other.url == url &&
        other.thumbnailUrl == thumbnailUrl;
  }

  @override
  int get hashCode => id.hashCode ^ url.hashCode ^ thumbnailUrl.hashCode;
}
