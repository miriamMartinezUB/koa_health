import 'package:flutter/material.dart';
import 'package:koa_health/model/palette_colors.dart';
import 'package:koa_health/resources/dimens.dart';
import 'package:koa_health/utils/locator.dart';
import 'package:koa_health/utils/user_preferences_manager.dart';
import 'package:koa_health/views/text.dart';

class FloatingButton extends StatelessWidget {
  final String text;
  final bool isInfinite;
  final Function()? onPress;

  const FloatingButton({Key? key, required this.text, this.onPress, this.isInfinite = true}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    PaletteColors paletteColors = locator<UserPreferencesManager>().get().paletteColors;
    return InkWell(
      onTap: onPress,
      child: Container(
        width: isInfinite ? double.infinity : null,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(Dimens.RADIUS_LARGE),
          color: Color(paletteColors.primary),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: Dimens.PADDING_MEDIUM, horizontal: Dimens.PADDING_LARGE),
          child: AppText(
            text.toUpperCase(),
            color: Color(paletteColors.textButton),
            align: TextAlign.center,
            type: TextTypes.title,
          ),
        ),
      ),
    );
  }
}
