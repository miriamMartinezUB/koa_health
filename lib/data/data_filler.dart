import 'package:flutter_translate/flutter_translate.dart';
import 'package:koa_health/data/database.dart';
import 'package:koa_health/model/thought.dart';
import 'package:koa_health/model/thought_item.dart';

class DataFiller {
  final Database database;

  DataFiller(this.database);

  fillDatabaseWithData() {
    ThoughtItem feelings =
        ThoughtItem(question: translate('thoughts.feeling_question'), answerType: AnswerTypes.feelings);
    ThoughtItem think = ThoughtItem(question: translate('thoughts.think_question'), maxCharacters: 400);
    ThoughtItem evidence = ThoughtItem(question: translate('thoughts.evidence_question'), maxCharacters: 400);

    database.setFeeling(feelings);
    database.setTitle(think);
    database.addThoughtItem(evidence);

    Thought thought = Thought(
        id: 0,
        feeling: ThoughtItem(
            question: translate('thoughts.feeling_question'),
            answerType: AnswerTypes.feelings,
            answer: Feelings.rainy.index),
        title: ThoughtItem(
            question: translate('thoughts.think_question'),
            maxCharacters: 400,
            answer: 'I need to think more what the other person is feeling'),
        createDate: DateTime(2018, 12, 9, 16, 22),
        items: [
          ThoughtItem(
              question: translate('thoughts.evidence_question'),
              maxCharacters: 400,
              answer: 'Yes, Bill was very rude to me.')
        ]);
    database.addThought(thought);
  }
}
