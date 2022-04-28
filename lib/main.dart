import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:zoom_clone/resources/auth_method.dart';
import 'package:zoom_clone/screens/homescreen.dart';
import 'package:zoom_clone/screens/login.dart';
import 'package:zoom_clone/screens/videocall.dart';
import 'package:zoom_clone/utils/colors.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Zoom Clone',
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: backgroundColor,
      ),
      routes: {
        // navigate to different sccreen
        '/login': (context) => const Login(),
        '/home': (context) => const Homescreen(),
        '/video-call': (context) => const VideoCall(),
      },
      // home: const Login(),

      //User state.  If user is logged in, go to home screen.  If not, go to login screen.
      home: StreamBuilder(
          stream: AuthMothods().authChanges,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }

            if (snapshot.hasData) {
              return const Homescreen();
            }
            return const Login();
          }),
    );
  }
}
