// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../palette_colors.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PaletteColors _$PaletteColorsFromJson(Map<String, dynamic> json) => PaletteColors(
      primary: json['primary'] as int? ?? 0xFFFAA082,
      secondary: json['secondary'] as int? ?? 0xFFF7E8DF,
      accent: json['accent'] as int? ?? 0xFFFAA082,
      cardBackground: json['card_background'] as int? ?? 0xFFFFFFFF,
      dialogBackground: json['dialog_background'] as int? ?? 0xFF243847,
      text: json['text'] as int? ?? 0xFF000000,
      textButton: json['text_button'] as int? ?? 0xFFFFFFFF,
      textSubtitle: json['text_subtitle'] as int? ?? 0x73000000,
      unselectedIcons: json['unselected_icons'] as int? ?? 0x42000000,
      icons: json['icons'] as int? ?? 0xFF000000,
      grey: json['grey'] as int? ?? 0xFFEEEFF0,
      danger: json['danger'] as int? ?? 0xFFE53935,
    );

Map<String, dynamic> _$PaletteColorsToJson(PaletteColors instance) => <String, dynamic>{
      'primary': instance.primary,
      'secondary': instance.secondary,
      'accent': instance.accent,
      'card_background': instance.cardBackground,
      'dialog_background': instance.dialogBackground,
      'text': instance.text,
      'text_button': instance.textButton,
      'text_subtitle': instance.textSubtitle,
      'unselected_icons': instance.unselectedIcons,
      'icons': instance.icons,
      'grey': instance.grey,
      'danger': instance.danger,
    };
