import 'package:get/get.dart';
import 'package:untitled/controller/searchscreen_controller.dart';

class SearchScreenBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut<SearchScreenController>(() => SearchScreenController());
    // TODO: implement dependencies
  }
  
}