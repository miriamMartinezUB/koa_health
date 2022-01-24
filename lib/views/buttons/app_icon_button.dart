import 'package:flutter/material.dart';
import 'package:koa_health/model/palette_colors.dart';
import 'package:koa_health/resources/dimens.dart';
import 'package:koa_health/utils/locator.dart';
import 'package:koa_health/utils/user_preferences_manager.dart';

class AppIconButton extends StatelessWidget {
  final Widget icon;
  final Color? color;
  final double? size;
  final Function() onPress;

  const AppIconButton({Key? key, required this.icon, this.color, this.size, required this.onPress}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    PaletteColors paletteColors = locator<UserPreferencesManager>().get().paletteColors;

    return IconButton(
      onPressed: onPress,
      icon: icon,
      color: color ?? Color(paletteColors.icons),
      iconSize: size ?? Dimens.ICON_SIZE_SMALL,
    );
  }
}
