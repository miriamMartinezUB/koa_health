import 'package:flutter/material.dart';
import 'package:koa_health/model/palette_colors.dart';
import 'package:koa_health/resources/dimens.dart';
import 'package:koa_health/utils/locator.dart';
import 'package:koa_health/utils/navigation_manager.dart';
import 'package:koa_health/utils/user_preferences_manager.dart';
import 'package:koa_health/views/buttons/app_icon_button.dart';
import 'package:koa_health/views/text.dart';

class Header extends StatelessWidget {
  final String title;
  final String? subtitle;
  final Widget? icon;
  final bool mustShowBackButton;

  const Header({Key? key, required this.title, this.subtitle, this.icon, this.mustShowBackButton = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    PaletteColors paletteColors = locator<UserPreferencesManager>().get().paletteColors;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: Dimens.PADDING_LARGE),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          mustShowBackButton
              ? AppIconButton(
                  onPress: () {
                    NavigationManager(context).back();
                  },
                  color: Color(paletteColors.primary),
                  icon: Icon(Icons.arrow_back_ios_outlined),
                )
              : Container(),
          icon == null ? Container() : icon!,
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: Dimens.PADDING_LARGE),
              child: Column(
                crossAxisAlignment: subtitle == null ? CrossAxisAlignment.center : CrossAxisAlignment.start,
                children: [
                  AppText(
                    title,
                    type: TextTypes.titleBold,
                    align: subtitle == null ? TextAlign.center : TextAlign.start,
                  ),
                  subtitle == null
                      ? Container()
                      : Padding(
                          padding: const EdgeInsets.only(top: Dimens.PADDING_MEDIUM),
                          child: AppText(
                            subtitle!,
                            color: Color(paletteColors.textSubtitle),
                            type: TextTypes.smallBody,
                          ),
                        )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
