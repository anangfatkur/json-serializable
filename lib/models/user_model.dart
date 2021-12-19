// ignore_for_file: non_constant_identifier_names

import 'package:json_annotation/json_annotation.dart';
import './data_user_model.dart';
import './support_user_model.dart';

part 'user_model.g.dart';

@JsonSerializable(explicitToJson: true)
class UserModel {
  final DataUserModel data;
  final SupportUserModel support;

  UserModel({
    required this.data,
    required this.support,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);

  /// Connect the generated [_$PersonToJson] function to the `toJson` method.
  Map<String, dynamic> toJson() => _$UserModelToJson(this);

  // factory UserModel.fromMap(Map<String, dynamic> data) {
  //   return UserModel(
  //     id: data["id"],
  //     email: data["email"],
  //     first_name: data["first_name"],
  //     last_name: data["last_name"],
  //     avatar: data["avatar"],
  //   );
  // }
}
