import 'package:flutter/material.dart';
import 'package:koa_health/model/palette_colors.dart';
import 'package:koa_health/model/thought.dart';
import 'package:koa_health/resources/dimens.dart';
import 'package:koa_health/screens/thought_details.dart';
import 'package:koa_health/utils/format_time.dart';
import 'package:koa_health/utils/locator.dart';
import 'package:koa_health/utils/navigation_manager.dart';
import 'package:koa_health/utils/user_preferences_manager.dart';
import 'package:koa_health/views/buttons/app_icon_button.dart';
import 'package:koa_health/views/feeling_icon.dart';
import 'package:koa_health/views/text.dart';

class ThoughtButton extends StatelessWidget {
  final Thought thought;

  const ThoughtButton({Key? key, required this.thought}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    PaletteColors paletteColors = locator<UserPreferencesManager>().get().paletteColors;
    return InkWell(
      onTap: () {
        NavigationManager(context).openScreen(ThoughtDetails(thought: thought));
      },
      child: Row(children: [
        FeelingIcon(feeling: Feelings.values[thought.feeling.answer]),
        Expanded(
          child: Padding(
            padding: EdgeInsets.only(left: Dimens.PADDING_LARGE),
            child: Container(
              decoration: BoxDecoration(
                color: Color(paletteColors.cardBackground),
                borderRadius: BorderRadius.circular(Dimens.RADIUS_SMALL),
                boxShadow: [
                  BoxShadow(
                    color: Color(paletteColors.grey),
                    spreadRadius: 1,
                    blurRadius: 7,
                    offset: Offset(0, 3), // changes position of shadow
                  ),
                ],
              ),
              child: Row(
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(Dimens.PADDING_LARGE),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          AppText(
                            thought.title.answer,
                            type: TextTypes.bodyBold,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: Dimens.PADDING_MEDIUM),
                            child: AppText(
                              FormatTime(thought.createDate).getFormattedDate(),
                              color: Color(paletteColors.textSubtitle),
                              type: TextTypes.smallBody,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  AppIconButton(
                    onPress: () {},
                    color: Color(paletteColors.primary),
                    icon: Icon(Icons.arrow_forward_ios_outlined),
                  )
                ],
              ),
            ),
          ),
        )
      ]),
    );
  }
}
