import 'package:flutter/cupertino.dart';
import 'package:flutter_translate/flutter_translate.dart';
import 'package:koa_health/model/language.dart';
import 'package:koa_health/resources/supported_languages.dart';

class LanguageManager {
  final Language _defaultLanguage = SupportedLanguages.en;
  final List<Language> _supportedLanguages = [SupportedLanguages.en];

  Future<LocalizationDelegate> initDelegate() async {
    List<String> supportedLanguages = [];
    for (Language language in _supportedLanguages) {
      supportedLanguages.add(language.getLocale());
    }
    return await LocalizationDelegate.create(
        fallbackLocale: _defaultLanguage.getLocale(), supportedLocales: supportedLanguages, basePath: 'locale/');
  }

  Future<void> changeCurrentLanguage(BuildContext context, Language newLanguage) async {
    var delegate = getDelegate(context);
    await delegate.changeLocale(Locale(newLanguage.languageCode, newLanguage.countryCode));
  }

  Language getDefaultLanguage() {
    return _defaultLanguage;
  }

  LocalizationDelegate getDelegate(BuildContext context) {
    return LocalizedApp.of(context).delegate;
  }

  List<Locale> getSupportedLocales() {
    List<Locale> supportedLocales = [];
    for (Language language in _supportedLanguages) {
      supportedLocales.add(Locale(language.languageCode, language.countryCode));
    }
    return supportedLocales;
  }
}
