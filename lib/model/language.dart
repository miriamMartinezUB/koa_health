import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';

part 'adapters/language.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class Language extends Locale {
  @override
  final String languageCode;
  @override
  final String? countryCode;
  Language({required this.languageCode, this.countryCode}) : super(languageCode, countryCode);

  String getLocale() {
    return countryCode == null ? languageCode : languageCode + '_' + countryCode!;
  }

  factory Language.fromJson(Map<String, dynamic> json) => _$LanguageFromJson(json);

  Map<String, dynamic> toJson() => _$LanguageToJson(this);
}
