import 'package:get/get.dart';
import 'package:untitled/controller/feedscreen_controller.dart';

class FeedScreenBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut<FeedScreenController>(() => FeedScreenController());
    // TODO: implement dependencies
  }

}