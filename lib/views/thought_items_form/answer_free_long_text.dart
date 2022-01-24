import 'package:flutter/material.dart';
import 'package:koa_health/model/user_preferences.dart';
import 'package:koa_health/utils/locator.dart';
import 'package:koa_health/utils/user_preferences_manager.dart';
import 'package:koa_health/views/text.dart';

class AnswerFreeLongText extends StatelessWidget {
  final int? maxCharacters;
  final Function(String answer) onPress;

  const AnswerFreeLongText({Key? key, required this.onPress, this.maxCharacters}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    UserPreferences prefs = locator<UserPreferencesManager>().get();
    TextStyle style = TextStyle(
        color: Color(prefs.paletteColors.text),
        fontWeight: getFontWeight(prefs.themeFont),
        fontSize: getFontSize(prefs.themeFont));
    return Card(
      color: Color(prefs.paletteColors.grey),
      child: TextFormField(
        keyboardType: TextInputType.multiline,
        textInputAction: TextInputAction.newline,
        maxLines: null,
        autofocus: true,
        maxLength: maxCharacters,
        onChanged: onPress,
        cursorColor: Color(prefs.paletteColors.primary),
        style: style,
        decoration: InputDecoration(
          border: InputBorder.none,
          counterStyle: style,
        ),
      ),
    );
  }
}
