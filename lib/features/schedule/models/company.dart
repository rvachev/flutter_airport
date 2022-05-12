import 'package:airport/features/home/models/image_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part '../../../generated/company.freezed.dart';
part '../../../generated/company.g.dart';

@freezed
class Company with _$Company {
  factory Company({
    required int id,
    required String name,
    ImageModel? image,
  }) = _Company;

  factory Company.fromJson(Map<String, dynamic> json) =>
      _$CompanyFromJson(json);
}
