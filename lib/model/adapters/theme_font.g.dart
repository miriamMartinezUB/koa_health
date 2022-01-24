// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../theme_font.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ThemeFont _$ThemeFontFromJson(Map<String, dynamic> json) => ThemeFont(
      textSizeBig: (json['text_size_big'] as num?)?.toDouble() ?? 24,
      textSizeTitle: (json['text_size_title'] as num?)?.toDouble() ?? 18,
      textSizeBody: (json['text_size_body'] as num?)?.toDouble() ?? 14,
      textSizeSmallBody:
          (json['text_size_small_body'] as num?)?.toDouble() ?? 12,
      textSizeTinyBody: (json['text_size_tiny_body'] as num?)?.toDouble() ?? 10,
      light: json['light'] as int? ?? 2,
      normal: json['normal'] as int? ?? 3,
      bold: json['bold'] as int? ?? 6,
    );

Map<String, dynamic> _$ThemeFontToJson(ThemeFont instance) => <String, dynamic>{
      'text_size_big': instance.textSizeBig,
      'text_size_title': instance.textSizeTitle,
      'text_size_body': instance.textSizeBody,
      'text_size_small_body': instance.textSizeSmallBody,
      'text_size_tiny_body': instance.textSizeTinyBody,
      'light': instance.light,
      'normal': instance.normal,
      'bold': instance.bold,
    };
