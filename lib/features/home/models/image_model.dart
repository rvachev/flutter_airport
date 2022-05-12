import 'package:freezed_annotation/freezed_annotation.dart';

part '../../../generated/image_model.freezed.dart';
part '../../../generated/image_model.g.dart';

@freezed
class ImageModel with _$ImageModel {
  factory ImageModel({required int id, String? url, String? thumbnailUrl}) =
      _ImageModel;

  factory ImageModel.fromJson(Map<String, dynamic> json) =>
      _$ImageModelFromJson(json);
}
