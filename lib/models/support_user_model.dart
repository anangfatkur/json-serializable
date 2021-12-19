import 'package:json_annotation/json_annotation.dart';

part 'support_user_model.g.dart';

@JsonSerializable()
class SupportUserModel {
  final String url;
  final String text;

  SupportUserModel({
    required this.text,
    required this.url,
  });

  factory SupportUserModel.fromJson(Map<String, dynamic> json) =>
      _$SupportUserModelFromJson(json);

  /// Connect the generated [_$PersonToJson] function to the `toJson` method.
  Map<String, dynamic> toJson() => _$SupportUserModelToJson(this);
}
