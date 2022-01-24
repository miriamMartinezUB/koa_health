import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_translate/flutter_translate.dart';
import 'package:koa_health/model/user_preferences.dart';
import 'package:koa_health/screens/main_screen.dart';
import 'package:koa_health/utils/hive_database_manager.dart';
import 'package:koa_health/utils/language_manager.dart';
import 'package:koa_health/utils/locator.dart';
import 'package:koa_health/utils/user_preferences_manager.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  setupLocator();
  var delegate = await locator<LanguageManager>().initDelegate();
  await HiveDatabaseManager().init();
  runApp(LocalizedApp(delegate, MyApp()));
}

class MyApp extends StatelessWidget {
  LanguageManager languageManager = locator<LanguageManager>();
  UserPreferences userPreferences = locator<UserPreferencesManager>().get();

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
      systemNavigationBarIconBrightness: Brightness.light,
    ));
    return MaterialApp(
      localizationsDelegates: [
        languageManager.getDelegate(context),
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      supportedLocales: languageManager.getSupportedLocales(),
      locale: Locale(userPreferences.language.languageCode, userPreferences.language.countryCode),
      theme: ThemeData(
          primaryColor: Color(userPreferences.paletteColors.primary),
          backgroundColor: Color(userPreferences.paletteColors.cardBackground)),
      home: const MainScreen(),
    );
  }
}
