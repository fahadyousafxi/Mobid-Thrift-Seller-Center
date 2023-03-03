import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mobidthrift_seller_center/login/seller_varification.dart';
import 'package:mobidthrift_seller_center/login/verify_page.dart';
import 'package:mobidthrift_seller_center/ui/Orders.dart';
import '../../constants/App_texts.dart';
import '../constants/App_widgets.dart';
import '../ui/Trade_In_Page.dart';
import '../utils/utils.dart';
import 'Forgot_password_page.dart';
import 'Signup_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final  _fireStore = FirebaseFirestore.instance.collection('SellerCenterUsers');

  late bool _loading = false;

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _cNICController = TextEditingController();

  var _myFormKey = GlobalKey<FormState>();

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        title: Text(
          "${AppTexts.appName}",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
        ),
      ),
      extendBodyBehindAppBar: true,
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
            child: Padding(
              padding: const EdgeInsets.all(30.0),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Welcome Back',
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22, color: Colors.white),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      'Login to your Account',
                      style: TextStyle(color: Colors.white70),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Form(
                      key: _myFormKey,
                        child: Column(
                      children: [
                        AppWidgets().myTextFormField(
                            hintText: 'Enter Email', labelText: 'Email', controller: _emailController, validator: (String? txt) {
                          bool emailValid = RegExp(r'^.+@[a-zA-Z]+\.{1}[a-zA-Z]+(\.{0,1}[a-zA-Z]+)$').hasMatch(txt!);
                          if (txt == null || txt.isEmpty) {

                            return "Please provide your Email";

                          }
                          if(emailValid){
                            return null;

                          }
                          return "Your Email is Wrong";
                        },),
                        SizedBox(
                          height: 20,
                        ),
                        AppWidgets().myTextFormField(
                            hintText: 'Enter CNIC Number', labelText: 'CNIC Number', controller: _cNICController, validator: (String? txt) {
                          if (txt == null || txt.isEmpty) {
                            return "Please provide your CNIC Number";
                          }

                          return null;
                        },),

                        SizedBox(
                          height: 20,
                        ),
                        AppWidgets().myTextFormField(obscureText: true,
                            hintText: 'Enter Password', labelText: 'Password', controller: _passwordController, validator: (String? txt) {
                          if (txt == null || txt.isEmpty) {
                            return "Please provide Password";
                          } else if (txt.length >= 6) {
                            return null;
                          } else {
                            return "Password must be 6 letters";
                          }
                        },),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            TextButton(
                                onPressed: () {
                                  Navigator.push(context, MaterialPageRoute(builder: (context) => ForgotPasswordPage()));
                                }, child: Text('Forgot Password'))
                          ],
                        ),
                        AppWidgets().myElevatedBTN(
                            onPressed: () {

                              if(_myFormKey.currentState!.validate()) {
                                myLogin();
                              }

                              // Navigator.pushReplacement(
                              //     context,
                              //     MaterialPageRoute(
                              //         builder: (context) => Orders()));
                            },
                            btnText: 'Login'),
                        // AppButton().myElevatedBTN(onPressed: (){}, btnText: 'login With Google'),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('Don’t have an Account?', style: TextStyle(color: Colors.grey.shade300)),
                            TextButton(
                                onPressed: () {
                                  Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => SignupPage()));
                                }, child: Text('SignUp Now'))
                          ],
                        )
                      ],
                    ))
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  myLogin(){
    setState(() {
      _loading = true;
    });

    _firebaseAuth.signInWithEmailAndPassword(
        email: _emailController.text.toString().trim(),
        password: _passwordController.text.toString()).then((value){
      setState(() {
        _loading = false;
      });
      if(_firebaseAuth.currentUser!.emailVerified){
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
                builder: (context) => SellerVerification()));
      } else {
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
                builder: (context) => VerifyPage()));
      }

    }).onError((error, stackTrace){
      Utils.flutterToast(error.toString());
      setState(() {
        _loading = false;
      });
    });




  }

}
