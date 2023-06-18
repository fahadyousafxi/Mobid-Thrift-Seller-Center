import 'package:flutter/material.dart';

class MyAppbar {
  /// My App Bar
  PreferredSizeWidget myAppBar(context) {
    return AppBar(
      backgroundColor: Colors.black,
      title: const Text("MobidThrift Seller Center"),
      centerTitle: true,
      actions: const [
        // IconButton(
        //     onPressed: () {
        //       // showSearch(context: context, delegate: SearchPage()),
        //       // Navigator.push(context,
        //       //     MaterialPageRoute(builder: (context) => SearchPage()));
        //     },
        //     icon: Hero(tag: 'forSearch', child: Icon(Icons.search))),
        // IconButton(
        //     onPressed: () {
        //       // Navigator.push(
        //       //     context, MaterialPageRoute(builder: (context) => YourCart()));
        //     },
        //     icon: Icon(Icons.shopping_cart)),
      ],
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          bottom: Radius.circular(20),
        ),
      ),
    );
  }

  /// My Simple App Bar
  PreferredSizeWidget mySimpleAppBar(context,
      {required String title,
      Widget myicon = const SizedBox(),
      bool showCart = true}) {
    return AppBar(
      backgroundColor: Colors.black,
      title: Text(title),
      centerTitle: true,
      actions: [
        myicon ?? const SizedBox(),
        // IconButton(
        //     onPressed: () {
        //       // Navigator.pushReplacement(
        //       //     context, MaterialPageRoute(builder: (context) => YourCart()));
        //     },
        //     icon: Icon(Icons.shopping_cart)),
      ],
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          bottom: Radius.circular(20),
        ),
      ),
    );
  }

  /// My Drawer
  // Widget myDrawer(BuildContext context) {
  //   bool _yes = false;
  //   return Drawer(
  //       backgroundColor: AppColors.drawerColor,
  //       child: ListView(
  //         children: [
  //           DrawerHeader(
  //             decoration: BoxDecoration(),
  //             child: Column(
  //               children: [
  //                 _firebaseAuth.currentUser != null
  //                     ? FutureBuilder<DocumentSnapshot>(
  //                         future: _fireStoreSnapshot,
  //                         builder: (BuildContext context,
  //                             AsyncSnapshot<DocumentSnapshot> snapshot) {
  //                           if (snapshot.connectionState ==
  //                               ConnectionState.waiting)
  //                             return Center(
  //                                 child: CircularProgressIndicator(
  //                               color: Colors.white,
  //                             ));
  //
  //                           if (snapshot.hasError)
  //                             return Center(child: Text('Some Error'));
  //
  //                           return Expanded(
  //                             child: Container(
  //                                 height: 85,
  //                                 child: InkWell(
  //                                   borderRadius: BorderRadius.circular(22),
  //                                   onTap: () {
  //                                     bottomSheet(context);
  //                                   },
  //                                   child:
  //                                       // ClipRRect(
  //                                       //     borderRadius: BorderRadius.circular(38),
  //                                       //     child: showLocalImage == false
  //                                       //         ? Image.network(
  //                                       //             "https://via.placeholder.com/150")
  //                                       //         : Image.file(pickedImage!),
  //                                       //
  //                                       // )
  //
  //                                       CircleAvatar(
  //                                     radius: 44,
  //                                     backgroundImage: showLocalImage == false
  //                                         ? NetworkImage(snapshot
  //                                                     .data!['Profile_Image'] ==
  //                                                 ""
  //                                             ? 'https://alumni.engineering.utoronto.ca/files/2022/05/Avatar-Placeholder-400x400-1.jpg'
  //                                             : snapshot.data!['Profile_Image'])
  //                                         : Image.file(pickedImage!).image,
  //
  //                                     // AssetImage('assets/images/phone.png'),
  //                                   ),
  //                                 )),
  //                           );
  //                         })
  //                     : Column(
  //                         children: [
  //                           SizedBox(
  //                             height: 20,
  //                           ),
  //                           Center(
  //                               child: AppWidgets().myElevatedBTN(
  //                                   onPressed: () {
  //                                     Navigator.pushReplacement(
  //                                         context,
  //                                         MaterialPageRoute(
  //                                             builder: (context) =>
  //                                                 SignupPage()));
  //                                   },
  //                                   btnText: 'SignUp',
  //                                   btnColor: Colors.redAccent)),
  //                         ],
  //                       ),
  //                 TextButton(
  //                   onPressed: () {
  //                     Navigator.pop(context);
  //                     Navigator.push(
  //                         context,
  //                         MaterialPageRoute(
  //                             builder: (context) => ProfileScreen()));
  //                   },
  //                   child: _firebaseAuth.currentUser != null
  //                       ? Text(
  //                           'Profile',
  //                           style: TextStyle(color: AppColors.drawerTextColor),
  //                         )
  //                       : SizedBox(),
  //                 ),
  //               ],
  //             ),
  //           ), // DrawerHeader(
  //           //     decoration: const BoxDecoration(),
  //           //     child: Column(
  //           //       children: [
  //           //         const SizedBox(
  //           //             height: 85,
  //           //             child: CircleAvatar(
  //           //               radius: 48, // Image radius
  //           //               backgroundImage:
  //           //                   AssetImage('assets/images/phone.png'),
  //           //             )),
  //           //         TextButton(
  //           //           onPressed: () {
  //           //             Navigator.push(
  //           //                 context,
  //           //                 MaterialPageRoute(
  //           //                     builder: (context) => const ProfilePage()));
  //           //           },
  //           //           child: Text(
  //           //             'Profile',
  //           //             style: TextStyle(color: AppColors.drawerTextColor),
  //           //           ),
  //           //         ),
  //           //       ],
  //           //     )),
  //           ListTile(
  //             textColor: AppColors.drawerTextColor,
  //             iconColor: AppColors.drawerIconColor,
  //             leading: const Icon(
  //               Icons.sell,
  //             ),
  //             title: const Text('Orders'),
  //             onTap: () {
  //               Navigator.pop(context);
  //               Navigator.pushReplacement(
  //                   context, MaterialPageRoute(builder: (context) => Orders()));
  //             },
  //           ),
  //           Divider(
  //             color: AppColors.drawerDividerColor,
  //             height: 1,
  //             thickness: 2,
  //           ),
  //           ListTile(
  //             textColor: AppColors.drawerTextColor,
  //             iconColor: AppColors.drawerIconColor,
  //             leading: const Icon(Icons.stacked_line_chart),
  //             title: const Text('Trade In'),
  //             onTap: () {
  //               Navigator.pop(context);
  //               Navigator.push(
  //                   context,
  //                   MaterialPageRoute(
  //                       builder: (context) => const TradeInPage()));
  //             },
  //           ),
  //           Divider(
  //             color: AppColors.drawerDividerColor,
  //             height: 1,
  //             thickness: 2,
  //           ),
  //           ListTile(
  //             textColor: AppColors.drawerTextColor,
  //             iconColor: AppColors.drawerIconColor,
  //             leading: const Icon(Icons.star),
  //             title: const Text('Reviews'),
  //             onTap: () {
  //               Navigator.pop(context);
  //               Navigator.push(
  //                   context,
  //                   MaterialPageRoute(
  //                       builder: (context) => SellersReviewPage()));
  //             },
  //           ),
  //           // Divider(
  //           //   color: AppColors.drawerDividerColor,
  //           //   height: 1,
  //           //   thickness: 2,
  //           // ),
  //           // ListTile(
  //           //   textColor: AppColors.drawerTextColor,
  //           //   iconColor: AppColors.drawerIconColor,
  //           //   leading: Icon(Icons.search),
  //           //   title: Text('Search'),
  //           //   onTap: () {
  //           //     Navigator.pop(context);
  //           //     // Navigator.push(context,
  //           //     //     MaterialPageRoute(builder: (context) => SearchPage()));
  //           //   },
  //           // ),
  //           Divider(
  //             color: AppColors.drawerDividerColor,
  //             height: 1,
  //             thickness: 2,
  //           ),
  //
  //           /// cart
  //           // ListTile(
  //           //   textColor: AppColors.drawerTextColor,
  //           //   iconColor: AppColors.drawerIconColor,
  //           //   leading: const Icon(Icons.shopping_cart),
  //           //   title: const Text('Cart'),
  //           //   onTap: () {
  //           //     Navigator.pop(context);
  //           //     Navigator.push(context,
  //           //         MaterialPageRoute(builder: (context) => const YourCart()));
  //           //   },
  //           // ),
  //           //
  //           // Divider(
  //           //   color: AppColors.drawerDividerColor,
  //           //   height: 1,
  //           //   thickness: 2,
  //           // ),
  //           ListTile(
  //             textColor: AppColors.drawerTextColor,
  //             iconColor: AppColors.drawerIconColor,
  //             leading: const Icon(Icons.chat),
  //             title: const Text('Chat'),
  //             onTap: () {
  //               Navigator.pop(context);
  //               Navigator.push(
  //                   context, MaterialPageRoute(builder: (context) => Chats()));
  //             },
  //           ),
  //           // Divider(
  //           //   color: AppColors.drawerDividerColor,
  //           //   height: 1,
  //           //   thickness: 2,
  //           // ),
  //           // ListTile(
  //           //   textColor: AppColors.drawerTextColor,
  //           //   iconColor: AppColors.drawerIconColor,
  //           //   leading: Icon(Icons.favorite),
  //           //   title: Text('Wish List'),
  //           //   onTap: () {
  //           //     Navigator.pop(context);
  //           //     // Navigator.push(context,
  //           //     //     MaterialPageRoute(builder: (context) => WishList()));
  //           //   },
  //           // ),
  //
  //           // Divider(
  //           //   color: AppColors.drawerDividerColor,
  //           //   height: 1,
  //           //   thickness: 2,
  //           // ),
  //           // ListTile(
  //           //   textColor: AppColors.drawerTextColor,
  //           //   iconColor: AppColors.drawerIconColor,
  //           //   leading: Icon(Icons.playlist_add_check_outlined),
  //           //   title: Text('Sold Products'),
  //           //   onTap: () {
  //           //     Navigator.pop(context);
  //           //     // Navigator.push(context,
  //           //     //     MaterialPageRoute(builder: (context) => SoldProducts()));
  //           //   },
  //           // ),
  //           Divider(
  //             color: AppColors.drawerDividerColor,
  //             height: 1,
  //             thickness: 2,
  //           ),
  //           ListTile(
  //             textColor: AppColors.drawerTextColor,
  //             iconColor: AppColors.drawerIconColor,
  //             leading: const Icon(Icons.sticky_note_2_outlined),
  //             title: const Text('About Us'),
  //             onTap: () {
  //               Navigator.pop(context);
  //               Navigator.push(context,
  //                   MaterialPageRoute(builder: (context) => const AboutUs()));
  //             },
  //           ),
  //           Divider(
  //             color: AppColors.drawerDividerColor,
  //             height: 1,
  //             thickness: 2,
  //           ),
  //           ListTile(
  //             textColor: AppColors.drawerTextColor,
  //             iconColor: AppColors.drawerIconColor,
  //             leading: const Icon(Icons.phone),
  //             title: const Text('Contact Us'),
  //             onTap: () {
  //               Navigator.pop(context);
  //               Navigator.push(context,
  //                   MaterialPageRoute(builder: (context) => const ContactUs()));
  //             },
  //           ),
  //           Divider(
  //             color: AppColors.drawerDividerColor,
  //             height: 1,
  //             thickness: 2,
  //           ),
  //           ListTile(
  //             textColor: AppColors.drawerTextColor,
  //             iconColor: AppColors.drawerIconColor,
  //             leading: const Icon(Icons.logout),
  //             title: const Text('Log Out'),
  //             onTap: () {
  //               Navigator.pop(context);
  //               Navigator.pushReplacement(context,
  //                   MaterialPageRoute(builder: (context) => const FirstPage()));
  //             },
  //           ),
  //           Divider(
  //             color: AppColors.drawerDividerColor,
  //             height: 1,
  //             thickness: 2,
  //           ),
  //         ],
  //       ));
  // }
}
