import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Common {



  static Widget button({
    bool loading = false ,
    Color? color,
    GestureTapCallback? onTap,
    required String text,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        alignment: Alignment.center,
        decoration: ShapeDecoration(
            color: color,
            shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(4))
        )),
        padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 10),
        child: Text(text),
      ),
    );
  }

  static Widget textField(
      {TextEditingController? controller,
      String? text,
      Widget? preIcon,
      Color? hintcolor,
      bool teextVisible = false,
      Color? fillcolor,

      Widget? sufIcon}) {
    return TextFormField(
      controller: controller,
      obscureText: teextVisible,
      decoration: InputDecoration(
        prefixIcon: preIcon,
        suffixIcon: sufIcon,
        hintStyle: TextStyle(color: hintcolor),
        fillColor: fillcolor,
        hintText: text,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
        ),
        filled: true,
        contentPadding: const EdgeInsets.all(14),
      ),
      keyboardType: TextInputType.emailAddress,
    );
  }
// datetime.now  timestamp method
 static String readTimestamp(int timestamp) {
    var now =  DateTime.now();
    var format = TimeOfDayFormat.HH_dot_mm;
    var date =  DateTime.fromMicrosecondsSinceEpoch(timestamp);
    var diff = date.difference(now);
    var time = '';

    if (diff.inSeconds <= 0 || diff.inSeconds > 0 && diff.inMinutes == 0 || diff.inMinutes > 0 && diff.inHours == 0 || diff.inHours > 0 && diff.inDays == 0) {
      time = format.toString(); // Doesn't get called when it should be
    } else {
      time = diff.inDays.toString() + 'DAYS AGO'; // Gets call and it's wrong date
    }

    return time;
  }
}
