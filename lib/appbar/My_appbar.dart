import 'package:flutter/material.dart';
import 'package:mobidthrift_seller_center/Chating/chats.dart';
import 'package:mobidthrift_seller_center/login/First_Page.dart';
import 'package:mobidthrift_seller_center/ui/Profile.dart';
import 'package:mobidthrift_seller_center/ui/Reviews_Page.dart';

import '../constants/App_colors.dart';
import '../ui/About_Us.dart';
import '../ui/Contact_Us.dart';
import '../ui/Orders.dart';
import '../ui/Trade_In_Page.dart';

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
  Widget myDrawer(BuildContext context) {
    bool _yes = false;
    return Drawer(
        backgroundColor: AppColors.drawerColor,
        child: ListView(
          children: [
            DrawerHeader(
                decoration: const BoxDecoration(),
                child: Column(
                  children: [
                    const SizedBox(
                        height: 85,
                        child: CircleAvatar(
                          radius: 48, // Image radius
                          backgroundImage:
                              AssetImage('assets/images/phone.png'),
                        )),
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const ProfilePage()));
                      },
                      child: Text(
                        'Profile',
                        style: TextStyle(color: AppColors.drawerTextColor),
                      ),
                    ),
                  ],
                )),
            // Container(
            //   margin: EdgeInsets.symmetric(horizontal: 22, vertical: 5),
            //   decoration: BoxDecoration(
            //     borderRadius: BorderRadius.all(Radius.circular(20)),
            //     border: Border.all(
            //       color: Colors.white,
            //     ),
            //     color: Colors.black,
            //   ),
            //   child: Row(
            //     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            //     children: [
            //       Text(
            //         'Switch to seller',
            //         style: TextStyle(
            //           color: AppColors.drawerTextColor,
            //         ),
            //       ),
            //       Switch(
            //         value: _yes,
            //         onChanged: (bool newValue) {},
            //       ),
            //     ],
            //   ),
            // ),
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
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => const FirstPage()));
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
}
