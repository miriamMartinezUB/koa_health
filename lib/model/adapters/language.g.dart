// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../language.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Language _$LanguageFromJson(Map<String, dynamic> json) => Language(
      languageCode: json['language_code'] as String,
      countryCode: json['country_code'] as String?,
    );

Map<String, dynamic> _$LanguageToJson(Language instance) => <String, dynamic>{
      'language_code': instance.languageCode,
      'country_code': instance.countryCode,
    };
