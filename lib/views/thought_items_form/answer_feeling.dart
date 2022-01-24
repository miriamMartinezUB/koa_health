import 'package:flutter/material.dart';
import 'package:koa_health/model/palette_colors.dart';
import 'package:koa_health/model/thought.dart';
import 'package:koa_health/resources/dimens.dart';
import 'package:koa_health/utils/locator.dart';
import 'package:koa_health/utils/user_preferences_manager.dart';
import 'package:koa_health/views/buttons/app_icon_button.dart';
import 'package:koa_health/views/feeling_icon.dart';

class AnswerFeelings extends StatefulWidget {
  final Function(int indexFeeling) onPress;

  const AnswerFeelings({Key? key, required this.onPress}) : super(key: key);

  @override
  _AnswerFeelingsState createState() => _AnswerFeelingsState();
}

class _AnswerFeelingsState extends State<AnswerFeelings> {
  PaletteColors paletteColors = locator<UserPreferencesManager>().get().paletteColors;
  int? selectedIndex;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: Dimens.ICON_SIZE_MEDIUM*1.5,
        child: ListView.builder(
            physics: const BouncingScrollPhysics(),
            shrinkWrap: true,
            primary: false,
            scrollDirection: Axis.horizontal,
            itemCount: Feelings.values.length,
            itemBuilder: (context, index) {
              Color color = Color(paletteColors.unselectedIcons);
              if (selectedIndex == null) {
                color = Color(paletteColors.icons);
              } else if (selectedIndex == index) {
                color = Color(paletteColors.primary);
              }
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: Dimens.PADDING_MEDIUM),
                child: AppIconButton(
                  icon: FeelingIcon(
                    feeling: Feelings.values[index],
                    color: color,
                  ),
                  onPress: () {
                    setState(() {
                      selectedIndex = index;
                    });
                    widget.onPress.call(index);
                  },
                ),
              );
            }));
  }
}
