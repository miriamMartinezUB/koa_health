import 'package:json_annotation/json_annotation.dart';
import 'package:koa_health/model/thought_item.dart';

part 'adapters/thought.g.dart';

@JsonEnum(fieldRename: FieldRename.snake)
enum Feelings { cloudy, rainy, partlyCloudy, sun, rainbow }

@JsonSerializable(fieldRename: FieldRename.snake)
class Thought {
  int? id;
  DateTime createDate;
  ThoughtItem feeling;
  ThoughtItem title;
  List<ThoughtItem> items;

  Thought({this.id, required this.feeling, required this.title, required this.items, required this.createDate});

  factory Thought.fromJson(Map<String, dynamic> json) => _$ThoughtFromJson(json);

  Map<String, dynamic> toJson() => _$ThoughtToJson(this);
}
