import 'package:flutter/material.dart';
import 'package:koa_health/model/palette_colors.dart';
import 'package:koa_health/resources/dimens.dart';
import 'package:koa_health/utils/locator.dart';
import 'package:koa_health/utils/user_preferences_manager.dart';

class ContentCard extends StatelessWidget {
  final Widget child;

  const ContentCard({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    PaletteColors paletteColors = locator<UserPreferencesManager>().get().paletteColors;
    return Container(
      decoration: BoxDecoration(
          color: Color(paletteColors.cardBackground), borderRadius: BorderRadius.circular(Dimens.RADIUS_SMALL)),
      child: child,
    );
  }
}
