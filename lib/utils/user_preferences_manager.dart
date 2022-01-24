import 'dart:convert';

import 'package:hive_flutter/hive_flutter.dart';
import 'package:koa_health/model/palette_colors.dart';
import 'package:koa_health/model/theme_font.dart';
import 'package:koa_health/model/user_preferences.dart';
import 'package:koa_health/utils/language_manager.dart';
import 'package:koa_health/utils/locator.dart';

class UserPreferencesManager {
  static const String _key = "user_prefs_koa";
  static const String _boxName = "preferencies";
  late Box db;

  Future<void> init() async {
    await Hive.openBox(_boxName);
    db = Hive.box(_boxName);
  }

  UserPreferences get() {
    String? user = db.get(_key);
    return user == null
        ? UserPreferences(locator<LanguageManager>().getDefaultLanguage(), PaletteColors(), ThemeFont())
        : UserPreferences.fromJson(jsonDecode(user));
  }
}
