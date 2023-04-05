import 'dart:async';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:untitled/language/language.dart';
import 'package:untitled/routes/name_routes.dart';
import 'package:untitled/routes/pageroute.dart';
import 'package:untitled/screen/splashscreen.dart';
import 'package:untitled/utills/colors.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    _login();
    return GetMaterialApp(
      getPages: PageRoutes.pages,
      debugShowCheckedModeBanner: false,
      title: 'Instagram Clone',
      translations: Langaugae(),
      locale: const Locale('gu','IN'),
      fallbackLocale: const Locale('en','US'),
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: mobileBackgroundColor,
      ),
      home:const SplashScreen(),
    );
  }

  _login() async {
    var shareP = await SharedPreferences.getInstance();
    bool isLogin = shareP.getBool("login") ?? false;
    Timer(const Duration(seconds: 3), () {
      if (isLogin) {
        Get.offNamed(NameRoutes.mobileScreen);
      } else {
        Get.offNamed(NameRoutes.loginScreen);
      }
    });
  }
}
