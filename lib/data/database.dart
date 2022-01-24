import 'package:koa_health/data/data_filler.dart';
import 'package:koa_health/model/thought.dart';
import 'package:koa_health/model/thought_item.dart';

class Database {
  late ThoughtItem feeling;
  late ThoughtItem title;
  List<ThoughtItem> defaultThoughtItems = [];
  List<Thought> thoughts = [];

  Database() {
    DataFiller(this).fillDatabaseWithData();
  }

  void setFeeling(ThoughtItem item) {
    feeling = item;
  }

  void setTitle(ThoughtItem item) {
    title = item;
  }

  void addThoughtItem(ThoughtItem item) {
    defaultThoughtItems.add(item);
  }

  void addThought(Thought thought) {
    thoughts.add(thought);
  }
}
