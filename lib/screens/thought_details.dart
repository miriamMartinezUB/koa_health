import 'package:flutter/material.dart';
import 'package:koa_health/model/thought.dart';
import 'package:koa_health/model/user_preferences.dart';
import 'package:koa_health/resources/dimens.dart';
import 'package:koa_health/utils/format_time.dart';
import 'package:koa_health/utils/locator.dart';
import 'package:koa_health/utils/user_preferences_manager.dart';
import 'package:koa_health/views/content_card.dart';
import 'package:koa_health/views/feeling_icon.dart';
import 'package:koa_health/views/header.dart';
import 'package:koa_health/views/text.dart';

class ThoughtDetails extends StatelessWidget {
  final Thought thought;

  const ThoughtDetails({Key? key, required this.thought}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    UserPreferences prefs = locator<UserPreferencesManager>().get();
    return Scaffold(
      backgroundColor: Color(prefs.paletteColors.secondary),
      body: SafeArea(
        child: Column(
          children: [
            Header(
              title: thought.title.answer,
              subtitle: FormatTime(thought.createDate).getFormattedDate(),
              mustShowBackButton: true,
              icon: FeelingIcon(
                feeling: Feelings.values[thought.feeling.answer],
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(Dimens.PADDING_LARGE),
                child: ContentCard(
                  child: ListView.builder(
                      physics: const BouncingScrollPhysics(),
                      padding: const EdgeInsets.symmetric(vertical: Dimens.PADDING_LARGE),
                      shrinkWrap: true,
                      primary: false,
                      itemCount: thought.items.length,
                      itemBuilder: (context, index) {
                        return Padding(
                            padding: EdgeInsets.only(
                                bottom: thought.items.last == thought.items[index] ? 0 : Dimens.PADDING_LARGE),
                            child: Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: Dimens.PADDING_LARGE),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      AppText(
                                        thought.items[index].question,
                                        type: TextTypes.bodyBold,
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(vertical: Dimens.PADDING_LARGE),
                                        child: AppText(thought.items[index].answer),
                                      ),
                                    ],
                                  ),
                                ),
                                const Divider()
                              ],
                            ));
                      }),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
