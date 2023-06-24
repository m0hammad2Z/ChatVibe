import 'package:flutter/animation.dart';
import 'package:flutter/material.dart';

const Color mainColor = Color.fromARGB(197, 209, 74, 40);
const Color mainTextColor = Color.fromARGB(255, 0, 0, 0);
const Color sentMsgColor = Color.fromARGB(197, 209, 74, 40);
const Color recivedMsgColor = Color.fromARGB(234, 228, 227, 227);

void ShowSnackBar(BuildContext context, String txt) {
  final snackBar = SnackBar(content: Text(txt));
  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}
