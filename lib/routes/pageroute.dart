import 'package:get/get.dart';
import 'package:untitled/binding/addpost_binding.dart';
import 'package:untitled/binding/feedscreen_binding.dart';
import 'package:untitled/binding/loginscreen_binding.dart';
import 'package:untitled/binding/mobilescreen_binding.dart';
import 'package:untitled/binding/signupscreen_binding.dart';
import 'package:untitled/screen/add_postscreen.dart';
import 'package:untitled/screen/feedscreen.dart';
import 'package:untitled/screen/login_screen.dart';
import 'package:untitled/screen/mobilescreen.dart';
import 'package:untitled/screen/signup_screen.dart';
import 'name_routes.dart';

class PageRoutes{
  static final pages = [
    GetPage(
      name: NameRoutes.mobileScreen,
      page: ()=>MobileScreen(),
      binding: MobileScreenBinding(),
    ),
    GetPage(
      name: NameRoutes.signUpScreen,
      page: ()=>SignUpScreen(),
      binding: SignUpScreenBinding(),
    ),
    GetPage(
      name: NameRoutes.loginScreen,
      page: ()=>LoginScreen(),
      binding: LoginScreenBinding(),
    ),
    GetPage(
      name: NameRoutes.feedScreen,
      page: ()=>FeedScreen(),
      binding: FeedScreenBinding(),
    ),
    GetPage(
      name: NameRoutes.addPostScreen,
      page: ()=>AddPostScreen(),
      binding: AddPostScreenBinding(),
    ),
  ];
}