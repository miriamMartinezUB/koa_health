import 'package:json_annotation/json_annotation.dart';

part 'adapters/theme_font.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class ThemeFont {
  final double textSizeBig;
  final double textSizeTitle;
  final double textSizeBody;
  final double textSizeSmallBody;
  final double textSizeTinyBody;
  final int light;
  final int normal;
  final int bold;

  ThemeFont(
      {this.textSizeBig = 24,
      this.textSizeTitle = 18,
      this.textSizeBody = 14,
      this.textSizeSmallBody = 12,
      this.textSizeTinyBody = 10,
      this.light = 2, //result of FontWeight.w300.index,
      this.normal = 3, //result of FontWeight.normal.index,
      this.bold = 6 //result of FontWeight.bold.index,
      });

  factory ThemeFont.fromJson(Map<String, dynamic> json) => _$ThemeFontFromJson(json);

  Map<String, dynamic> toJson() => _$ThemeFontToJson(this);
}
