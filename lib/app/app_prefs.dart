import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../presentation/resources/language_manager.dart';

const String prefsKeyLang = 'prefsKeyLang';
const String prefsKeyOnboardingScreen = 'prefsKeyOnboardingScreen';
const String prefsKeyIsUserLoggedIn = 'prefsKeyIsUserLoggedIn';
const String prefsKeyToken = 'prefsKeyToken';

class AppPreferences {
  final SharedPreferences _sharedPreferences;

  AppPreferences(this._sharedPreferences);

  Future<String> getAppLanguage() async {
    String? language = _sharedPreferences.getString(prefsKeyLang);
    if (language != null && language.isNotEmpty) {
      return language;
    } else {
      return LanguageType.english.getValue();
    }
  }

  Future<void> setAppLanguage() async {
    String curentLanguage = await getAppLanguage();
    if (curentLanguage == LanguageType.english.getValue()) {
      _sharedPreferences.setString(
          prefsKeyLang, LanguageType.burmese.getValue());
    } else {
      _sharedPreferences.setString(
          prefsKeyLang, LanguageType.english.getValue());
    }
  }

  Future<Locale> getLocale() async {
    String curentLanguage = await getAppLanguage();
    if (curentLanguage == LanguageType.english.getValue()) {
      return englishLocal;
    } else {
      return burmeseLocal;
    }
  }

  Future<void> setOnBoardingScreenViewed() async {
    _sharedPreferences.setBool(prefsKeyOnboardingScreen, true);
  }

  Future<bool> isOnBoardingScreenViewed() async {
    return _sharedPreferences.getBool(prefsKeyOnboardingScreen) ?? false;
  }

  Future<void> setToken(String token) async {
    _sharedPreferences.setString(prefsKeyToken, token);
  }

  Future<String> getToken() async {
    return _sharedPreferences.getString(prefsKeyToken) ?? '';
  }

  Future<void> setIsUserLoggedIn() async {
    _sharedPreferences.setBool(prefsKeyIsUserLoggedIn, true);
  }

  Future<bool> isUserLoggedIn() async {
    return _sharedPreferences.getBool(prefsKeyIsUserLoggedIn) ?? false;
  }

  Future<void> logout() async {
    _sharedPreferences.remove(prefsKeyIsUserLoggedIn);
  }
}
