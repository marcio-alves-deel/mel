import 'package:get/get.dart';
import 'package:mel/controllers.dart' show AuthController;
import 'package:mel/dependencies.dart' show di;

class SignInBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AuthController>(() => di<AuthController>());
  }
}
