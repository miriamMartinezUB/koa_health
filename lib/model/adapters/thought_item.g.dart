// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../thought_item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ThoughtItem _$ThoughtItemFromJson(Map<String, dynamic> json) => ThoughtItem(
      question: json['question'] as String,
      hint: json['hint'] as String?,
      answer: json['answer'],
      maxCharacters: json['max_characters'] as int?,
      mandatory: json['mandatory'] as bool? ?? true,
      answerType: $enumDecodeNullable(_$AnswerTypesEnumMap, json['answer_type']) ?? AnswerTypes.freeLongText,
    );

Map<String, dynamic> _$ThoughtItemToJson(ThoughtItem instance) => <String, dynamic>{
      'question': instance.question,
      'hint': instance.hint,
      'answer': instance.answer,
      'answer_type': _$AnswerTypesEnumMap[instance.answerType],
      'max_characters': instance.maxCharacters,
      'mandatory': instance.mandatory,
    };

const _$AnswerTypesEnumMap = {
  AnswerTypes.freeLongText: 'free_long_text',
  AnswerTypes.feelings: 'feelings',
};
