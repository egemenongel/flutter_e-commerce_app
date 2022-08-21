import 'package:ecommerce_app/core/base/model/base_model.dart';
import 'package:json_annotation/json_annotation.dart';
part 'name_model.g.dart';

@JsonSerializable(createToJson: false)
class Name extends BaseModel {
  String? firstname;
  String? lastname;

  Name({this.firstname, this.lastname});
  factory Name.fromJson(Map<String, dynamic> json) => _$NameFromJson(json);
  @override
  fromJson(Map<String, dynamic> json) {
    return _$NameFromJson(json);
  }

  @override
  Map<String, dynamic> toJson() {
    throw UnimplementedError();
  }
}
