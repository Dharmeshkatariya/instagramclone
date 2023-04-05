import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untitled/controller/mobilescreen_controller.dart';
import 'package:untitled/utills/colors.dart';

class MobileScreen extends GetView<MobileScreenController> {
  MobileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return controller.obx(
      (state) => Scaffold(
        bottomNavigationBar: CupertinoTabBar(
          currentIndex: controller.page.value,
          onTap: (index) => {
            controller.navigationTaped(index),
          },
          backgroundColor: mobileBackgroundColor,
          items: [
            BottomNavigationBarItem(
                icon: Icon(Icons.home,
                    color: controller.page.value == 0
                        ? primaryColor
                        : secondaryColor),
                label: "",
                backgroundColor: primaryColor),
            BottomNavigationBarItem(
                icon: Icon(Icons.search,
                    color: controller.page.value == 1
                        ? primaryColor
                        : secondaryColor),
                label: "",
                backgroundColor: primaryColor),
            BottomNavigationBarItem(
                icon: Icon(Icons.add_circle,
                    color: controller.page.value == 2
                        ? primaryColor
                        : secondaryColor),
                label: "",
                backgroundColor: primaryColor),
            BottomNavigationBarItem(
                icon: Icon(Icons.favorite,
                    color: controller.page.value == 3
                        ? primaryColor
                        : secondaryColor),
                label: "",
                backgroundColor: primaryColor),
            BottomNavigationBarItem(
                icon: Icon(Icons.person,
                    color: controller.page.value == 4
                        ? primaryColor
                        : secondaryColor),
                label: "",
                backgroundColor: primaryColor),
          ],
        ),
        body: Container(
          child: controller.mList[controller.page.value],
        ),
      ),
      onLoading: const Center(child: CircularProgressIndicator()),
    );
  }
}
