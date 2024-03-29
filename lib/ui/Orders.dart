import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mobidthrift_seller_center/appbar/My_appbar.dart';
import 'package:mobidthrift_seller_center/appbar/my_drawer.dart';
import 'package:mobidthrift_seller_center/ui/Add%20Products/add_product_screen.dart';
import 'package:mobidthrift_seller_center/ui/Orders%20Classes/Online_Orders.dart';
import 'package:mobidthrift_seller_center/ui/Orders%20Classes/Sold_Orders.dart';

import '../constants/App_colors.dart';
import '../constants/App_widgets.dart';
import 'Orders Classes/Bided_Orders.dart';

class Orders extends StatefulWidget {
  const Orders({Key? key}) : super(key: key);

  @override
  State<Orders> createState() => _OrdersState();
}

class _OrdersState extends State<Orders> with SingleTickerProviderStateMixin {
  TabController? _tabController;
  @override
  void initState() {
    _tabController = new TabController(length: 3, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: MyAppbar().myAppBar(context),
        drawer: MyDrawer(),
        body: Column(
          children: [
            TabBar(
              unselectedLabelColor: Colors.black,
              labelColor: Colors.blue,
              tabs: const [
                Tab(
                  // icon: Icon(Icons.check_circle),
                  child: Text('Online'),
                ),
                Tab(
                  // icon: Icon(Icons.add),
                  child: Text('Sold'),
                ),
                Tab(
                  // icon: Icon(Icons.add),
                  child: Text('Bid'),
                )
              ],
              controller: _tabController,
              indicatorSize: TabBarIndicatorSize.tab,
            ),
            Expanded(
              child: TabBarView(
                controller: _tabController,
                children: const [
                  OnlineOrders(),
                  SoldOrders(),
                  BiddingOrders(),
                ],
              ),
            ),
          ],
        ),
        extendBody: true,
        bottomNavigationBar: Container(
          height: 60,
          width: double.infinity,
          decoration: const BoxDecoration(color: Colors.transparent),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              AppWidgets().myElevatedBTN(
                onPressed: () {
                  print(FirebaseAuth.instance.currentUser!.uid);
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => AddProductScreen()));
                  // Navigator.push(context,
                  //   MaterialPageRoute(
                  //     builder: (context) =>  AddProductScreen(),
                  //   ),
                  // );
                },
                btnText: 'Add Product',
                btnColor: AppColors.myRedColor,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
