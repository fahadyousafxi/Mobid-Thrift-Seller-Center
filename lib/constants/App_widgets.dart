import 'package:flutter/material.dart';

import '../ui/Product_page.dart';

class AppWidgets {
  /// My Elevated Button
  Widget myElevatedBTN(
      {required VoidCallback? onPressed,
      required var btnText,
      final bool loading = false,
      Color btnColor = Colors.black,
      var btnWith = 200.0,
      var btnHeight = 40.0}) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: btnColor,
        minimumSize: Size(btnWith, btnHeight),
      ),
      child: loading == true
          ? const CircularProgressIndicator(
              strokeWidth: 3,
              color: Colors.white,
            )
          : Text(btnText),
    );
  }

  /// My Text Form Field
  Widget myTextFormFieldOld(
      {required var hintText,
      required var labelText,
      Color textColor = Colors.white,
      Color enBorderSideColor = Colors.white12,
      Color borderSideColor = Colors.red,
      var enBorderRadius = 20.0,
      var borderRadius = 20.0,
      Color fillColor = Colors.white12,
      Color hintColor = Colors.white38,
      Color labelColor = Colors.white70}) {
    return TextFormField(
      style: TextStyle(color: textColor),
      decoration: InputDecoration(
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: enBorderSideColor, width: 2.0),
          borderRadius: BorderRadius.circular(enBorderRadius),
        ),
        fillColor: fillColor,
        filled: true,
        hintText: hintText,
        hintStyle: TextStyle(color: hintColor),
        label: Text(labelText),
        labelStyle: new TextStyle(color: labelColor),
        border: OutlineInputBorder(
          borderSide: BorderSide(color: borderSideColor, width: 2.0),
          borderRadius: BorderRadius.circular(borderRadius),
        ),
      ),
    );
  }

  /// My Text Form Field 2
  Widget myTextFormField(
      {required var hintText,
      required var labelText,
      required TextEditingController controller,
      TextInputType myType = TextInputType.text,
      String? Function(String?)? validator,
      bool obscureText = false,
      Color textColor = Colors.white,
      Color enBorderSideColor = Colors.white12,
      Color borderSideColor = Colors.red,
      var enBorderRadius = 20.0,
      var borderRadius = 20.0,
      Color fillColor = Colors.white12,
      Color hintColor = Colors.white38,
      Color labelColor = Colors.white70}) {
    return TextFormField(
      obscureText: obscureText,
      controller: controller,
      keyboardType: myType,
      validator: validator,
      style: TextStyle(color: textColor),
      decoration: InputDecoration(
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: enBorderSideColor, width: 2.0),
          borderRadius: BorderRadius.circular(enBorderRadius),
        ),
        fillColor: fillColor,
        filled: true,
        hintText: hintText,
        hintStyle: TextStyle(color: hintColor),
        label: Text(labelText),
        labelStyle: new TextStyle(color: labelColor),
        border: OutlineInputBorder(
          borderSide: BorderSide(color: borderSideColor, width: 2.0),
          borderRadius: BorderRadius.circular(borderRadius),
        ),
      ),
    );
  }

  /// My Text Form Field
  Widget myTextField(
      {required var hintText,
      required var labelText,
      Color textColor = Colors.white,
      Color enBorderSideColor = Colors.white12,
      Color borderSideColor = Colors.red,
      var enBorderRadius = 20.0,
      var borderRadius = 20.0,
      Color fillColor = Colors.white12,
      Color hintColor = Colors.white38,
      Color labelColor = Colors.white70}) {
    return TextField(
      style: TextStyle(color: textColor),
      decoration: InputDecoration(
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: enBorderSideColor, width: 2.0),
          borderRadius: BorderRadius.circular(enBorderRadius),
        ),
        fillColor: fillColor,
        filled: true,
        hintText: hintText,
        hintStyle: TextStyle(color: hintColor),
        label: Text(labelText),
        labelStyle: new TextStyle(color: labelColor),
        border: OutlineInputBorder(
          borderSide: BorderSide(color: borderSideColor, width: 2.0),
          borderRadius: BorderRadius.circular(borderRadius),
        ),
      ),
    );
  }

  /// My Add Banner Container
  Widget myAddBannerContainer({required var height}) {
    return Container(
      margin: const EdgeInsets.only(left: 0, bottom: 0, right: 0),
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(20)),
        border: Border.all(
          color: Colors.black,
        ),
        color: Colors.white,
      ),
      height: height,
      child: const Image(
        // The Data will be loaded from firebse
        image: AssetImage("assets/images/adbanner.png"),
        // fit: BoxFit.cover,
      ),
    );
  }

  /// Home Screen Category row
  Widget categoryRow(
      {required var categoryText,
      required var textButtonText,
      required var onPressed}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          categoryText,
          style: const TextStyle(
              color: Colors.black, fontSize: 16, fontWeight: FontWeight.bold),
        ),
        TextButton(
            onPressed: onPressed,
            child: Text(
              textButtonText,
              style: const TextStyle(fontSize: 16),
            )),
      ],
    );
  }

  /// My Texts
  Widget myHeading1Text(String txt) {
    return Text(
      txt,
      style: const TextStyle(
          fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
    );
  }

  Widget myHeading2Text(String txt, {Color color = Colors.black}) {
    return Text(
      txt,
      style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: color),
    );
  }

  Widget myNormalText(String txt) {
    return Text(
      txt,
      style: const TextStyle(
          fontSize: 12, fontWeight: FontWeight.normal, color: Colors.black),
    );
  }

  /// My List view of Static data
  Widget myList(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      scrollDirection: Axis.horizontal,
      children: [
        Card(
          clipBehavior: Clip.antiAlias,
          elevation: 4,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(11.0),
          ),
          child: GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const ProductPage()));
              },
              child: Padding(
                padding: const EdgeInsets.all(5.0),
                child: Column(
                  children: const [
                    SizedBox(
                      height: 112,
                      child: Image(
                        // The Data will be loaded from firebse
                        image: AssetImage("assets/images/phone.png"),
                        // fit: BoxFit.cover,
                      ),
                    ),
                    Text('Product name'),
                    Text('First line of discription'),
                    Text('Rs.400  is current bid '),
                    Text('1 Day time left '),
                  ],
                ),
              )),
        ),

        const SizedBox(
          width: 10,
        ),

        Card(
          clipBehavior: Clip.antiAlias,
          elevation: 4,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(11.0),
          ),
          child: GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const ProductPage()));
              },
              child: Padding(
                padding: const EdgeInsets.all(5.0),
                child: Column(
                  children: const [
                    SizedBox(
                      height: 112,
                      child: Image(
                        // The Data will be loaded from firebse
                        image: AssetImage("assets/images/phone.png"),
                        // fit: BoxFit.cover,
                      ),
                    ),
                    Text('Iphone 14'),
                    Text('First line of discription'),
                    Text('Rs.900 is current bid '),
                    Text('2 Day time left '),
                  ],
                ),
              )),
        ),

        const SizedBox(
          width: 10,
        ),

        Card(
          clipBehavior: Clip.antiAlias,
          elevation: 4,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(11.0),
          ),
          child: GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const ProductPage()));
              },
              child: Padding(
                padding: const EdgeInsets.all(5.0),
                child: Column(
                  children: const [
                    SizedBox(
                      height: 112,
                      child: Image(
                        // The Data will be loaded from firebse
                        image: AssetImage("assets/images/phone.png"),
                        // fit: BoxFit.cover,
                      ),
                    ),
                    Text('Iphone 14 Pro Max'),
                    Text('First line of discription'),
                    Text('Rs.1000 is current bid '),
                    Text('1 Day time left '),
                  ],
                ),
              )),
        ),
        // Container(
        //   padding: EdgeInsets.all(5.0),
        //   margin: EdgeInsets.only(left: 0, bottom: 0, right: 0),
        //   decoration: BoxDecoration(
        //     borderRadius: BorderRadius.all(Radius.circular(20)),
        //     border: Border.all(
        //       color: Colors.black,
        //     ),
        //     color: Colors.white,
        //   ),
        //   height: 22,
        //   child: Image(
        //     // The Data will be loaded from firebse
        //     image: AssetImage("assets/images/phone.png"),
        //     fit: BoxFit.cover,
        //   ),
        // ),
        // SizedBox(
        //   width: 10,
        // ),
        // Container(
        //   padding: EdgeInsets.all(5.0),
        //   margin: EdgeInsets.only(left: 0, bottom: 0, right: 0),
        //   decoration: BoxDecoration(
        //     borderRadius: BorderRadius.all(Radius.circular(20)),
        //     border: Border.all(
        //       color: Colors.black,
        //     ),
        //     color: Colors.white,
        //   ),
        //   height: 222,
        //   child: Image(
        //     // The Data will be loaded from firebse
        //     image: AssetImage("assets/images/phone.png"),
        //     fit: BoxFit.cover,
        //   ),
        // ),
      ],
    );
  }
}
