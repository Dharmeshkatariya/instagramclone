import 'package:get/get.dart';
import 'package:untitled/controller/addpost_controller.dart';
import 'package:untitled/controller/feedscreen_controller.dart';
import 'package:untitled/controller/mobilescreen_controller.dart';
import 'package:untitled/controller/profilescreen_controller.dart';


class MobileScreenBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut<MobileScreenController>(() => MobileScreenController());
    Get.lazyPut<FeedScreenController>(() => FeedScreenController());
    Get.lazyPut<AddPostScreenController>(() => AddPostScreenController());
    Get.lazyPut<ProfileScreenController>(() => ProfileScreenController());

    // TODO: implement dependencies
  }

}