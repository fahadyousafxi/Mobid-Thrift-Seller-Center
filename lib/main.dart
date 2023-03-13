import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:mobidthrift_seller_center/login/splash_screen.dart';
import 'package:mobidthrift_seller_center/providers/seller_provider.dart';
import 'package:provider/provider.dart';
import 'package:mobidthrift_seller_center/ui/Orders.dart';

import 'firebase_options.dart';

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
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<SellerProvider>(
          create: (context) => SellerProvider(),
        ),
      ],
      child: MaterialApp(
        title: 'Mobid Thrift',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(primaryColor: Colors.black),
        home: Orders(),
      ),
    );
  }
}
