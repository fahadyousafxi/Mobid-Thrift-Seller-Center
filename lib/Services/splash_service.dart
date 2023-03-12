import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mobidthrift_seller_center/login/seller_varification.dart';

import '../login/First_Page.dart';
import '../login/verify_page.dart';

class SplashService {
  void isLogin(context) {
    final _auth = FirebaseAuth.instance;
    final _user = _auth.currentUser;

    if (_user != null) {
      Timer(const Duration(seconds: 3), () {
        if (_auth.currentUser!.emailVerified) {
          Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                  builder: (context) => const SellerVerification()));
        } else {
          Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (context) => const VerifyPage()));
        }
      });
    } else {
      Timer(
        const Duration(seconds: 3),
        () => Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) => const FirstPage())),
      );
    }
  }
}
