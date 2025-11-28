import 'package:get/get.dart';

import '../../core/app.module.dart';
import 'presentation/bindings/HomeBinding.dart';
import 'presentation/bindings/QuizBinding.dart';
import 'presentation/pages/HomePage.dart';
import 'presentation/pages/QuizPage.dart';

class HomeModule extends Module {
  @override
  List<GetPage> get routes => [
    GetPage(
      name: '/home',
      page: () => const HomePage(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: '/quiz',
      page: () => const QuizPage(),
      binding: QuizBinding(),
    ),
  ];
}
