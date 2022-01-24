import 'package:hive_flutter/hive_flutter.dart';
import 'package:koa_health/utils/locator.dart';
import 'package:koa_health/utils/thoughts_manager.dart';
import 'package:koa_health/utils/user_preferences_manager.dart';

class HiveDatabaseManager {
  init() async {
    await Hive.initFlutter();
    await _registerAdapters();
  }

  _registerAdapters() async {
    await locator<UserPreferencesManager>().init();
    await locator<ThoughtsManager>().init();
  }
}
