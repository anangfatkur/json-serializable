// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'support_user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SupportUserModel _$SupportUserModelFromJson(Map<String, dynamic> json) =>
    SupportUserModel(
      text: json['text'] as String,
      url: json['url'] as String,
    );

Map<String, dynamic> _$SupportUserModelToJson(SupportUserModel instance) =>
    <String, dynamic>{
      'url': instance.url,
      'text': instance.text,
    };
