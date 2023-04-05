import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:untitled/utills/colors.dart';

class SplashScreen extends GetView{
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          color: mobileBackgroundColor,
          child: SvgPicture.asset(
            "assets/screen1/icon/instaflutter.svg",
            height: 60,
            color: primaryColor,
          ),
        ),
      ),

    );
  }
}
