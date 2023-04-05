import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untitled/controller/profilescreen_controller.dart';
import 'package:untitled/routes/name_routes.dart';
import 'package:untitled/utills/colors.dart';

class ProfileScreen extends GetView<ProfileScreenController> {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("userprofile"),
        backgroundColor: mobileBackgroundColor,
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        child: Column(
          children: [
            Column(
              children: [
                Row(
                  children: [
                    Column(
                      children: const [
                        CircleAvatar(
                          radius: 41,
                          backgroundColor: Colors.grey,
                          backgroundImage: NetworkImage(
                              "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQO75-ED5ciERVXJgG4Bg-zsXToqvmk4qA2GtB2cBz0fA&usqp=CAU&ec=48600113"),
                        ),
                        Text("username"),
                      ],
                    ),
                    Row(
                      children: [
                        _commonColumn(200, "Follower"),
                        _commonColumn(200, "Follower"),
                        _commonColumn(200, "Follower"),
                      ],
                    ),
                  ],
                ),
                Container(
                  alignment: Alignment.centerLeft,
                  child: const Text("some description"),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    _followButton(
                      onPressed: (){
                        Get.toNamed(NameRoutes.loginScreen);
                      },
                        text: "Edit profile",
                        color: Colors.grey[900],
                        textcolor: primaryColor),
                    _followButton(
                        text: "Share  profile",
                        color: Colors.grey[900],
                        textcolor: primaryColor),
                    Container(
                      padding:
                      const   EdgeInsets.symmetric(horizontal: 5, vertical: 10),
                      color: Colors.grey[900],
                      child: const Icon(Icons.person, color: primaryColor),
                    )
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _followButton(
      {required String text,
      Color? color,
      VoidCallback? onPressed,
      Color? textcolor}) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      padding: const EdgeInsets.symmetric(
        horizontal: 18,
      ),
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(5),
      ),
      child: TextButton(
        onPressed: onPressed,
        child: Text(
          text,
          style: TextStyle(color: textcolor, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }

  Widget _commonColumn(int num, String text) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          num.toString(),
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
        ),
        Text(
          text,
          style: const TextStyle(
              fontWeight: FontWeight.w400, fontSize: 15, color: Colors.grey),
        )
      ],
    );
  }
}
