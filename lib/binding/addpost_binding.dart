import 'package:get/get.dart';
import 'package:untitled/controller/addpost_controller.dart';

class AddPostScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AddPostScreenController>(() => AddPostScreenController());
    // TODO: implement dependencies
  }
}
