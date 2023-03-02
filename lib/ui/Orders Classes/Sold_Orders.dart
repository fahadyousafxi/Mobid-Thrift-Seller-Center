import 'package:flutter/material.dart';


class SoldOrders extends StatefulWidget {
  const SoldOrders({Key? key}) : super(key: key);

  @override
  State<SoldOrders> createState() => _SoldOrdersState();
}

class _SoldOrdersState extends State<SoldOrders> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(children: [


        Padding(
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
                  Row(

                    mainAxisAlignment: MainAxisAlignment.spaceBetween,

                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(width: 60,),
                      SizedBox(
                        height: 142,
                        child: Image(
                          // The Data will be loaded from firebse
                          image: AssetImage("assets/images/phone.png"),
                          // fit: BoxFit.cover,
                        ),
                      ),
                      TextButton(onPressed: () {  }, child: Text('Receipt'),),
                    ],
                  ),
                  Text('Iphone 14 Pro Max'),
                  SizedBox(height: 11,),
                  Text('Product discription'),
                  Text('Rs.1000 is current bid '),
                  Text('1 Day time left '),
                ],
              ),
            ),
          ),
        ),


        Padding(
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
                  Row(

                    mainAxisAlignment: MainAxisAlignment.spaceBetween,

                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(width: 60,),
                      SizedBox(
                        height: 142,
                        child: Image(
                          // The Data will be loaded from firebse
                          image: AssetImage("assets/images/phone.png"),
                          // fit: BoxFit.cover,
                        ),
                      ),
                      TextButton(onPressed: () {  }, child: Text('Receipt'),),
                    ],
                  ),
                  Text('Iphone 14 Pro Max'),
                  SizedBox(height: 11,),
                  Text('Product discription'),
                  Text('Rs.1000 is current bid '),
                  Text('1 Day time left '),
                ],
              ),
            ),
          ),
        ),


        Padding(
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
                  Row(

                    mainAxisAlignment: MainAxisAlignment.spaceBetween,

                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(width: 60,),
                      SizedBox(
                        height: 142,
                        child: Image(
                          // The Data will be loaded from firebse
                          image: AssetImage("assets/images/phone.png"),
                          // fit: BoxFit.cover,
                        ),
                      ),
                      TextButton(onPressed: () {  }, child: Text('Receipt'),),
                    ],
                  ),
                  Text('Iphone 14 Pro Max'),
                  SizedBox(height: 11,),
                  Text('Product discription'),
                  Text('Rs.1000 is current bid '),
                  Text('1 Day time left '),
                ],
              ),
            ),
          ),
        ),

      ],),
    );
  }
}
