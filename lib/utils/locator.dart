import 'package:get_it/get_it.dart';
import 'package:koa_health/utils/language_manager.dart';
import 'package:koa_health/utils/thoughts_manager.dart';
import 'package:koa_health/utils/user_preferences_manager.dart';

GetIt locator = GetIt.instance;

void setupLocator() {
  locator.registerLazySingleton(() => LanguageManager());
  locator.registerLazySingleton(() => UserPreferencesManager());
  locator.registerLazySingleton(() => ThoughtsManager());
}
