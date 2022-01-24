import 'package:json_annotation/json_annotation.dart';

part 'adapters/palette_colors.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)

///class to manage theme of app
class PaletteColors {
  final int primary;
  final int secondary;
  final int accent;
  final int cardBackground;
  final int dialogBackground;
  final int text;
  final int textButton;
  final int textSubtitle;
  final int unselectedIcons;
  final int icons;
  final int grey;
  final int danger;

  PaletteColors(
      {this.primary = 0xFFFAA082,
      this.secondary = 0xFFF7E8DF,
      this.accent = 0xFFFAA082,
      this.cardBackground = 0xFFFFFFFF,
      this.dialogBackground = 0xFF243847,
      this.text = 0xFF000000,
      this.textButton = 0xFFFFFFFF,
      this.textSubtitle = 0x73000000,
      this.unselectedIcons = 0x42000000,
      this.icons = 0xFF000000,
      this.grey = 0xFFEEEFF0,
      this.danger = 0xFFE53935});

  factory PaletteColors.fromJson(Map<String, dynamic> json) => _$PaletteColorsFromJson(json);

  Map<String, dynamic> toJson() => _$PaletteColorsToJson(this);
}
