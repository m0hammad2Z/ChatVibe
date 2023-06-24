import 'package:chatvibe/resources/firebase_auth.dart';
import 'package:chatvibe/widgets/button.dart';
import 'package:chatvibe/widgets/home_widgets.dart';
import 'package:chatvibe/utils.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

String currentUserIDInChat = "";
String currentUserNameInChat = "";

class _HomeScreenState extends State<HomeScreen> {
  final fAuth = FAuth();
  final ref = FirebaseDatabase.instance.ref('users');

  final searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(230, 41, 40, 40),
      appBar: AppBar(
          title: const Text("Chat Vibe",
              style: TextStyle(
                  color: mainColor, fontSize: 30, fontWeight: FontWeight.bold)),
          elevation: 0,
          backgroundColor: Colors.transparent,
          actions: [
            LogoutButton(context, onPressed: () {
              fAuth.Logout();
            })
          ]),
      body: Column(
        children: [
          Expanded(
              child: FirebaseAnimatedList(
            query: ref,
            itemBuilder: (BuildContext context, DataSnapshot snapshot,
                Animation<double> animation, int index) {
              String nameStr = snapshot.child('name').value.toString();
              if (snapshot.key != fAuth.user.uid) {
                return person_widget(nameStr, onPressed: () {
                  currentUserIDInChat = snapshot.key.toString();
                  currentUserNameInChat = nameStr;
                  Navigator.pushNamed(context, '/chat');
                });
              } else
                return Text("");
              ;
            },
          ))
        ],
      ),
    );
  }
}
