import 'package:flutter/material.dart';
import 'package:koa_health/model/palette_colors.dart';
import 'package:koa_health/resources/dimens.dart';
import 'package:koa_health/utils/locator.dart';
import 'package:koa_health/utils/user_preferences_manager.dart';
import 'package:koa_health/views/text.dart';

class InfiniteButton extends StatelessWidget {
  final String text;
  final Function()? onPress;

  const InfiniteButton({Key? key, required this.text, this.onPress}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    PaletteColors paletteColors = locator<UserPreferencesManager>().get().paletteColors;

    return InkWell(
      child: Container(
        width: double.infinity,
        color: Color(paletteColors.primary),
        child: Padding(
          padding: const EdgeInsets.all(Dimens.PADDING_LARGE),
          child: AppText(
            text.toUpperCase(),
            align: TextAlign.center,
            type: TextTypes.title,
            color: Color(paletteColors.textButton),
          ),
        ),
      ),
      onTap: onPress,
    );
  }
}
