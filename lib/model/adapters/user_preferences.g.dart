// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../user_preferences.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserPreferences _$UserPreferencesFromJson(Map<String, dynamic> json) => UserPreferences(
      Language.fromJson(json['language'] as Map<String, dynamic>),
      PaletteColors.fromJson(json['palette_colors'] as Map<String, dynamic>),
      ThemeFont.fromJson(json['theme_font'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$UserPreferencesToJson(UserPreferences instance) => <String, dynamic>{
      'language': instance.language,
      'palette_colors': instance.paletteColors,
      'theme_font': instance.themeFont,
    };
