import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:run_points_app/modules/auth/auth.module.dart';

class AppModule extends Module {
  @override
  List<Module> subModules = [AuthModule()];
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
