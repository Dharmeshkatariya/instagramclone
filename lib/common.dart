import 'package:flutter/material.dart';

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

}
