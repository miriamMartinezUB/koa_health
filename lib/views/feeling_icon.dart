import 'package:flutter/material.dart';
import 'package:koa_health/model/palette_colors.dart';
import 'package:koa_health/model/thought.dart';
import 'package:koa_health/resources/dimens.dart';
import 'package:koa_health/utils/locator.dart';
import 'package:koa_health/utils/user_preferences_manager.dart';

class FeelingIcon extends StatelessWidget {
  final Feelings feeling;
  final Color? color;
  const FeelingIcon({Key? key, required this.feeling, this.color}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    PaletteColors paletteColors = locator<UserPreferencesManager>().get().paletteColors;

    return Image.asset(
      'assets/feelings/${feeling.toString().split('.')[1]}.png',
      width: Dimens.ICON_SIZE_MEDIUM,
      color: color ?? Color(paletteColors.icons),
    );
  }
}
