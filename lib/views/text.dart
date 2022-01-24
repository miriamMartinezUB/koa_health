import 'package:flutter/material.dart';
import 'package:flutter_stylized_text/flutter_stylized_text.dart';
import 'package:koa_health/model/theme_font.dart';
import 'package:koa_health/model/user_preferences.dart';
import 'package:koa_health/utils/locator.dart';
import 'package:koa_health/utils/user_preferences_manager.dart';

enum TextTypes { bigBold, title, titleBold, body, bodyBold, smallBody, tiny }

class AppText extends StatelessWidget {
  final String text;
  final TextTypes type;
  final Color? color;
  final TextAlign align;

  const AppText(this.text, {Key? key, this.type = TextTypes.body, this.color, this.align = TextAlign.start})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    UserPreferences prefs = locator<UserPreferencesManager>().get();
    return FlutterStylizedText(
      text: text,
      fontSize: getFontSize(prefs.themeFont, type: type),
      fontWeight: getFontWeight(prefs.themeFont, type: type),
      textAlign: align,
      stylizedTextColor: Color(prefs.paletteColors.primary),
      color: color ?? Color(prefs.paletteColors.text),
    );
  }
}

double getFontSize(ThemeFont themeFont, {TextTypes type = TextTypes.body}) {
  if (type.toString().toLowerCase().contains('big')) {
    return themeFont.textSizeBig;
  } else if (type.toString().toLowerCase().contains('title')) {
    return themeFont.textSizeTitle;
  } else if (type.toString().toLowerCase().contains('small')) {
    return themeFont.textSizeSmallBody;
  } else if (type.toString().toLowerCase().contains('tiny')) {
    return themeFont.textSizeTinyBody;
  } else {
    return themeFont.textSizeBody;
  }
}

FontWeight getFontWeight(ThemeFont themeFont, {TextTypes type = TextTypes.body}) {
  if (type.toString().toLowerCase().contains('light')) {
    return FontWeight.values[themeFont.light];
  } else if (type.toString().toLowerCase().contains('bold')) {
    return FontWeight.values[themeFont.bold];
  } else {
    return FontWeight.values[themeFont.normal];
  }
}
