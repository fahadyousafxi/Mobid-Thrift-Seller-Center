import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mobidthrift_seller_center/login/seller_varification.dart';
import 'package:mobidthrift_seller_center/login/verify_page.dart';
import 'package:ndialog/ndialog.dart';

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
  final _fireStore = FirebaseFirestore.instance.collection('SellerCenterUsers');
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

  bool buttonEnable = false;

  bool shopImage = false;
  bool cNICImage1 = false;
  bool cNICImage2 = false;

  String? downloadImageUrl;
  String? downloadImageUrl1;
  String? downloadImageUrl2;
  File? pickedImage;
  File? pickedImage1;
  File? pickedImage2;
  bool showLocalImage = false;

  //******************************************//
  // ************* Shop Image
  //******************************************//

  pickImageFrom(ImageSource fromGalleryOrCamera) async {
    XFile? file = await ImagePicker()
        .pickImage(source: fromGalleryOrCamera, imageQuality: 80);
    if (file == null) {
      return;
    }

    pickedImage = File(file.path);
    showLocalImage = true;
    setState(() {});
    ProgressDialog progressDialog = ProgressDialog(
      context,
      title: const Text('Uploading !!!'),
      message: const Text('Please wait'),
    );
    progressDialog.show();
    try {
      var fileName = DateTime.now().microsecondsSinceEpoch.toString() + '.jpg';
      UploadTask uploadTask = FirebaseStorage.instance
          .ref()
          .child('Seller_verification_images')
          .child(fileName)
          .putFile(pickedImage!);
      TaskSnapshot snapshot = await uploadTask;
      downloadImageUrl = await snapshot.ref.getDownloadURL();
      print(downloadImageUrl);
      // _fireStore.collection(collectionPath).doc(_firebaseAuth.currentUser?.uid.toString()).update({
      //   'Profile_Image' : profileImageUrl,
      // });
      progressDialog.dismiss();
      Utils.flutterToast(' Shop Image Uploaded ');
      setState(() {
        shopImage = true;
      });
    } catch (e) {
      progressDialog.dismiss();
      print(e.toString());
      Utils.flutterToast(e.toString());
    }
  }

  //******************************************//
  // ************* CNIC 2
  //******************************************//

  cNIC2ImageFrom(ImageSource fromGalleryOrCamera) async {
    XFile? file = await ImagePicker()
        .pickImage(source: fromGalleryOrCamera, imageQuality: 80);
    if (file == null) {
      return;
    }

    pickedImage2 = File(file.path);
    showLocalImage = true;
    setState(() {});
    ProgressDialog progressDialog = ProgressDialog(
      context,
      title: const Text('Uploading !!!'),
      message: const Text('Please wait'),
    );
    progressDialog.show();
    try {
      var fileName = DateTime.now().microsecondsSinceEpoch.toString() + '.jpg';
      UploadTask uploadTask = FirebaseStorage.instance
          .ref()
          .child('Seller_verification_images')
          .child(fileName)
          .putFile(pickedImage2!);
      TaskSnapshot snapshot = await uploadTask;
      downloadImageUrl2 = await snapshot.ref.getDownloadURL();
      print(downloadImageUrl2);
      // _fireStore.collection(collectionPath).doc(_firebaseAuth.currentUser?.uid.toString()).update({
      //   'Profile_Image' : profileImageUrl,
      // });
      progressDialog.dismiss();
      Utils.flutterToast(' CNIC Image 1 Uploaded ');
      setState(() {
        cNICImage2 = true;
      });
    } catch (e) {
      progressDialog.dismiss();
      print(e.toString());
      Utils.flutterToast(e.toString());
    }
  }

  //******************************************//
  // ************* CNIC 1
  //******************************************//

  cNIC1ImageFrom(ImageSource fromGalleryOrCamera) async {
    XFile? file = await ImagePicker()
        .pickImage(source: fromGalleryOrCamera, imageQuality: 80);
    if (file == null) {
      return;
    }

    pickedImage1 = File(file.path);
    showLocalImage = true;
    setState(() {});
    ProgressDialog progressDialog = ProgressDialog(
      context,
      title: const Text('Uploading !!!'),
      message: const Text('Please wait'),
    );
    progressDialog.show();
    try {
      var fileName = DateTime.now().microsecondsSinceEpoch.toString() + '.jpg';
      UploadTask uploadTask = FirebaseStorage.instance
          .ref()
          .child('Seller_verification_images')
          .child(fileName)
          .putFile(pickedImage1!);
      TaskSnapshot snapshot = await uploadTask;
      downloadImageUrl1 = await snapshot.ref.getDownloadURL();
      print(downloadImageUrl1);
      // _fireStore.collection(collectionPath).doc(_firebaseAuth.currentUser?.uid.toString()).update({
      //   'Profile_Image' : profileImageUrl,
      // });
      progressDialog.dismiss();
      Utils.flutterToast(' CNIC Image 2 Uploaded ');
      setState(() {
        cNICImage1 = true;
      });
    } catch (e) {
      progressDialog.dismiss();
      print(e.toString());
      Utils.flutterToast(e.toString());
    }
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

                      Container(
                          child: Column(
                        children: [
                          Text(
                            'Upload The Shop Image',
                            style: TextStyle(color: Colors.white),
                          ),
                          SizedBox(
                            height: 2,
                          ),
                          Container(
                            height: shopImage == false ? 30 : 70,
                            decoration: BoxDecoration(
                                image: shopImage == false
                                    ? DecorationImage(
                                        scale: 33,
                                        image: AssetImage(
                                          'assets/images/blank.png',
                                        ))
                                    : DecorationImage(
                                        scale: 7,
                                        image: Image.file(pickedImage!).image)),
                            child: IconButton(
                              splashColor: Colors.white,
                              highlightColor: Colors.blue,
                              splashRadius: 22,
                              onPressed: () {
                                bottomSheet(context, functionNumber: 1);
                              },
                              icon: Icon(
                                Icons.add_a_photo_outlined,
                                color: Colors.white,
                              ),
                            ),
                          )
                        ],
                      )),
                      SizedBox(
                        height: 15,
                      ),

                      Container(
                          child: Column(
                        children: [
                          Text(
                            'Upload your CNIC Images',
                            style: TextStyle(color: Colors.white),
                          ),
                          SizedBox(
                            height: 2,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                height: cNICImage2 == false ? 30 : 70,
                                decoration: BoxDecoration(
                                    image: cNICImage2 == false
                                        ? DecorationImage(
                                            scale: 33,
                                            image: AssetImage(
                                              'assets/images/blank.png',
                                            ))
                                        : DecorationImage(
                                            scale: 7,
                                            image: Image.file(pickedImage2!)
                                                .image)),
                                child: IconButton(
                                  splashColor: Colors.white,
                                  highlightColor: Colors.blue,
                                  splashRadius: 22,
                                  onPressed: () {
                                    bottomSheet(context, functionNumber: 2);
                                  },
                                  icon: Icon(
                                    Icons.add_a_photo_outlined,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                              Container(
                                height: cNICImage1 == false ? 30 : 70,
                                decoration: BoxDecoration(
                                    image: cNICImage1 == false
                                        ? DecorationImage(
                                            scale: 33,
                                            image: AssetImage(
                                              'assets/images/blank.png',
                                            ))
                                        : DecorationImage(
                                            scale: 7,
                                            image: Image.file(pickedImage1!)
                                                .image)),
                                child: IconButton(
                                  splashColor: Colors.white,
                                  highlightColor: Colors.blue,
                                  splashRadius: 22,
                                  onPressed: () {
                                    bottomSheet(context, functionNumber: 3);
                                  },
                                  icon: Icon(
                                    Icons.add_a_photo_outlined,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ],
                          )
                        ],
                      )),
                      SizedBox(
                        height: 15,
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
                          bool emailValid = RegExp(
                                  r'^.+@[a-zA-Z]+\.{1}[a-zA-Z]+(\.{0,1}[a-zA-Z]+)$')
                              .hasMatch(txt!);
                          if (txt == null || txt.isEmpty) {
                            return "Please provide your Email";
                          }
                          if (emailValid) {
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
                        height: 10,
                      ),

                      AppWidgets().myTextFormField(
                        obscureText: true,
                        hintText: 'Enter your Password',
                        labelText: 'Password',
                        controller: _passwordController,
                        validator: (String? txt) {
                          if (txt == null || txt.isEmpty) {
                            return "Please provide Password";
                          } else if (txt.length >= 6) {
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
                            if (_formKey.currentState!.validate()) {
                              if (cNICImage2 == true &&
                                  shopImage == true &&
                                  cNICImage1 == true) {
                                mySignUp();
                              } else {
                                Utils.flutterToast(
                                    'Upload Images Or wait for it');
                              }

                              // Navigator.pushReplacement(
                              //     context,
                              //     MaterialPageRoute(
                              //         builder: (context) => LoginPage()));
                            }
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
  // ************* bottom Sheet
  //******************************************//

  /// bottom Sheet
  Future bottomSheet(context, {required int functionNumber}) {
    return showModalBottomSheet(
        context: context,
        builder: (context) {
          return SafeArea(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                ListTile(
                  leading: const Icon(Icons.camera_alt),
                  title: const Text('With Camera'),
                  onTap: () {
                    if (functionNumber == 1) {
                      pickImageFrom(ImageSource.camera);
                    } else if (functionNumber == 2) {
                      cNIC2ImageFrom(ImageSource.camera);
                    } else {
                      cNIC1ImageFrom(ImageSource.camera);
                    }

                    Navigator.pop(context);
                  },
                ),
                ListTile(
                  leading: const Icon(Icons.storage),
                  title: const Text('From Gallery'),
                  onTap: () {
                    if (functionNumber == 1) {
                      pickImageFrom(ImageSource.gallery);
                    } else if (functionNumber == 2) {
                      cNIC2ImageFrom(ImageSource.gallery);
                    } else {
                      cNIC1ImageFrom(ImageSource.gallery);
                    }

                    Navigator.pop(context);
                  },
                ),
              ],
            ),
          );
        });
  }

  //******************************************//
  // ************* Sign up function
  //******************************************//
  mySignUp() {
    setState(() {
      _loading = true;
    });
    _firebaseAuth
        .createUserWithEmailAndPassword(
            email: _emailController.text.toString().trim(),
            password: _passwordController.text.toString())
        .then((value) {
      setState(() {
        _loading = false;
      });
      _fireStore.doc(_firebaseAuth.currentUser?.uid.toString()).set({
        'Uid': _firebaseAuth.currentUser?.uid.toString(),
        'Name': _nameController.text.trim(),
        'Email': _emailController.text.trim(),
        'Phone_Number': _phoneController.text.trim(),
        'Shop_Number': _shopeNumberController.text.trim(),
        'Plaza_Name': _plazaNameController.text.trim(),
        'Address': _addressController.text.trim(),
        'CNIC_Number': _cNICController.text.trim(),
        'Verification': false,
        'Profile_Image': "",
        'CNIC_Image1': downloadImageUrl2,
        'CNIC_Image2': downloadImageUrl1,
        'Shop_Image1': downloadImageUrl,
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
          context, MaterialPageRoute(builder: (context) => VerifyPage()));
    }).onError((error, stackTrace) {
      if (error.toString() ==
          '[firebase_auth/email-already-in-use] The email address is already in use by another account.') {
        print('asdfasdfasdfasdfasdf');
        _firebaseAuth
            .signInWithEmailAndPassword(
                email: _emailController.text.toString().trim(),
                password: _passwordController.text.toString())
            .then((value) {
          _fireStore.doc(_firebaseAuth.currentUser?.uid.toString()).set({
            'Uid': _firebaseAuth.currentUser?.uid.toString(),
            'Name': _nameController.text.trim(),
            'Email': _emailController.text.trim(),
            'Phone_Number': _phoneController.text.trim(),
            'Shop_Number': _shopeNumberController.text.trim(),
            'Plaza_Name': _plazaNameController.text.trim(),
            'Address': _addressController.text.trim(),
            'CNIC_Number': _cNICController.text.trim(),
            'Verification': false,
            'Profile_Image': "",
            'Total_Review_Rating': 0,
            'Total_Number_of_Reviews': 0,
            'CNIC_Image1': downloadImageUrl2,
            'CNIC_Image2': downloadImageUrl1,
            'Shop_Image1': downloadImageUrl,
          });

          setState(() {
            _loading = false;
          });
          if (_firebaseAuth.currentUser!.emailVerified) {
            Navigator.pushReplacement(context,
                MaterialPageRoute(builder: (context) => SellerVerification()));
          } else {
            Navigator.pushReplacement(
                context, MaterialPageRoute(builder: (context) => VerifyPage()));
          }
        }).onError((error, stackTrace) {
          Utils.flutterToast(error.toString());
          setState(() {
            _loading = false;
          });
        });
      }
      Utils.flutterToast(error.toString() ==
              '[firebase_auth/email-already-in-use] The email address is already in use by another account.'
          ? 'welcome as a seller also'
          : error.toString());
      print(error.toString());
      setState(() {
        _loading = false;
      });
    });
  }
}
