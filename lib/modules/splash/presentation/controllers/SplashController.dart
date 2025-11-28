import 'package:get/get.dart';

class SplashController extends GetxController {
  final RxString title = 'dev.quiz_'.obs;

  @override
  void onInit() {
    super.onInit();
    _inicializar();
  }

  Future<void> _inicializar() async {
    await Future.delayed(const Duration(seconds: 2));
    Get.offAllNamed('/home');
  }
}
