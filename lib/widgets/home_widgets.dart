import 'package:flutter/material.dart';
import 'package:chatvibe/utils.dart';

Widget person_widget(String name, {required VoidCallback? onPressed}) {
  return ElevatedButton(
      style: ButtonStyle(elevation: MaterialStateProperty.resolveWith((states) {
        return 0;
      }), backgroundColor: MaterialStateProperty.resolveWith((states) {
        if (states.contains(MaterialState.hovered))
          return Color.fromARGB(19, 0, 0, 0);
        else
          return Colors.transparent;
      }), padding: MaterialStateProperty.resolveWith((states) {
        return EdgeInsets.symmetric(vertical: 20, horizontal: 20);
      })),
      onPressed: onPressed,
      child: Row(
        children: [
          const CircleAvatar(
            radius: 23,
            child: Icon(
              Icons.person,
              size: 35,
            ),
          ),
          const Padding(padding: EdgeInsets.symmetric(horizontal: 8)),
          Text(
            name,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          )
        ],
      ));
}
