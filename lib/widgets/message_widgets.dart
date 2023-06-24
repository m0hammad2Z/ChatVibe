import 'package:flutter/material.dart';
import 'package:chatvibe/resources/firebase_auth.dart';
import 'package:chatvibe/utils.dart';

Widget SentMessage(String msg) {
  return Align(
    alignment: Alignment.centerRight,
    child: Card(
      margin: const EdgeInsets.fromLTRB(90, 0, 6, 14),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      elevation: 5,
      color: sentMsgColor,
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Text(
          msg,
          style: const TextStyle(color: Colors.white),
        ),
      ),
    ),
  );
}

Widget RecivedMessage(String msg) {
  return Align(
    alignment: Alignment.centerLeft,
    child: Card(
      margin: const EdgeInsets.fromLTRB(6, 0, 90, 14),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      elevation: 5,
      color: recivedMsgColor,
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Text(msg, style: const TextStyle(color: Colors.black)),
      ),
    ),
  );
}

Widget SayHello(BuildContext context, {required VoidCallback onPressed}) {
  return Container(
    margin: EdgeInsets.only(bottom: MediaQuery.of(context).size.width / 2),
    child: Align(
        alignment: Alignment.center,
        child: ElevatedButton.icon(
            style: ElevatedButton.styleFrom(
                elevation: 0,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16)),
                padding: EdgeInsets.symmetric(horizontal: 28, vertical: 14),
                backgroundColor: Color.fromARGB(115, 64, 92, 219)),
            label: Text(
              "Hello",
              style: TextStyle(fontSize: 20),
            ),
            onPressed: onPressed,
            icon: Icon(
              Icons.waving_hand_rounded,
              color: Colors.amber[500],
            ))),
  );
}
