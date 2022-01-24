// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../thought.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Thought _$ThoughtFromJson(Map<String, dynamic> json) => Thought(
      id: json['id'] as int?,
      feeling: ThoughtItem.fromJson(json['feeling'] as Map<String, dynamic>),
      title: ThoughtItem.fromJson(json['title'] as Map<String, dynamic>),
      items: (json['items'] as List<dynamic>).map((e) => ThoughtItem.fromJson(e as Map<String, dynamic>)).toList(),
      createDate: DateTime.parse(json['create_date'] as String),
    );

Map<String, dynamic> _$ThoughtToJson(Thought instance) => <String, dynamic>{
      'id': instance.id,
      'create_date': instance.createDate.toIso8601String(),
      'feeling': instance.feeling,
      'title': instance.title,
      'items': instance.items,
    };
