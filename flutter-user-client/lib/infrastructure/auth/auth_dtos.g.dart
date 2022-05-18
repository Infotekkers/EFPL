// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_dtos.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_UserDto _$$_UserDtoFromJson(Map<String, dynamic> json) => _$_UserDto(
      email: json['email'] as String,
      userName: json['userName'] as String,
      teamName: json['teamName'] as String,
      country: json['country'] as String,
      favoriteEplTeamId: json['favoriteEplTeamId'] as String,
      password: json['password'] as String? ?? "",
    );

Map<String, dynamic> _$$_UserDtoToJson(_$_UserDto instance) =>
    <String, dynamic>{
      'email': instance.email,
      'userName': instance.userName,
      'teamName': instance.teamName,
      'country': instance.country,
      'favoriteEplTeamId': instance.favoriteEplTeamId,
      'password': instance.password,
    };
