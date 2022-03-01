import 'package:alpine_shop_demo/app/app_prefs.dart';
import 'package:alpine_shop_demo/app/dependency_injection.dart';
import 'package:alpine_shop_demo/presentation/resources/constants.dart';
import 'package:alpine_shop_demo/presentation/resources/routes_manager.dart';
import 'package:alpine_shop_demo/presentation/viewmodel/home_viewmodel.dart';
import 'package:alpine_shop_demo/presentation/viewmodel/itemViewModel.dart';
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:provider/provider.dart';

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final _appPreferences = instance<AppPreferences>();

  @override
  void didChangeDependencies() {
    _appPreferences.getLocale().then((local) => context.setLocale(local));
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<HomeViewModel>(
            create: (context) => instance<HomeViewModel>()),
        ChangeNotifierProvider<ItemViewModel>(
            create: (context) => ItemViewModel()),
      ],
      child: MaterialApp(
        localizationsDelegates: context.localizationDelegates,
        supportedLocales: context.supportedLocales,
        locale: context.locale,
        debugShowCheckedModeBanner: false,
        onGenerateRoute: RouteGenerator.getRoute,
        initialRoute: Routes.mainRoute,
        theme: ThemeData(
          scaffoldBackgroundColor: bgColor,
          primarySwatch: Colors.blue,
          fontFamily: "Gordita",
          appBarTheme: const AppBarTheme(
            backgroundColor: Colors.transparent,
            elevation: 0,
          ),
          textTheme: const TextTheme(
            bodyText2: TextStyle(color: Colors.black54),
          ),
        ),
      ),
    );
  }
}
