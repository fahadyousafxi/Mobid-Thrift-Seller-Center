import 'package:flutter/material.dart';
import '../appbar/My_appbar.dart';

class AboutUs extends StatelessWidget {
  const AboutUs({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppbar().mySimpleAppBar(context, title: 'About Us'),
      body: Center(child: Text('Discribes the information about'),),
    );
  }
}
