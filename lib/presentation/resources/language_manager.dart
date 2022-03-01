import 'package:flutter/material.dart';

enum LanguageType { english, burmese }

const String english = 'en';
const String burmese = 'my';
const String assetsPathLocalizations = 'assets/translations';

const englishLocal = Locale('en', 'US');
const burmeseLocal = Locale('my', 'MM');

extension LanguageTypeExtension on LanguageType {
  String getValue() {
    switch (this) {
      case LanguageType.english:
        return english;
      case LanguageType.burmese:
        return burmese;
    }
  }
}
