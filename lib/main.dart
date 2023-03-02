import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'firebase_options.dart';
import 'login/First_Page.dart';

void main() async {

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Mobid Thrift',
      // theme: ThemeData.dark(
      //
      //   // primarySwatch: Colors.blue,
      //
      // ).copyWith(scaffoldBackgroundColor: Colors.white, primaryColor: Colors.white),
      theme: ThemeData(
          primaryColor: Colors.black
      ),
      home: const FirstPage(),
    );
  }
}

