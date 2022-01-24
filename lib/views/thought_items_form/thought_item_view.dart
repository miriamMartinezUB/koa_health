import 'package:flutter/material.dart';
import 'package:koa_health/model/thought_item.dart';
import 'package:koa_health/resources/dimens.dart';
import 'package:koa_health/views/text.dart';
import 'package:koa_health/views/thought_items_form/answer_feeling.dart';
import 'package:koa_health/views/thought_items_form/answer_free_long_text.dart';

class ThoughtItemView extends StatelessWidget {
  ThoughtItem item;

  ThoughtItemView(this.item);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: Dimens.PADDING_LARGE),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AppText(
            item.question,
            type: TextTypes.bodyBold,
          ),
          Padding(
            padding: const EdgeInsets.only(top: Dimens.PADDING_LARGE),
            child: _getAnswer(),
          )
        ],
      ),
    );
  }

  Widget _getAnswer() {
    switch (item.answerType) {
      case AnswerTypes.feelings:
        return AnswerFeelings(onPress: (int indexFeeling) {
          item.answer = indexFeeling;
        });
      case AnswerTypes.freeLongText:
        return AnswerFreeLongText(
          onPress: (String answer) {
            item.answer = answer;
          },
          maxCharacters: item.maxCharacters,
        );
    }
  }
}
