import 'package:get/get.dart';

abstract class Binding extends Bindings {
  void exports();
}

class AppBinding implements Bindings {
  @override
  void dependencies() {}
}
