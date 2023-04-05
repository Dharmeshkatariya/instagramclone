import 'package:get/get.dart';
import 'package:untitled/controller/login_screen_controller.dart';

class LoginScreenBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut<LoginScreenController>(() => LoginScreenController());
    // TODO: implement dependencies
  }

}