import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mobidthrift_seller_center/constants/App_styles.dart';
import 'package:mobidthrift_seller_center/login/verify_page.dart';
import '../../constants/App_texts.dart';
import '../constants/App_widgets.dart';
import '../utils/utils.dart';
import 'Login_page.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({Key? key}) : super(key: key);

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {


  FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final  _fireStore = FirebaseFirestore.instance.collection('SellerCenterUsers');
  late bool _loading = false;
  var _formKey = GlobalKey<FormState>();

  TextEditingController _nameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _phoneController = TextEditingController();
  TextEditingController _shopeNumberController = TextEditingController();
  TextEditingController _plazaNameController = TextEditingController();
  TextEditingController _addressController = TextEditingController();
  TextEditingController _cNICController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

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
          Padding(
            padding: const EdgeInsets.all(30.0),
            child: Center(
              child: Form(
                key: _formKey,
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 100,
                      ),
                      Text('Create New Account',
                          style: TextStyle(color: Colors.grey.shade300)),
                      Text('Fill the form to continue',
                          style: TextStyle(color: Colors.grey.shade300)),

                      SizedBox(
                        height: 20,
                      ),
                      AppWidgets().myTextFormField(
                        hintText: 'Enter your Full Name',
                        labelText: 'Full Name',
                        controller: _nameController,
                        validator: (String? txt) {
                          if (txt == null || txt.isEmpty) {
                            return "Please provide your name";
                          }

                          return null;
                        },
                      ),
                      SizedBox(
                        height: 10,
                      ),

                      AppWidgets().myTextFormField(
                        hintText: 'Enter your Email',
                        labelText: 'Email',
                        controller: _emailController,
                        validator: (String? txt) {
                          bool emailValid = RegExp(r'^.+@[a-zA-Z]+\.{1}[a-zA-Z]+(\.{0,1}[a-zA-Z]+)$').hasMatch(txt!);
                          if (txt == null || txt.isEmpty) {

                            return "Please provide your Email";

                          }
                          if(emailValid){
                            return null;

                          }
                          return "Your Email is Wrong";
                        },
                      ),
                      SizedBox(
                        height: 10,
                      ),

                      AppWidgets().myTextFormField(
                        hintText: 'Enter your Phone Number',
                        labelText: 'Phone Number',
                        controller: _phoneController,
                        validator: (String? txt) {
                          if (txt == null || txt.isEmpty) {
                            return "Please provide your phone number";
                          }

                          return null;
                        },
                      ),
                      SizedBox(
                        height: 10,
                      ),

                      AppWidgets().myTextFormField(
                        hintText: 'Enter your Shop Number',
                        labelText: 'Shop Number',
                        controller: _shopeNumberController,
                        validator: (String? txt) {
                          if (txt == null || txt.isEmpty) {
                            return "Please provide your shop number";
                          }

                          return null;
                        },
                      ),
                      SizedBox(
                        height: 10,
                      ),

                      AppWidgets().myTextFormField(
                        hintText: 'Enter your Plaza/Tower Name',
                        labelText: 'Plaza/Tower Name',
                        controller: _plazaNameController,
                        validator: (String? txt) {
                          if (txt == null || txt.isEmpty) {
                            return "Please provide your Plaza/Tower Name";
                          }

                          return null;
                        },
                      ),
                      SizedBox(
                        height: 10,
                      ),

                      AppWidgets().myTextFormField(
                        hintText: 'Enter your Address',
                        labelText: 'Address',
                        controller: _addressController,
                        validator: (String? txt) {
                          if (txt == null || txt.isEmpty) {
                            return "Please provide your Address";
                          }

                          return null;
                        },
                      ),
                      SizedBox(
                        height: 10,
                      ),

                      AppWidgets().myTextFormField(
                        hintText: 'Enter your CNIC Number',
                        labelText: 'CNIC',
                        controller: _cNICController,
                        validator: (String? txt) {
                          if (txt == null || txt.isEmpty) {
                            return "Please provide your CNIC Number";
                          }

                          return null;
                        },
                      ),
                      SizedBox(
                        height: 15,
                      ),

                      Container(
                          child: Column(
                        children: [
                          Text(
                            'Upload The Shop Images',
                            style: TextStyle(color: Colors.white),
                          ),
                          SizedBox(
                            height: 2,
                          ),
                          IconButton(
                            splashColor: Colors.white,
                            highlightColor: Colors.blue,
                            splashRadius: 22,
                            onPressed: () {},
                            icon: Icon(
                              Icons.add_a_photo_outlined,
                              color: Colors.white,
                            ),
                          )
                        ],
                      )),
                      SizedBox(
                        height: 15,
                      ),

                      AppWidgets().myTextFormField(
                        obscureText: true,
                        hintText: 'Enter your Password',
                        labelText: 'Password',
                        controller: _passwordController,
                        validator: (String? txt) {
                          if (txt == null || txt.isEmpty) {
                            return "Please provide Password";
                          } else if (txt.length > 6) {
                            return null;
                          } else {
                            return "Password must be 6 letters";
                          }
                        },
                      ),
                      SizedBox(
                        height: 15,
                      ),

                      // AppWidgets().myTextFormField(hintText: 'Confirm Password', labelText: 'Confirm Password'),
                      // SizedBox(height: 15,),

                      AppWidgets().myElevatedBTN(
                          onPressed: () {

                            if(_formKey.currentState!.validate()){
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => LoginPage()));}
                          },
                          btnText: "SignUp"),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Already have an Account?',
                            style: TextStyle(color: Colors.grey.shade300),
                          ),
                          TextButton(
                              onPressed: () {
                                Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => LoginPage()));
                              },
                              child: Text('LogIn Now'))
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  //******************************************//
  // ************* Sign up function
  //******************************************//
  mySignUp() {
    setState(() {
      _loading = true;
    });
    _firebaseAuth.createUserWithEmailAndPassword(
        email: _emailController.text.toString().trim(),
        password: _passwordController.text.toString()).then((value){
      setState(() {
        _loading = false;
      });

      _fireStore.doc(_firebaseAuth.currentUser?.uid.toString()).set({
        'Uid' : _firebaseAuth.currentUser?.uid.toString(),
        'Name' : _nameController.text.trim(),
        'Email' : _emailController.text.trim(),
        'Phone_Number' : _phoneController.text.trim(),
        'Shop_Number' : _shopeNumberController.text.trim(),
        'Plaza_Name' : _plazaNameController.text.trim(),
        'Address' : _addressController.text.trim(),
        'CNIC_Number' : _cNICController.text.trim(),
        'Verification' : false,
        'Profile_Image' : "",
        'Shop_Image1' : "",


      });
      // _firebaseAuth.currentUser?.sendEmailVerification();

      // _firebaseAuth.currentUser?.emailVerified;

      // _firebaseAuth.sendSignInLinkToEmail(email: _emailController.text.toString().trim(), actionCodeSettings: ActionCodeSettings(
      //     url: "https://example.page.link/cYk9",
      //     androidPackageName: "com.example.app",
      //     iOSBundleId: "com.example.app",
      //     handleCodeInApp: true,
      //     androidMinimumVersion: "16",
      //     androidInstallApp: true),);

      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
              builder: (context) => VerifyPage()));
    }).onError((error, stackTrace){
      Utils.flutterToast(error.toString());
      setState(() {
        _loading = false;
      });
    });

  }


}
