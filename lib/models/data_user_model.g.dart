// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'data_user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DataUserModel _$DataUserModelFromJson(Map<String, dynamic> json) =>
    DataUserModel(
      id: json['id'] as int,
      email: json['email'] as String,
      first_name: json['first_name'] as String,
      last_name: json['last_name'] as String,
      avatar: json['avatar'] as String,
    );

Map<String, dynamic> _$DataUserModelToJson(DataUserModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'email': instance.email,
      'first_name': instance.first_name,
      'last_name': instance.last_name,
      'avatar': instance.avatar,
    };
