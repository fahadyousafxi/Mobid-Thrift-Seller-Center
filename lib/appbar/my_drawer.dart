import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:ndialog/ndialog.dart';

import '../Chating/chats.dart';
import '../constants/App_colors.dart';
import '../constants/App_widgets.dart';
import '../login/First_Page.dart';
import '../login/Signup_page.dart';
import '../ui/About_Us.dart';
import '../ui/Contact_Us.dart';
import '../ui/Orders.dart';
import '../ui/Profile.dart';
import '../ui/Reviews_Page.dart';
import '../ui/Trade_In_Page.dart';
import '../utils/utils.dart';

class MyDrawer extends StatefulWidget {
  const MyDrawer({super.key});

  @override
  State<MyDrawer> createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer> {
  final _firebaseAuth = FirebaseAuth.instance;
  final _fireStore = FirebaseFirestore.instance.collection('SellerCenterUsers');
  final _fireStoreSnapshot = FirebaseFirestore.instance
      .collection('SellerCenterUsers')
      .doc(FirebaseAuth.instance.currentUser?.uid)
      .get();

  File? pickedImage;
  bool showLocalImage = false;
  pickImageFrom(ImageSource fromGalleryOrCamera) async {
    XFile? file = await ImagePicker()
        .pickImage(source: fromGalleryOrCamera, imageQuality: 60);
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
      var fileName = _firebaseAuth.currentUser!.email!.toString() + '.jpg';
      UploadTask uploadTask = FirebaseStorage.instance
          .ref()
          .child('profile_images')
          .child(fileName)
          .putFile(pickedImage!);
      TaskSnapshot snapshot = await uploadTask;
      String profileImageUrl = await snapshot.ref.getDownloadURL();
      print(profileImageUrl);
      _fireStore.doc(_firebaseAuth.currentUser?.uid.toString()).update({
        'Profile_Image': profileImageUrl,
      });
      progressDialog.dismiss();
      Utils.flutterToast(' Uploaded Successful ');
    } catch (e) {
      progressDialog.dismiss();
      print(e.toString());
      Utils.flutterToast(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
        backgroundColor: AppColors.drawerColor,
        child: ListView(
          children: [
            DrawerHeader(
              decoration: BoxDecoration(),
              child: Column(
                children: [
                  _firebaseAuth.currentUser != null
                      ? FutureBuilder<DocumentSnapshot>(
                          future: _fireStoreSnapshot,
                          builder: (BuildContext context,
                              AsyncSnapshot<DocumentSnapshot> snapshot) {
                            if (snapshot.connectionState ==
                                ConnectionState.waiting)
                              return Center(
                                  child: CircularProgressIndicator(
                                color: Colors.white,
                              ));

                            if (snapshot.hasError)
                              return Center(child: Text('Some Error'));

                            return Expanded(
                              child: Container(
                                  height: 85,
                                  child: InkWell(
                                    borderRadius: BorderRadius.circular(22),
                                    onTap: () {
                                      bottomSheet(context);
                                    },
                                    child:
                                        // ClipRRect(
                                        //     borderRadius: BorderRadius.circular(38),
                                        //     child: showLocalImage == false
                                        //         ? Image.network(
                                        //             "https://via.placeholder.com/150")
                                        //         : Image.file(pickedImage!),
                                        //
                                        // )

                                        CircleAvatar(
                                      radius: 44,
                                      backgroundImage: showLocalImage == false
                                          ? NetworkImage(snapshot
                                                      .data!['Profile_Image'] ==
                                                  ""
                                              ? 'https://alumni.engineering.utoronto.ca/files/2022/05/Avatar-Placeholder-400x400-1.jpg'
                                              : snapshot.data!['Profile_Image'])
                                          : Image.file(pickedImage!).image,

                                      // AssetImage('assets/images/phone.png'),
                                    ),
                                  )),
                            );
                          })
                      : Column(
                          children: [
                            SizedBox(
                              height: 20,
                            ),
                            Center(
                                child: AppWidgets().myElevatedBTN(
                                    onPressed: () {
                                      Navigator.pushReplacement(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  SignupPage()));
                                    },
                                    btnText: 'SignUp',
                                    btnColor: Colors.redAccent)),
                          ],
                        ),
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ProfileScreen()));
                    },
                    child: _firebaseAuth.currentUser != null
                        ? Text(
                            'Profile',
                            style: TextStyle(color: AppColors.drawerTextColor),
                          )
                        : SizedBox(),
                  ),
                ],
              ),
            ), // DrawerHeader(
            //     decoration: const BoxDecoration(),
            //     child: Column(
            //       children: [
            //         const SizedBox(
            //             height: 85,
            //             child: CircleAvatar(
            //               radius: 48, // Image radius
            //               backgroundImage:
            //                   AssetImage('assets/images/phone.png'),
            //             )),
            //         TextButton(
            //           onPressed: () {
            //             Navigator.push(
            //                 context,
            //                 MaterialPageRoute(
            //                     builder: (context) => const ProfilePage()));
            //           },
            //           child: Text(
            //             'Profile',
            //             style: TextStyle(color: AppColors.drawerTextColor),
            //           ),
            //         ),
            //       ],
            //     )),
            ListTile(
              textColor: AppColors.drawerTextColor,
              iconColor: AppColors.drawerIconColor,
              leading: const Icon(
                Icons.sell,
              ),
              title: const Text('Orders'),
              onTap: () {
                Navigator.pop(context);
                Navigator.pushReplacement(
                    context, MaterialPageRoute(builder: (context) => Orders()));
              },
            ),
            Divider(
              color: AppColors.drawerDividerColor,
              height: 1,
              thickness: 2,
            ),
            ListTile(
              textColor: AppColors.drawerTextColor,
              iconColor: AppColors.drawerIconColor,
              leading: const Icon(Icons.stacked_line_chart),
              title: const Text('Trade In'),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const TradeInPage()));
              },
            ),
            Divider(
              color: AppColors.drawerDividerColor,
              height: 1,
              thickness: 2,
            ),
            ListTile(
              textColor: AppColors.drawerTextColor,
              iconColor: AppColors.drawerIconColor,
              leading: const Icon(Icons.star),
              title: const Text('Reviews'),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => SellersReviewPage()));
              },
            ),
            // Divider(
            //   color: AppColors.drawerDividerColor,
            //   height: 1,
            //   thickness: 2,
            // ),
            // ListTile(
            //   textColor: AppColors.drawerTextColor,
            //   iconColor: AppColors.drawerIconColor,
            //   leading: Icon(Icons.search),
            //   title: Text('Search'),
            //   onTap: () {
            //     Navigator.pop(context);
            //     // Navigator.push(context,
            //     //     MaterialPageRoute(builder: (context) => SearchPage()));
            //   },
            // ),
            Divider(
              color: AppColors.drawerDividerColor,
              height: 1,
              thickness: 2,
            ),

            /// cart
            // ListTile(
            //   textColor: AppColors.drawerTextColor,
            //   iconColor: AppColors.drawerIconColor,
            //   leading: const Icon(Icons.shopping_cart),
            //   title: const Text('Cart'),
            //   onTap: () {
            //     Navigator.pop(context);
            //     Navigator.push(context,
            //         MaterialPageRoute(builder: (context) => const YourCart()));
            //   },
            // ),
            //
            // Divider(
            //   color: AppColors.drawerDividerColor,
            //   height: 1,
            //   thickness: 2,
            // ),
            ListTile(
              textColor: AppColors.drawerTextColor,
              iconColor: AppColors.drawerIconColor,
              leading: const Icon(Icons.chat),
              title: const Text('Chat'),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => Chats()));
              },
            ),
            // Divider(
            //   color: AppColors.drawerDividerColor,
            //   height: 1,
            //   thickness: 2,
            // ),
            // ListTile(
            //   textColor: AppColors.drawerTextColor,
            //   iconColor: AppColors.drawerIconColor,
            //   leading: Icon(Icons.favorite),
            //   title: Text('Wish List'),
            //   onTap: () {
            //     Navigator.pop(context);
            //     // Navigator.push(context,
            //     //     MaterialPageRoute(builder: (context) => WishList()));
            //   },
            // ),

            // Divider(
            //   color: AppColors.drawerDividerColor,
            //   height: 1,
            //   thickness: 2,
            // ),
            // ListTile(
            //   textColor: AppColors.drawerTextColor,
            //   iconColor: AppColors.drawerIconColor,
            //   leading: Icon(Icons.playlist_add_check_outlined),
            //   title: Text('Sold Products'),
            //   onTap: () {
            //     Navigator.pop(context);
            //     // Navigator.push(context,
            //     //     MaterialPageRoute(builder: (context) => SoldProducts()));
            //   },
            // ),
            Divider(
              color: AppColors.drawerDividerColor,
              height: 1,
              thickness: 2,
            ),
            ListTile(
              textColor: AppColors.drawerTextColor,
              iconColor: AppColors.drawerIconColor,
              leading: const Icon(Icons.sticky_note_2_outlined),
              title: const Text('About Us'),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const AboutUs()));
              },
            ),
            Divider(
              color: AppColors.drawerDividerColor,
              height: 1,
              thickness: 2,
            ),
            ListTile(
              textColor: AppColors.drawerTextColor,
              iconColor: AppColors.drawerIconColor,
              leading: const Icon(Icons.phone),
              title: const Text('Contact Us'),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const ContactUs()));
              },
            ),
            Divider(
              color: AppColors.drawerDividerColor,
              height: 1,
              thickness: 2,
            ),
            ListTile(
              textColor: AppColors.drawerTextColor,
              iconColor: AppColors.drawerIconColor,
              leading: const Icon(Icons.logout),
              title: const Text('Log Out'),
              onTap: () {
                Navigator.pop(context);
                myAlertDialog(context);
              },
            ),
            Divider(
              color: AppColors.drawerDividerColor,
              height: 1,
              thickness: 2,
            ),
          ],
        ));
  }

  /// my Alert Dialog
  Future myAlertDialog(context) {
    return showDialog(
        context: context,
        builder: (context) {
          return Center(
            child: AlertDialog(
              title: Text('Confirmation!!'),
              content: Text('Are You Sure to Log Out?'),
              actions: [
                TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text('No')),
                TextButton(
                  onPressed: () {
                    final _auth = FirebaseAuth.instance;
                    _auth.signOut().then((value) {
                      Navigator.pop(context);
                      Navigator.pushReplacement(context,
                          MaterialPageRoute(builder: (context) => FirstPage()));
                    }).onError((error, stackTrace) {
                      Utils.flutterToast(error.toString());
                    });
                  },
                  child: Text('Yes'),
                )
              ],
            ),
          );
        });
  }

  /// bottom Sheet
  Future bottomSheet(context) {
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
                    pickImageFrom(ImageSource.camera);
                    Navigator.pop(context);
                  },
                ),
                ListTile(
                  leading: const Icon(Icons.storage),
                  title: const Text('From Gallery'),
                  onTap: () {
                    pickImageFrom(ImageSource.gallery);
                    Navigator.pop(context);
                  },
                ),
              ],
            ),
          );
        });
  }
}
