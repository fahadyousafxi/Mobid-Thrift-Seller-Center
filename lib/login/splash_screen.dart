import 'package:flutter/material.dart';
import '../Services/splash_service.dart';
import '../constants/App_texts.dart';
import '../constants/App_widgets.dart';
class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {


  SplashService _splashService = SplashService();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _splashService.isLogin(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            width: double.infinity,
            height: double.infinity,
            child: Image(
              image: AssetImage("assets/images/backgroundimage.png"),
              fit: BoxFit.cover,
            ),
          ),
          Center(
            child: Text('Mobid Thrift Seller Center', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),)
          ),
        ],
      ),
    );
  }
}

