import 'package:flutter/material.dart';
import 'package:flutter_translate/flutter_translate.dart';
import 'package:koa_health/model/palette_colors.dart';
import 'package:koa_health/resources/dimens.dart';
import 'package:koa_health/utils/locator.dart';
import 'package:koa_health/utils/navigation_manager.dart';
import 'package:koa_health/utils/user_preferences_manager.dart';
import 'package:koa_health/views/buttons/app_icon_button.dart';
import 'package:koa_health/views/buttons/floating_button.dart';
import 'package:koa_health/views/content_card.dart';
import 'package:koa_health/views/text.dart';

class ShowDialog {
  final String title;
  final Widget body;
  ContentAction? action;

  ShowDialog({required this.title, required this.body, this.action});

  show(BuildContext context) async {
    PaletteColors paletteColors = locator<UserPreferencesManager>().get().paletteColors;
    action ??= ContentAction(
        textAction: translate('common_texts.ok'),
        onPress: () {
          NavigationManager(context).back();
        });

    return showDialog<void>(
      context: context,
      barrierColor: Color(paletteColors.dialogBackground),
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          contentPadding: EdgeInsets.all(0),
          elevation: 0,
          backgroundColor: Color(paletteColors.dialogBackground),
          scrollable: true,
          content: Column(
            children: [
              Row(
                children: [
                  Expanded(child: AppText(title.toUpperCase(), color: Color(paletteColors.textButton))),
                  AppIconButton(
                      icon: Icon(Icons.close),
                      color: Color(paletteColors.textButton),
                      onPress: () {
                        NavigationManager(context).back();
                      })
                ],
              ),
              ContentCard(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      body,
                      Padding(
                        padding: const EdgeInsets.all(Dimens.PADDING_LARGE),
                        child: FloatingButton(
                          text: action!.textAction,
                          onPress: action!.onPress,
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

class ContentAction {
  final String textAction;
  final Function() onPress;

  ContentAction({required this.textAction, required this.onPress});
}
