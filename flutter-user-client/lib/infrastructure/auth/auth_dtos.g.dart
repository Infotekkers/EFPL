// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_dtos.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_UserDto _$$_UserDtoFromJson(Map<String, dynamic> json) => _$_UserDto(
      emailAddress: json['emailAddress'] as String,
      userName: json['userName'] as String,
      teamName: json['teamName'] as String,
      country: json['country'] as String,
      favoriteEplTeam: json['favoriteEplTeam'] as String,
    );

Map<String, dynamic> _$$_UserDtoToJson(_$_UserDto instance) =>
    <String, dynamic>{
      'emailAddress': instance.emailAddress,
      'userName': instance.userName,
      'teamName': instance.teamName,
      'country': instance.country,
      'favoriteEplTeam': instance.favoriteEplTeam,
    };
