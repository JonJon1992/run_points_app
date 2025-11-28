import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:run_points_app/modules/home/home.module.dart';
import 'package:run_points_app/modules/splash/splash.module.dart';

class AppModule extends Module {
  @override
  List<Module> subModules = [SplashModule(), HomeModule()];
}

abstract class Module {
  @protected
  List<Module> get subModules => [];

  @protected
  List<GetPage> get routes => [];

  @protected
  GetPage? routeBuilder(List<GetPage> pages) => null;

  @nonVirtual
  List<GetPage> collectRoutes() {
    final subModuleRoutes = subModules
        .expand((module) => module.collectRoutes())
        .toList();
    final route = routeBuilder(subModuleRoutes);

    return [...routes, if (route != null) route else ...subModuleRoutes];
  }
}
