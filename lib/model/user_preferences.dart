import 'package:json_annotation/json_annotation.dart';
import 'package:koa_health/model/language.dart';
import 'package:koa_health/model/palette_colors.dart';
import 'package:koa_health/model/theme_font.dart';

part 'adapters/user_preferences.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class UserPreferences {
  final Language language;
  final PaletteColors paletteColors;
  final ThemeFont themeFont;

  UserPreferences(this.language, this.paletteColors, this.themeFont);

  factory UserPreferences.fromJson(Map<String, dynamic> json) => _$UserPreferencesFromJson(json);

  Map<String, dynamic> toJson() => _$UserPreferencesToJson(this);
}
