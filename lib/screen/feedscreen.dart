import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:untitled/controller/feedscreen_controller.dart';
import 'package:untitled/utills/colors.dart';

class FeedScreen extends GetView<FeedScreenController> {
  const FeedScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.message_outlined))
        ],
        title: SvgPicture.asset(
          "assets/screen1/icon/instaflutter.svg",
          height: 32,
          color: primaryColor,
        ),
        backgroundColor: mobileBackgroundColor,
      ),
      body: StreamBuilder(
        stream: controller.fireStore,
        builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          return ListView.builder(
              itemCount: snapshot.data!.docs.length,
              itemBuilder: (BuildContext context, int index) {
                return _list(snapshot: snapshot, index: index);
              });
        },
      ),
    );
  }

  Widget _list(
      {required AsyncSnapshot<QuerySnapshot> snapshot, required int index}) {
    return Container(
      color: mobileBackgroundColor,
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 16),
            child: Row(
              children: [
                const CircleAvatar(
                  radius: 16,
                  backgroundImage: NetworkImage(
                    "https://m.media-amazon.com/images/W/IMAGERENDERING_521856-T1/images/I/71a37QykgSL._SL1280_.jpg",
                  ),
                ),
                Expanded(
                    child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Text(
                    "${snapshot.data!.docs[index]["username"]}",
                    style: const TextStyle(
                        color: primaryColor, fontWeight: FontWeight.bold),
                  ),
                )),
                IconButton(
                    onPressed: () {
                      Get.defaultDialog(middleText: "delete");
                    },
                    icon: const Icon(Icons.more_vert))
              ],
            ),
          ),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: Image.network(
              "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRprsb0HQcOmZXOdYS1jDITIPb2f-fLKHQzjYIE75J_cg&s",
              fit: BoxFit.cover,
            ),
          ),
          Row(
            children: [
              IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.favorite,
                    color: Colors.red,
                  )),
              IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.comment_bank_rounded,
                  )),
              IconButton(onPressed: () {}, icon: const Icon(Icons.send)),
              Expanded(
                  child: Align(
                alignment: Alignment.bottomRight,
                child: IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.bookmark_border),
                ),
              ))
            ],
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 13),
            child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("21212likes"),
                  Container(
                    padding: const EdgeInsets.only(top: 10),
                    child: RichText(
                      text: const TextSpan(
                        style: TextStyle(color: primaryColor),
                        children: [
                          TextSpan(
                            text: "username",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          TextSpan(
                            text: "hey description",
                          ),
                        ],
                      ),
                    ),
                  ),
                ]),
          ),
          Padding(
            padding: const EdgeInsets.all(5.0),
            child: Text(
              "${snapshot.data!.docs[index]["bio"]}",
              style: const TextStyle(color: secondaryColor),
            ),
          ),
          const Padding(
            padding: EdgeInsets.all(2.0),
            child: Text(
              "22 dec 2022",
              style: TextStyle(color: secondaryColor),
            ),
          ),
        ],
      ),
    );
  }
}
