import 'package:alpine_shop_demo/app/app.dart';
import 'package:alpine_shop_demo/app/dependency_injection.dart';
import 'package:alpine_shop_demo/presentation/resources/language_manager.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  await initModule();

  runApp(EasyLocalization(
      supportedLocales: const [englishLocal, burmeseLocal],
      path: assetsPathLocalizations,
      child: Phoenix(child: const MyApp())));
}
