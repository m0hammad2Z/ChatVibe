import 'dart:collection';
import 'dart:ffi';

import 'package:chatvibe/resources/firebase_auth.dart';
import 'package:chatvibe/screens/home.dart';
import 'package:chatvibe/widgets/button.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import '../utils.dart';
import '../widgets/message_widgets.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  int count = 0;
  String chatID = "";

  final messageController = TextEditingController();

  final fAuth = FAuth();
  final ref = FirebaseDatabase.instance.ref('chats');

  SendMessage(String msg) async {
    if (chatID == "") {
      await ref.push().set({
        "member1": fAuth.user.uid,
        "member2": currentUserIDInChat,
      });
    }
    await ref
        .child('$chatID/messages')
        .push()
        .set({"msg id": count, "member": fAuth.user.uid, "msg": msg});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(230, 41, 40, 40),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: Text(currentUserNameInChat),
      ),
      body: Column(
        children: [
          Expanded(
            child: FirebaseAnimatedList(
              reverse: true,
              query: ref,
              itemBuilder: (context, snapshot, animation, index) {
                {
                  if ((snapshot.child('member1').value == fAuth.user.uid &&
                          snapshot.child('member2').value ==
                              currentUserIDInChat) ||
                      (snapshot.child('member2').value == fAuth.user.uid &&
                          snapshot.child('member1').value ==
                              currentUserIDInChat)) {
                    chatID = snapshot.key.toString();

                    HashMap<int, Widget> list2 = HashMap();
                    List<Widget> list = [];
                    try {
                      Map<dynamic, dynamic> map = snapshot
                          .child('messages')
                          .value as Map<dynamic, dynamic>;

                      map.forEach(
                        (key, value) {
                          if (map[key]['member'] == fAuth.user.uid) {
                            list2.addEntries({
                              MapEntry(int.parse(map[key]['msg id'].toString()),
                                  SentMessage(map[key]['msg'].toString()))
                            });
                          } else {
                            list2.addEntries({
                              MapEntry(int.parse(map[key]['msg id'].toString()),
                                  RecivedMessage(map[key]['msg'].toString()))
                            });
                          }
                        },
                      );
                      // Map.fromEntries(list2.entries.toList()
                      // ..sort(
                      //   (a, b) => a.value.compareTo(b.value),
                      // ));

                      list2.forEach((key, value) {
                        list.add(value);
                      });

                      count = list2.length;
                    } catch (e) {
                      return const Center(
                        child: Text("Sending..."),
                      );
                    }

                    return Column(children: list);
                  } else {
                    return Text("");
                  }
                }
              },
            ),
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                  child: Container(
                margin: EdgeInsets.all(5),
                child: TextField(
                  style: const TextStyle(
                      color: Color.fromARGB(255, 233, 225, 225)),
                  controller: messageController,
                  decoration: const InputDecoration(
                    contentPadding: EdgeInsets.all(5),
                    filled: true,
                    fillColor: Color.fromARGB(88, 207, 206, 214),
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            width: 1, color: Color.fromARGB(62, 182, 181, 181)),
                        borderRadius: BorderRadius.all(Radius.circular(30))),
                    focusedBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(width: 1, color: Colors.transparent),
                        borderRadius: BorderRadius.all(Radius.circular(30))),
                    hintText: 'Enter a message',
                    hintStyle: TextStyle(
                        color: Color.fromARGB(221, 255, 255, 255),
                        fontSize: 14),
                  ),
                ),
              )),
              SendButton(context, onPressed: () async {
                SendMessage(messageController.text);
                messageController.clear();
              })
            ],
          ),
        ],
      ),
    );
  }
}
