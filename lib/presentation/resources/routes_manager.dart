import 'package:alpine_shop_demo/presentation/resources/strings_manager.dart';
import 'package:alpine_shop_demo/presentation/view/home/home_screen.dart';
import 'package:flutter/material.dart';

import 'package:easy_localization/easy_localization.dart';

class Routes {
  static const String mainRoute = '/home';
}

class RouteGenerator {
  static Route<dynamic> getRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case Routes.mainRoute:
        return MaterialPageRoute(builder: (_) => const HomeScreen());

      default:
        return unDefinedRoute();
    }
  }

  static Route<dynamic> unDefinedRoute() {
    return MaterialPageRoute(
        builder: (_) => Scaffold(
              appBar: AppBar(
                title: const Text(AppStrings.noRouteFound).tr(),
              ),
              body: Center(child: const Text(AppStrings.noRouteFound).tr()),
            ));
  }
}
