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
                CircleAvatar(
                  radius: 16,
                  backgroundImage: NetworkImage(
                    "${snapshot.data!.docs[index]["postUrl"]}",
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
                      Get.defaultDialog(middleText: "delete",onConfirm: (){

                      });
                    },
                    icon: const Icon(Icons.more_vert))
              ],
            ),
          ),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: Image.network(
              "${snapshot.data!.docs[index]["postUrl"]}",
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
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        "${snapshot.data!.docs[index]["username"]}",
                        style: const TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: primaryColor),
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      Text(
                        "${snapshot.data!.docs[index]["description"]}",
                        style: const TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: primaryColor),
                      ),
                    ],
                  )
                ]),
          ),
          Padding(
            padding: const EdgeInsets.all(5.0),
            child: Text(
              "${snapshot.data!.docs[index]["description"]}",
              style: const TextStyle(color: secondaryColor),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(2.0),
            child: Text(
              "${snapshot.data!.docs[index]["description"]}",
              style: const TextStyle(color: secondaryColor),
            ),
          ),
        ],
      ),
    );
  }
}
