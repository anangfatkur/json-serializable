// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserModel _$UserModelFromJson(Map<String, dynamic> json) => UserModel(
      data: DataUserModel.fromJson(json['data'] as Map<String, dynamic>),
      support:
          SupportUserModel.fromJson(json['support'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$UserModelToJson(UserModel instance) => <String, dynamic>{
      'data': instance.data.toJson(),
      'support': instance.support.toJson(),
    };
