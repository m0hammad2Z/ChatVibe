import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:chatvibe/resources/firebase_auth.dart';
import 'package:chatvibe/utils.dart';

Widget Button(BuildContext context, String txt,
    {required VoidCallback? onPressed}) {
  return ElevatedButton(
    onPressed: onPressed,
    style: ElevatedButton.styleFrom(
        padding: EdgeInsets.symmetric(vertical: 15, horizontal: 50),
        backgroundColor: mainColor,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30))),
    child: Text(txt, style: const TextStyle(color: Colors.white)),
  );
}

Widget LogoutButton(BuildContext context, {required VoidCallback? onPressed}) {
  return IconButton(
      onPressed: onPressed,
      icon: Icon(
        Icons.logout,
        color: Colors.white,
      ));
}

Widget SendButton(BuildContext context, {required VoidCallback? onPressed}) {
  return IconButton(
      onPressed: onPressed,
      icon: Icon(
        Icons.send,
        color: mainColor,
      ));
}
