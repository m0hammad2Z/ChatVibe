import 'dart:math';

import 'package:chatvibe/resources/firebase_auth.dart';
import 'package:chatvibe/widgets/button.dart';
import 'package:chatvibe/utils.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final fAuth = FAuth();

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: mainColor,
        body: Align(
          alignment: Alignment.bottomCenter,
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  margin: const EdgeInsets.only(bottom: 150),
                  child: const Text(
                    "ChatVibe",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 40,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(30),
                  decoration: const BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                            color: Color.fromARGB(68, 16, 7, 27),
                            blurRadius: 10,
                            spreadRadius: 3)
                      ],
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(15),
                          topRight: Radius.circular(15)),
                      color: Color.fromARGB(230, 41, 40, 40)),
                  child: Column(
                    children: [
                      const Text(
                        "Welcome",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),
                      const Text(
                        "Login with your account now",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                            fontWeight: FontWeight.normal),
                      ),
                      Container(
                        margin: EdgeInsets.fromLTRB(
                            MediaQuery.of(context).size.width * 0.15,
                            30,
                            MediaQuery.of(context).size.width * 0.15,
                            5),
                        child: TextFormField(
                          style: TextStyle(color: Colors.white),
                          controller: emailController,
                          decoration: const InputDecoration(
                              contentPadding: EdgeInsets.all(10),
                              enabledBorder: OutlineInputBorder(
                                  borderSide:
                                      BorderSide(width: 1, color: mainColor),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(30))),
                              focusedBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(width: 0, color: mainColor),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(30)),
                              ),
                              labelText: "Email",
                              labelStyle: TextStyle(
                                  color: Colors.white24, fontSize: 14),
                              floatingLabelStyle: TextStyle(color: mainColor)),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.fromLTRB(
                            MediaQuery.of(context).size.width * 0.15,
                            5,
                            MediaQuery.of(context).size.width * 0.15,
                            20),
                        child: TextFormField(
                          style: TextStyle(color: Colors.white),
                          controller: passwordController,
                          decoration: const InputDecoration(
                              contentPadding: EdgeInsets.all(10),
                              enabledBorder: OutlineInputBorder(
                                  borderSide:
                                      BorderSide(width: 1, color: mainColor),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(30))),
                              focusedBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(width: 0, color: mainColor),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(30)),
                              ),
                              labelText: "Password",
                              labelStyle: TextStyle(color: Colors.white24),
                              floatingLabelStyle:
                                  TextStyle(color: mainColor, fontSize: 14)),
                          obscureText: true,
                        ),
                      ),
                      Button(context, "Login", onPressed: () async {
                        fAuth.Login(emailController.text,
                            passwordController.text, context);
                      }),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text("Don't have account!",
                              style: TextStyle(color: Colors.white)),
                          TextButton(
                              onPressed: () {
                                Navigator.pushNamed(context, '/signup');
                              },
                              child: const Text("SignUp"))
                        ],
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
