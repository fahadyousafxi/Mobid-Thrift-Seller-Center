import 'package:flutter/material.dart';

import '../../constants/App_colors.dart';
import '../../constants/App_texts.dart';
import 'Login_page.dart';
import 'Signup_page.dart';

class FirstPage extends StatefulWidget {
  const FirstPage({Key? key}) : super(key: key);

  @override
  State<FirstPage> createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        title: Text(
          AppTexts.appName,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
        ),
      ),
      extendBodyBehindAppBar: true,
      body: Stack(
        children: [
          Container(
            width: double.infinity,
            height: double.infinity,
            child: const Image(
              image: AssetImage("assets/images/backgroundimage.png"),
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(30.0),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(
                    height: 33,
                  ),

                  const SizedBox(
                    height: 33,
                  ),
                  // AppWidgets().myElevatedBTN(onPressed: (){
                  //   // Navigator.pushReplacement(
                  //   //     context,
                  //   //     MaterialPageRoute(
                  //   //         builder: (context) => MyHomePage()));
                  // }, btnText: 'Continue without Login'),

                  const SizedBox(
                    height: 5,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const LoginPage()));
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.elevatedButtonColor,
                      minimumSize: const Size(200, 40),
                    ),
                    child: const Text('Login'),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const SignupPage()));
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.elevatedButtonColor,
                      minimumSize: const Size(200, 40),
                    ),
                    child: const Text('SignUp'),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
