import 'package:chatvibe/firebase_options.dart';
import 'package:chatvibe/resources/firebase_auth.dart';
import 'package:chatvibe/screens/chat.dart';
import 'package:chatvibe/screens/home.dart';
import 'package:chatvibe/screens/login.dart';
import 'package:chatvibe/utils.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:chatvibe/screens/signup.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ChatVibe',
      routes: {
        '/login': (context) => const LoginScreen(),
        '/signup': (context) => const SignUpScreen(),
        '/home': (context) => const HomeScreen(),
        '/chat': (context) => const ChatScreen(),
      },
      home: StreamBuilder(
          stream: FAuth().authChange,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                  child: CircularProgressIndicator(
                backgroundColor: Colors.white54,
                color: mainColor,
              ));
            } else if (snapshot.hasData) {
              return const HomeScreen();
            }

            return const LoginScreen();
          }),
    );
  }
}
