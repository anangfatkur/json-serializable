import 'package:json_annotation/json_annotation.dart';

part 'data_user_model.g.dart';

@JsonSerializable()
class DataUserModel {
  final int id;
  final String email;
  final String first_name;
  final String last_name;
  final String avatar;

  DataUserModel({
    required this.id,
    required this.email,
    required this.first_name,
    required this.last_name,
    required this.avatar,
  });

  //NOTE dari mapping ke bentuk model
  factory DataUserModel.fromJson(Map<String, dynamic> json) =>
      _$DataUserModelFromJson(json);

  //NOTE dari model ke bentuk mapping
  /// Connect the generated [_$PersonToJson] function to the `toJson` method.
  Map<String, dynamic> toJson() => _$DataUserModelToJson(this);
}
