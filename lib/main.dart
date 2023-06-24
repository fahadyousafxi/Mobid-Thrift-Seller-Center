import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:mobidthrift_seller_center/login/splash_screen.dart';
import 'package:mobidthrift_seller_center/providers/Product_Provider.dart';
import 'package:mobidthrift_seller_center/providers/all_users_provider.dart';
import 'package:mobidthrift_seller_center/providers/app_info_provider.dart';
import 'package:mobidthrift_seller_center/providers/bidding_product_provider.dart';
import 'package:mobidthrift_seller_center/providers/chats_provider.dart';
import 'package:mobidthrift_seller_center/providers/product_accepting_provider.dart';
import 'package:mobidthrift_seller_center/providers/seller_products_provider.dart';
import 'package:mobidthrift_seller_center/providers/seller_provider.dart';
import 'package:mobidthrift_seller_center/providers/sold_product_provider.dart';
import 'package:mobidthrift_seller_center/providers/user_provider.dart';
import 'package:provider/provider.dart';

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
        ChangeNotifierProvider<SellerProductProvider>(
          create: (context) => SellerProductProvider(),
        ),
        ChangeNotifierProvider<ProductAcceptingProvider>(
          create: (context) => ProductAcceptingProvider(),
        ),
        ChangeNotifierProvider<AppInfoProvider>(
          create: (context) => AppInfoProvider(),
        ),
        ChangeNotifierProvider<BiddingProductProvider>(
          create: (context) => BiddingProductProvider(),
        ),
        ChangeNotifierProvider<SoldProductProvider>(
          create: (context) => SoldProductProvider(),
        ),
        ChangeNotifierProvider<ChatsProvider>(
          create: (context) => ChatsProvider(),
        ),
        ChangeNotifierProvider<UserProvider>(
          create: (context) => UserProvider(),
        ),
        ChangeNotifierProvider<ProductsProvider>(
          create: (context) => ProductsProvider(),
        ),
        ChangeNotifierProvider<AllUsersProvider>(
          create: (context) => AllUsersProvider(),
        ),
      ],
      child: MaterialApp(
        title: 'Mobid Thrift',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(primaryColor: Colors.black),
        home: SplashScreen(),
      ),
    );
  }
}
