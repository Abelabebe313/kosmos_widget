// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_PublicationUserModel _$$_PublicationUserModelFromJson(
        Map<String, dynamic> json) =>
    _$_PublicationUserModel(
      id: json['id'] as String,
      avatar: json['avatar'] as String,
      firstname: json['firstname'] as String,
      lastname: json['lastname'] as String,
      username: json['username'] as String,
      verified: json['verified'] as bool,
    );

Map<String, dynamic> _$$_PublicationUserModelToJson(
        _$_PublicationUserModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'avatar': instance.avatar,
      'firstname': instance.firstname,
      'lastname': instance.lastname,
      'username': instance.username,
      'verified': instance.verified,
    };
