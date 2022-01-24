import 'package:json_annotation/json_annotation.dart';

part 'adapters/thought_item.g.dart';

@JsonEnum(fieldRename: FieldRename.snake)
enum AnswerTypes { freeLongText, feelings }

@JsonSerializable(fieldRename: FieldRename.snake)
class ThoughtItem {
  final String question;
  final String? hint;
  dynamic answer;
  final AnswerTypes answerType;
  final int? maxCharacters;
  final bool mandatory;

  ThoughtItem(
      {required this.question,
      this.hint,
      this.answer,
      this.maxCharacters,
      this.mandatory = true,
      this.answerType = AnswerTypes.freeLongText});

  factory ThoughtItem.fromJson(Map<String, dynamic> json) => _$ThoughtItemFromJson(json);

  Map<String, dynamic> toJson() => _$ThoughtItemToJson(this);
}
