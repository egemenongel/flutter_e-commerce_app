import 'package:ecommerce_app/core/base/model/base_model.dart';
import 'package:ecommerce_app/product/models/address_model.dart';
import 'package:ecommerce_app/product/models/name_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'profile_model.g.dart';

@JsonSerializable(createToJson: false)
class ProfileModel extends BaseModel {
  Address? address;
  int? id;
  String? email;
  String? username;
  String? password;
  Name? name;
  String? phone;
  int? iV;

  ProfileModel(
      {this.address,
      this.id,
      this.email,
      this.username,
      this.password,
      this.name,
      this.phone,
      this.iV});
  @override
  fromJson(Map<String, dynamic> json) {
    return _$ProfileModelFromJson(json);
  }

  @override
  Map<String, dynamic> toJson() {
    throw UnimplementedError();
  }
}
