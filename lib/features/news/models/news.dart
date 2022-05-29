import 'package:airport/features/home/models/image_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part '../../../generated/news.freezed.dart';
part '../../../generated/news.g.dart';

@freezed
class News with _$News {
  factory News(
      {required int id,
      required String title,
      required String description,
      required DateTime date,
      ImageModel? image}) = _News;

  factory News.fromJson(Map<String, dynamic> json) => _$NewsFromJson(json);
}
