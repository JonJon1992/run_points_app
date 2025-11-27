import 'package:get/get.dart';
import '../../core/app.module.dart';
import 'presentation/bindings/AuthBinding.dart';
import 'presentation/pages/LoginPage.dart';

class AuthModule extends Module {
  @override
  List<GetPage> get routes => [
    GetPage(name: '/', page: () => const LoginPage(), binding: AuthBinding()),
  ];
}
