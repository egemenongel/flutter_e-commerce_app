import 'package:ecommerce_app/core/base/model/base_model.dart';
import 'package:json_annotation/json_annotation.dart';
part 'address_model.g.dart';

@JsonSerializable(createToJson: false)
class Address extends BaseModel {
  String? city;
  String? street;
  int? number;
  String? zipcode;

  Address({this.city, this.street, this.number, this.zipcode});

  factory Address.fromJson(Map<String, dynamic> json) =>
      _$AddressFromJson(json);
  @override
  fromJson(Map<String, dynamic> json) {
    return _$AddressFromJson(json);
  }

  @override
  Map<String, dynamic> toJson() {
    throw UnimplementedError();
  }
}
