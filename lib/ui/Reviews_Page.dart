import 'dart:math';

import 'package:flutter/material.dart';
import 'package:mobidthrift_seller_center/appbar/My_appbar.dart';

class ReviewsPage extends StatefulWidget {
  const ReviewsPage({Key? key}) : super(key: key);

  @override
  State<ReviewsPage> createState() => _ReviewsPageState();
}

class _ReviewsPageState extends State<ReviewsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppbar().myAppBar(context),
      drawer: MyAppbar().myDrawer(context),
      body: ListView(
        children: List.generate(10,(index) {
            return Padding(
              padding: const EdgeInsets.only(top: 33, right: 33, left: 33),
              child: Card(
                clipBehavior: Clip.antiAlias,
                elevation: 4,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(11.0),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Text('Customer Name ${index + 1}'),
                      SizedBox(
                        height: 11,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: List.generate(
                            2 + Random().nextInt(3),
                            (indexa) => Icon(
                                  Icons.star,
                                  color: Colors.orange,
                                  size: 20,
                                )),
                      )
                    ],
                  ),
                ),
              ),
            );
          }

      ),)
    );
  }
}
