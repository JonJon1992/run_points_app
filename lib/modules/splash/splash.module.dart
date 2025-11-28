import 'package:get/get.dart';

import '../../core/app.module.dart';
import 'presentation/bindings/SplashBinding.dart';
import 'presentation/pages/SplashPage.dart';

class SplashModule extends Module {
  @override
  List<GetPage> get routes => [
    GetPage(
      name: '/',
      page: () => const SplashPage(),
      binding: SplashBinding(),
    ),
  ];
}
