import 'package:flutter/material.dart';
import 'package:mobidthrift_seller_center/ui/Orders.dart';
import '../../constants/App_texts.dart';
import '../constants/App_widgets.dart';
import '../ui/Trade_In_Page.dart';
import 'Forgot_password_page.dart';
import 'Signup_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  TextEditingController _emailController = TextEditingController();

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
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Welcome Back',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    'Login to your Account',
                    style: TextStyle(color: Colors.white38),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Form(
                      child: Column(
                    children: [
                      AppWidgets().myTextFormField(
                          hintText: 'Enter Email', labelText: 'Email', controller: _emailController),
                      SizedBox(
                        height: 20,
                      ),
                      AppWidgets().myTextFormField(
                          hintText: 'Enter Password', labelText: 'Password', controller: _emailController),

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
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Orders()));
                          },
                          btnText: 'Login'),
                      // AppButton().myElevatedBTN(onPressed: (){}, btnText: 'login With Google'),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('Don’t have an Account?'),
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
          )
        ],
      ),
    );
  }
}
