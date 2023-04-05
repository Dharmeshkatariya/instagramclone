import 'package:get/get.dart';
import 'package:untitled/controller/signup_controller.dart';

class SignUpScreenBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut<SignUpController>(() => SignUpController());
    // TODO: implement dependencies
  }

}