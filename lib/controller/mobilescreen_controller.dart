import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../screen/add_postscreen.dart';
import '../screen/favouritescreen.dart';
import '../screen/feedscreen.dart';
import '../screen/profilescreen.dart';
import '../screen/searchscreen.dart';

class MobileScreenController extends GetxController with StateMixin<  List<Widget>>{
  List<Widget> mList =  [
    FeedScreen(),
    SearchScreen(),
    AddPostScreen(),
    FavoutireScreen(),
    ProfileScreen(),
  ];
  RxInt page = 2.obs;

  navigationTaped(int index) {
    page.value = index;
   update();
  }
@override
  void onInit() {
    // TODO: implement onInit
  change(mList,status:  RxStatus.loading());
  change(mList,status: RxStatus.success());
    super.onInit();
  }
}