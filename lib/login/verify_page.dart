import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../constants/App_widgets.dart';
import 'First_Page.dart';
import 'Login_page.dart';

class VerifyPage extends StatefulWidget {
  const VerifyPage({Key? key}) : super(key: key);

  @override
  State<VerifyPage> createState() => _VerifyPageState();
}

class _VerifyPageState extends State<VerifyPage> {
  final _auth = FirebaseAuth.instance;
  User? user;
  Timer? timer;

  @override
  void initState() {
    user = _auth.currentUser;
    user!.sendEmailVerification();

    timer = Timer.periodic(const Duration(seconds: 3), (timer) {
      checkEmailVerified();
    });

    super.initState();
  }

  @override
  void dispose() {
    timer!.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
            image: DecorationImage(
          image: AssetImage("assets/images/backgroundimage.png"),
          fit: BoxFit.cover,
        )),
        child: Padding(
          padding: const EdgeInsets.all(50.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const CircularProgressIndicator(
                strokeWidth: 5,
              ),
              const SizedBox(
                height: 22,
              ),
              const Text(
                'An Email has been sent to ',
                style: TextStyle(color: Colors.white70, fontSize: 20),
              ),
              const SizedBox(
                height: 5,
              ),
              Text(
                '${_auth.currentUser!.email}',
                style: const TextStyle(color: Colors.white70, fontSize: 20),
              ),
              const SizedBox(
                height: 5,
              ),
              const Text(
                'please verify it',
                style: TextStyle(color: Colors.white70, fontSize: 20),
              ),
              const SizedBox(
                height: 60,
              ),
              AppWidgets().myElevatedBTN(
                  onPressed: () {
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const FirstPage()));
                  },
                  btnText: 'Back')
            ],
          ),
        ),
      ),
    );
  }

  Future<void> checkEmailVerified() async {
    user = _auth.currentUser!;
    await user!.reload();
    if (user!.emailVerified) {
      timer!.cancel();
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => const LoginPage()));
    }
  }
}
