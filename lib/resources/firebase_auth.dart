import 'package:firebase_database/firebase_database.dart';
import 'package:chatvibe/utils.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

class FAuth {
  final FirebaseAuth auth = FirebaseAuth.instance;
  final FirebaseDatabase database = FirebaseDatabase.instance;

  Stream<User?> get authChange => auth.authStateChanges();
  User get user => auth.currentUser!;

  Future<dynamic> Signup(String emailAddress, String name, String password,
      BuildContext context) async {
    bool res = false;
    try {
      final credential = await auth.createUserWithEmailAndPassword(
        email: emailAddress,
        password: password,
      );
      res = true;
      await database.ref('users/${user.uid}').set({"name": name});
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        ShowSnackBar(context, "The password provided is too weak.");
      } else if (e.code == 'email-already-in-use') {
        ShowSnackBar(context, "The account already exists for that email.");
      }
    } catch (e) {
      ShowSnackBar(context, e.toString());
    }
    return res;
  }

  Future Login(
      String emailAddress, String password, BuildContext context) async {
    try {
      final credential = await auth.signInWithEmailAndPassword(
          email: emailAddress, password: password);
    } on FirebaseAuthException catch (e) {
      ShowSnackBar(context, e.code);
      if (e.code == 'user-not-found') {
        ShowSnackBar(context, 'No user found for that email.');
      } else if (e.code == 'wrong-password') {
        ShowSnackBar(context, 'Wrong password provided for that user.');
      }
    }
  }

  Future Logout() async {
    await FirebaseAuth.instance.signOut();
  }
}
