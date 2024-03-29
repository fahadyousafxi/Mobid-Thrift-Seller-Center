import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:mobidthrift_seller_center/appbar/My_appbar.dart';
import 'package:mobidthrift_seller_center/appbar/my_drawer.dart';
import 'package:mobidthrift_seller_center/ui/Product_page_copy.dart';
import 'package:provider/provider.dart';

import '../constants/App_widgets.dart';
import '../providers/Product_Provider.dart';

class TradeInPage extends StatefulWidget {
  const TradeInPage({Key? key}) : super(key: key);

  @override
  State<TradeInPage> createState() => _TradeInPageState();
}

class _TradeInPageState extends State<TradeInPage> {
  final _fireStoreSnapshot = FirebaseFirestore.instance
      .collection('BannerAd')
      .doc('asdfasdfasdfasdf')
      .get();

  ProductsProvider productProvider = ProductsProvider();
  final _auth = FirebaseAuth.instance.currentUser;
  int _countTime = 0;
  int _countDownTime = 0;
  var f = NumberFormat('00', 'en_US');
  int currentTime = DateTime.now().millisecondsSinceEpoch ~/ 1000;

  @override
  void initState() {
    ProductsProvider productsProvider = Provider.of(context, listen: false);
    productsProvider.fitchCellPhonesProducts();
    productsProvider.fitchPadsTabletsProducts();
    productsProvider.fitchLaptopsProducts();
    productsProvider.fitchSmartWatchesProducts();
    productsProvider.fitchDesktopsProducts();
    productsProvider.fitchAccessoriesProducts();
    productsProvider.fitchPartsProducts();
    super.initState();
  }

  bool filtering = false;

  @override
  Widget build(BuildContext context) {
    productProvider = Provider.of(context);
    // productProvider.fitchCellPhonesProducts();
    // productProvider.fitchPadsTabletsProducts();
    // productProvider.fitchLaptopsProducts();
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: MyAppbar().myAppBar(
        context,
      ),
      drawer: MyDrawer(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Row(
              //   children: [
              //     IconButton(
              //       onPressed: () {
              //         print((size.height / 4).toString());
              //         setState(() {
              //           filtering = !filtering;
              //         });
              //       },
              //       icon: Icon(Icons.filter_list),
              //       color: AppColors.myIconColor,
              //     ),
              //     filtering == false
              //         ? SizedBox()
              //         : Container(
              //       width: size.width / 1.3,
              //       child: SingleChildScrollView(
              //         scrollDirection: Axis.horizontal,
              //         child: Row(
              //           children: [
              //             TextButton(
              //               onPressed: () {
              //                 Navigator.push(
              //                     context,
              //                     MaterialPageRoute(
              //                         builder: (context) =>
              //                             MoreCellPhones()));
              //               },
              //               child: Text('phones'),
              //             ),
              //             TextButton(
              //               onPressed: () {
              //                 Navigator.push(
              //                     context,
              //                     MaterialPageRoute(
              //                         builder: (context) =>
              //                             MorePadsTablets()));
              //               },
              //               child: Text('Pads/Tablets'),
              //             ),
              //             TextButton(
              //               onPressed: () {
              //                 Navigator.push(
              //                     context,
              //                     MaterialPageRoute(
              //                         builder: (context) =>
              //                             MoreSmartWatches()));
              //               },
              //               child: Text('Smart Watches'),
              //             ),
              //             TextButton(
              //               onPressed: () {
              //                 Navigator.push(
              //                     context,
              //                     MaterialPageRoute(
              //                         builder: (context) =>
              //                             MoreLaptops()));
              //               },
              //               child: Text('Laptops'),
              //             ),
              //             TextButton(
              //               onPressed: () {
              //                 Navigator.push(
              //                     context,
              //                     MaterialPageRoute(
              //                         builder: (context) =>
              //                             MoreDesktops()));
              //               },
              //               child: Text('Desktops'),
              //             ),
              //             TextButton(
              //               onPressed: () {
              //                 Navigator.push(
              //                     context,
              //                     MaterialPageRoute(
              //                         builder: (context) =>
              //                             MoreAccessories()));
              //               },
              //               child: Text('Accessories'),
              //             ),
              //             TextButton(
              //               onPressed: () {
              //                 Navigator.push(
              //                     context,
              //                     MaterialPageRoute(
              //                         builder: (context) => MoreParts()));
              //               },
              //               child: Text('Parts'),
              //             ),
              //           ],
              //         ),
              //       ),
              //     )
              //   ],
              // ),
              // AppWidgets().myAddBannerContainer(height: size.height / 4.2),

              /// Banner Add
              // FutureBuilder<DocumentSnapshot>(
              //     future: _fireStoreSnapshot,
              //     builder: (BuildContext context,
              //         AsyncSnapshot<DocumentSnapshot> snapshot) {
              //       if (snapshot.connectionState == ConnectionState.waiting)
              //         return Center(
              //             child: CircularProgressIndicator(
              //           color: Colors.white,
              //         ));
              //
              //       if (snapshot.hasError)
              //         return Center(child: Text('Some Error'));
              //
              //       return AspectRatio(
              //         aspectRatio: 10 / 6,
              //         child: Container(
              //           margin: EdgeInsets.only(left: 0, bottom: 0, right: 0),
              //           decoration: BoxDecoration(
              //             borderRadius: BorderRadius.all(Radius.circular(20)),
              //             border: Border.all(
              //               color: Colors.black,
              //             ),
              //             color: Colors.white,
              //             image: DecorationImage(
              //               // The Data will be loaded from firebse
              //               image: NetworkImage(snapshot.data!['Banner_Ad'] ??
              //                   "assets/images/adbanner.png"),
              //               fit: BoxFit.cover,
              //             ),
              //           ),
              //           child: Column(
              //             mainAxisAlignment: MainAxisAlignment.end,
              //             crossAxisAlignment: CrossAxisAlignment.start,
              //             children: [
              //               Text(
              //                 '    ' + snapshot.data!['Title'],
              //                 maxLines: 1,
              //                 overflow: TextOverflow.ellipsis,
              //                 style: const TextStyle(
              //                   fontSize: 22,
              //                   fontWeight: FontWeight.bold,
              //                   shadows: <Shadow>[
              //                     Shadow(
              //                       offset: Offset(0.2, 0.2),
              //                       blurRadius: 5.0,
              //                       color: Colors.white,
              //                     ),
              //                     // Shadow(
              //                     //   offset: Offset(0.1, 0.1),
              //                     //   blurRadius: 8.0,
              //                     //   color: Color.fromARGB(125, 0, 0, 255),
              //                     // ),
              //                   ],
              //                 ),
              //               ),
              //               SizedBox(
              //                 height: 22,
              //               )
              //             ],
              //           ),
              //         ),
              //       );
              //     }),
              SizedBox(
                height: 15,
              ),
              // SizedBox(
              //   height: 15,
              // ),
              // ElevatedButton(onPressed: (){
              //
              //   Navigator.push(context, MaterialPageRoute(builder: (context) => Testings()));
              // }, child: Text('checking')),
              // SizedBox(
              //   height: 15,
              // ),

              ///***************************** Cell Phones *****************************///
              AppWidgets().categoryRow(
                  categoryText: 'Cell Phones',
                  textButtonText: '',
                  onPressed: () {
                    // Navigator.push(
                    //     context,
                    //     MaterialPageRoute(
                    //         builder: (context) => MoreCellPhones()));
                  }),
              // Row(
              //     children: cellPhonesProductProvider.getCellPhonesProductsList.map((e) {return Container(height: 33, width: 22, color: Colors.red, child: Text('data'));}).toList()
              // ),
              productProvider.getCellPhonesProductsList.isEmpty
                  ? Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Center(child: CircularProgressIndicator()),
                    )
                  : SizedBox(
                      height: 240,
                      width: double.infinity,
                      child: ListView(
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          children: productProvider.getCellPhonesProductsList
                              .map((cellPhonesProducts) {
                            var time = cellPhonesProducts.bidEndTimeInSeconds;
                            return Card(
                              clipBehavior: Clip.antiAlias,
                              elevation: 4,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(11.0),
                              ),
                              child: GestureDetector(
                                  onTap: () {
                                    _auth != null
                                        ? Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    ProductPageCopy(
                                                      isStartingBid:
                                                          cellPhonesProducts
                                                              .isStartingBid,
                                                      productName:
                                                          cellPhonesProducts
                                                              .productName
                                                              .toString(),
                                                      productCollectionName:
                                                          cellPhonesProducts
                                                              .productCollectionName,
                                                      productCurrentBid:
                                                          cellPhonesProducts
                                                              .productCurrentBid,
                                                      productDescription:
                                                          cellPhonesProducts
                                                              .productDescription
                                                              .toString(),
                                                      productUid:
                                                          cellPhonesProducts
                                                              .productUid
                                                              .toString(),
                                                      productImage1:
                                                          cellPhonesProducts
                                                              .productImage1
                                                              .toString(),
                                                      productShipping:
                                                          cellPhonesProducts
                                                              .productShipping,
                                                      productPrice:
                                                          cellPhonesProducts
                                                              .productPrice,
                                                      productPTAApproved:
                                                          cellPhonesProducts
                                                              .productPTAApproved,
                                                      productShopkeeperUid:
                                                          cellPhonesProducts
                                                              .productShopkeeperUid,
                                                      productSpecification:
                                                          cellPhonesProducts
                                                              .productSpecification,
                                                      bidEndTimeInSeconds:
                                                          cellPhonesProducts
                                                              .bidEndTimeInSeconds,
                                                    )))
                                        : Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    ProductPageCopy(
                                                      productName:
                                                          cellPhonesProducts
                                                              .productName
                                                              .toString(),
                                                      productCollectionName:
                                                          cellPhonesProducts
                                                              .productCollectionName,
                                                      productCurrentBid:
                                                          cellPhonesProducts
                                                              .productCurrentBid,
                                                      productDescription:
                                                          cellPhonesProducts
                                                              .productDescription
                                                              .toString(),
                                                      productUid:
                                                          cellPhonesProducts
                                                              .productUid
                                                              .toString(),
                                                      productImage1:
                                                          cellPhonesProducts
                                                              .productImage1
                                                              .toString(),
                                                      productShipping:
                                                          cellPhonesProducts
                                                              .productShipping,
                                                      productPrice:
                                                          cellPhonesProducts
                                                              .productPrice,
                                                      productPTAApproved:
                                                          cellPhonesProducts
                                                              .productPTAApproved,
                                                      productShopkeeperUid:
                                                          cellPhonesProducts
                                                              .productShopkeeperUid,
                                                      productSpecification:
                                                          cellPhonesProducts
                                                              .productSpecification,
                                                      bidEndTimeInSeconds:
                                                          cellPhonesProducts
                                                              .bidEndTimeInSeconds,
                                                      isStartingBid:
                                                          cellPhonesProducts
                                                              .isStartingBid,
                                                    )));
                                  },
                                  child: Padding(
                                    padding: const EdgeInsets.all(5.0),
                                    child: SizedBox(
                                      width: 178,
                                      child: Column(
                                        children: [
                                          SizedBox(
                                            // width: 155,
                                            height: 120,
                                            child: ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(11),
                                              child: cellPhonesProducts
                                                      .productImage1!.isEmpty
                                                  ? CircularProgressIndicator()
                                                  : Image(
                                                      // The Data will be loaded from firebse
                                                      image: NetworkImage(
                                                          cellPhonesProducts
                                                              .productImage1
                                                              .toString()),
                                                      fit: BoxFit.cover,
                                                    ),
                                            ),
                                          ),
                                          SizedBox(
                                            height: 5,
                                          ),
                                          Text(
                                            cellPhonesProducts.productName
                                                .toString(),
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold),
                                          ),
                                          SizedBox(
                                            height: 2,
                                          ),
                                          Text(
                                            cellPhonesProducts
                                                .productDescription
                                                .toString(),
                                            maxLines: 1,
                                            overflow: TextOverflow.ellipsis,
                                          ),

                                          Text(
                                            'Price: Rs.${cellPhonesProducts.productPrice.toString()}',
                                            maxLines: 1,
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                          // cellPhonesProducts.isStartingBid ==
                                          //         true
                                          //     ? Text(
                                          //         'Rs.${cellPhonesProducts.productCurrentBid.toString()}  is current bid ')
                                          //     : SizedBox(),
                                          // cellPhonesProducts.isStartingBid ==
                                          //         false
                                          //     ? Text('Not on Auction')
                                          //     : (time! - currentTime) >= 0
                                          //         ? Text(
                                          //             '${((time! - currentTime) ~/ 86400)}Days  ${f.format(((time! - currentTime) % 86400) ~/ 3600)}hr time left ')
                                          //         : Text('Time Up')
                                        ],
                                      ),
                                    ),
                                  )),
                            );
                          }).toList()),
                    ),
              SizedBox(
                height: 15,
              ),

              ///***************************** Pads and Tablets *****************************///

              AppWidgets().categoryRow(
                  categoryText: 'Pads/Tablets',
                  textButtonText: '',
                  onPressed: () {
                    // Navigator.push(
                    //     context,
                    //     MaterialPageRoute(
                    //         builder: (context) => MorePadsTablets()));
                  }),
              productProvider.getPadsTabletsProductsList.isEmpty
                  ? Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Center(child: CircularProgressIndicator()),
                    )
                  : SizedBox(
                      height: 240,
                      width: double.infinity,
                      child: ListView.builder(
                          itemCount:
                              productProvider.getPadsTabletsProductsList.length,
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (BuildContext context, int index) {
                            var data = productProvider
                                .getPadsTabletsProductsList[index];
                            var time = data.bidEndTimeInSeconds;

                            // children: cellPhonesProductProvider
                            //     .getPadsTabletsProductsList
                            //     .map((PadsTabletsProducts) {
                            return Card(
                              clipBehavior: Clip.antiAlias,
                              elevation: 4,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(11.0),
                              ),
                              child: GestureDetector(
                                  onTap: () {
                                    _auth != null
                                        ? Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    ProductPageCopy(
                                                      isStartingBid:
                                                          data.isStartingBid,
                                                      productName: data
                                                          .productName
                                                          .toString(),
                                                      productCurrentBid: data
                                                          .productCurrentBid,
                                                      productDescription: data
                                                          .productDescription
                                                          .toString(),
                                                      productUid: data
                                                          .productUid
                                                          .toString(),
                                                      productImage1: data
                                                          .productImage1
                                                          .toString(),
                                                      productShipping:
                                                          data.productShipping,
                                                      productPrice:
                                                          data.productPrice,
                                                      productPTAApproved: data
                                                          .productPTAApproved,
                                                      productShopkeeperUid: data
                                                          .productShopkeeperUid,
                                                      productSpecification: data
                                                          .productSpecification,
                                                      productCollectionName: data
                                                          .productCollectionName,
                                                      bidEndTimeInSeconds: data
                                                          .bidEndTimeInSeconds,
                                                    )))
                                        : Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    ProductPageCopy(
                                                      isStartingBid:
                                                          data.isStartingBid,
                                                      bidEndTimeInSeconds: data
                                                          .bidEndTimeInSeconds,
                                                      productName: data
                                                          .productName
                                                          .toString(),
                                                      productCurrentBid: data
                                                          .productCurrentBid,
                                                      productDescription: data
                                                          .productDescription
                                                          .toString(),
                                                      productUid: data
                                                          .productUid
                                                          .toString(),
                                                      productImage1: data
                                                          .productImage1
                                                          .toString(),
                                                      productShipping:
                                                          data.productShipping,
                                                      productPrice:
                                                          data.productPrice,
                                                      productPTAApproved: data
                                                          .productPTAApproved,
                                                      productShopkeeperUid: data
                                                          .productShopkeeperUid,
                                                      productSpecification: data
                                                          .productSpecification,
                                                      productCollectionName: data
                                                          .productCollectionName,
                                                    )));
                                  },
                                  child: Padding(
                                    padding: const EdgeInsets.all(5.0),
                                    child: SizedBox(
                                      width: 178,
                                      child: Column(
                                        children: [
                                          SizedBox(
                                            // width: 155,
                                            height: 120,
                                            child: ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(11),
                                              child: Image(
                                                // The Data will be loaded from firebse
                                                image: NetworkImage(data
                                                    .productImage1
                                                    .toString()),
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                          ),
                                          SizedBox(
                                            height: 5,
                                          ),
                                          Text(
                                            data.productName.toString(),
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold),
                                          ),
                                          SizedBox(
                                            height: 2,
                                          ),
                                          Text(
                                            data.productDescription.toString(),
                                            maxLines: 1,
                                            overflow: TextOverflow.ellipsis,
                                          ),

                                          Text(
                                            'Price: Rs.${data.productPrice.toString()}',
                                            maxLines: 1,
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                          // data.isStartingBid == true
                                          //     ? Text(
                                          //         'Rs.${data.productCurrentBid.toString()}  is current bid ')
                                          //     : SizedBox(),
                                          // data.isStartingBid == false
                                          //     ? Text('Not on Auction')
                                          //     : (time! - currentTime) >= 0
                                          //         ? Text(
                                          //             '${((time! - currentTime) ~/ 86400)}Days  ${f.format(((time! - currentTime) % 86400) ~/ 3600)}hr time left ')
                                          //         : Text('Time Up')
                                        ],
                                      ),
                                    ),
                                  )),
                            );
                          }

                          // children: [
                          //     Card(
                          //       clipBehavior: Clip.antiAlias,
                          //       elevation: 4,
                          //       shape: RoundedRectangleBorder(
                          //         borderRadius: BorderRadius.circular(11.0),
                          //       ),
                          //       child: GestureDetector(
                          //           onTap: () {
                          //             Navigator.push(
                          //                 context,
                          //                 MaterialPageRoute(
                          //                     builder: (context) => ProductPage()));
                          //           },
                          //           child: Padding(
                          //             padding: const EdgeInsets.all(5.0),
                          //             child: Column(
                          //               children: [
                          //                 SizedBox(
                          //
                          //                   height: 112,
                          //                   child: Image(
                          //                     // The Data will be loaded from firebse
                          //                     image: AssetImage("assets/images/phone.png"),
                          //                     // fit: BoxFit.cover,
                          //                   ),
                          //                 ),
                          //                 Text('Product name'),
                          //                 Text('First line of discription'),
                          //                 Text('Rs.400  is current bid '),
                          //                 Text('1 Day time left '),
                          //               ],
                          //             ),
                          //           )),
                          //     ),
                          //     SizedBox(
                          //       width: 10,
                          //     ),
                          // ]

                          ),
                    ),
              SizedBox(
                height: 15,
              ),

              ///***************************** Smart Watches *****************************///

              AppWidgets().categoryRow(
                  categoryText: 'Smart Watches',
                  textButtonText: '',
                  onPressed: () {
                    // Navigator.push(
                    //     context,
                    //     MaterialPageRoute(
                    //         builder: (context) => MoreSmartWatches()));
                  }),
              productProvider.getSmartWatchesProductsList.isEmpty
                  ? Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Center(child: CircularProgressIndicator()),
                    )
                  : SizedBox(
                      height: 240,
                      width: double.infinity,
                      child: ListView.builder(
                          itemCount: productProvider
                              .getSmartWatchesProductsList.length,
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (BuildContext context, int index) {
                            var data = productProvider
                                .getSmartWatchesProductsList[index];
                            var time = data.bidEndTimeInSeconds;

                            // children: cellPhonesProductProvider
                            //     .getPadsTabletsProductsList
                            //     .map((PadsTabletsProducts) {
                            return Card(
                              clipBehavior: Clip.antiAlias,
                              elevation: 4,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(11.0),
                              ),
                              child: GestureDetector(
                                  onTap: () {
                                    _auth != null
                                        ? Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    ProductPageCopy(
                                                      isStartingBid:
                                                          data.isStartingBid,
                                                      bidEndTimeInSeconds: data
                                                          .bidEndTimeInSeconds,
                                                      productName: data
                                                          .productName
                                                          .toString(),
                                                      productCurrentBid: data
                                                          .productCurrentBid,
                                                      productDescription: data
                                                          .productDescription
                                                          .toString(),
                                                      productUid: data
                                                          .productUid
                                                          .toString(),
                                                      productImage1: data
                                                          .productImage1
                                                          .toString(),
                                                      productShipping:
                                                          data.productShipping,
                                                      productPrice:
                                                          data.productPrice,
                                                      productPTAApproved: data
                                                          .productPTAApproved,
                                                      productShopkeeperUid: data
                                                          .productShopkeeperUid,
                                                      productSpecification: data
                                                          .productSpecification,
                                                      productCollectionName: data
                                                          .productCollectionName,
                                                    )))
                                        : Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    ProductPageCopy(
                                                      isStartingBid:
                                                          data.isStartingBid,
                                                      bidEndTimeInSeconds: data
                                                          .bidEndTimeInSeconds,
                                                      productName: data
                                                          .productName
                                                          .toString(),
                                                      productCurrentBid: data
                                                          .productCurrentBid,
                                                      productDescription: data
                                                          .productDescription
                                                          .toString(),
                                                      productUid: data
                                                          .productUid
                                                          .toString(),
                                                      productImage1: data
                                                          .productImage1
                                                          .toString(),
                                                      productShipping:
                                                          data.productShipping,
                                                      productPrice:
                                                          data.productPrice,
                                                      productPTAApproved: data
                                                          .productPTAApproved,
                                                      productShopkeeperUid: data
                                                          .productShopkeeperUid,
                                                      productSpecification: data
                                                          .productSpecification,
                                                      productCollectionName: data
                                                          .productCollectionName,
                                                    )));
                                  },
                                  child: Padding(
                                    padding: const EdgeInsets.all(5.0),
                                    child: SizedBox(
                                      width: 178,
                                      child: Column(
                                        children: [
                                          SizedBox(
                                            // width: 155,
                                            height: 120,
                                            child: ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(11),
                                              child: Image(
                                                // The Data will be loaded from firebse
                                                image: NetworkImage(data
                                                    .productImage1
                                                    .toString()),
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                          ),
                                          SizedBox(
                                            height: 5,
                                          ),
                                          Text(
                                            data.productName.toString(),
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold),
                                          ),
                                          SizedBox(
                                            height: 2,
                                          ),
                                          Text(
                                            data.productDescription.toString(),
                                            maxLines: 1,
                                            overflow: TextOverflow.ellipsis,
                                          ),

                                          Text(
                                            'Price: Rs.${data.productPrice.toString()}',
                                            maxLines: 1,
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                          // data.isStartingBid == true
                                          //     ? Text(
                                          //         'Rs.${data.productCurrentBid.toString()}  is current bid ')
                                          //     : SizedBox(),
                                          // data.isStartingBid == false
                                          //     ? Text('Not on Auction')
                                          //     : (time! - currentTime) >= 0
                                          //         ? Text(
                                          //             '${((time! - currentTime) ~/ 86400)}Days  ${f.format(((time! - currentTime) % 86400) ~/ 3600)}hr time left ')
                                          //         : Text('Time Up')
                                        ],
                                      ),
                                    ),
                                  )),
                            );
                          }),
                    ),
              SizedBox(
                height: 15,
              ),

              ///***************************** Laptops *****************************///

              AppWidgets().categoryRow(
                  categoryText: 'Laptops',
                  textButtonText: '',
                  onPressed: () {
                    // Navigator.push(context,
                    //     MaterialPageRoute(builder: (context) => MoreLaptops()));
                  }),
              productProvider.getLaptopsProductsList.isEmpty
                  ? Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Center(child: CircularProgressIndicator()),
                    )
                  : SizedBox(
                      height: 240,
                      width: double.infinity,
                      child: ListView.builder(
                          itemCount:
                              productProvider.getLaptopsProductsList.length,
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (BuildContext context, int index) {
                            var data =
                                productProvider.getLaptopsProductsList[index];
                            var time = data.bidEndTimeInSeconds;

                            // children: cellPhonesProductProvider
                            //     .getPadsTabletsProductsList
                            //     .map((PadsTabletsProducts) {
                            return Card(
                              clipBehavior: Clip.antiAlias,
                              elevation: 4,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(11.0),
                              ),
                              child: GestureDetector(
                                  onTap: () {
                                    _auth != null
                                        ? Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    ProductPageCopy(
                                                      isStartingBid:
                                                          data.isStartingBid,
                                                      bidEndTimeInSeconds: data
                                                          .bidEndTimeInSeconds,
                                                      productName: data
                                                          .productName
                                                          .toString(),
                                                      productCurrentBid: data
                                                          .productCurrentBid,
                                                      productDescription: data
                                                          .productDescription
                                                          .toString(),
                                                      productUid: data
                                                          .productUid
                                                          .toString(),
                                                      productImage1: data
                                                          .productImage1
                                                          .toString(),
                                                      productShipping:
                                                          data.productShipping,
                                                      productPrice:
                                                          data.productPrice,
                                                      productPTAApproved: data
                                                          .productPTAApproved,
                                                      productShopkeeperUid: data
                                                          .productShopkeeperUid,
                                                      productSpecification: data
                                                          .productSpecification,
                                                      productCollectionName: data
                                                          .productCollectionName,
                                                    )))
                                        : Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    ProductPageCopy(
                                                      isStartingBid:
                                                          data.isStartingBid,
                                                      bidEndTimeInSeconds: data
                                                          .bidEndTimeInSeconds,
                                                      productName: data
                                                          .productName
                                                          .toString(),
                                                      productCurrentBid: data
                                                          .productCurrentBid,
                                                      productDescription: data
                                                          .productDescription
                                                          .toString(),
                                                      productUid: data
                                                          .productUid
                                                          .toString(),
                                                      productImage1: data
                                                          .productImage1
                                                          .toString(),
                                                      productShipping:
                                                          data.productShipping,
                                                      productPrice:
                                                          data.productPrice,
                                                      productPTAApproved: data
                                                          .productPTAApproved,
                                                      productShopkeeperUid: data
                                                          .productShopkeeperUid,
                                                      productSpecification: data
                                                          .productSpecification,
                                                      productCollectionName: data
                                                          .productCollectionName,
                                                    )));
                                  },
                                  child: Padding(
                                    padding: const EdgeInsets.all(5.0),
                                    child: SizedBox(
                                      width: 178,
                                      child: Column(
                                        children: [
                                          SizedBox(
                                            height: 120,
                                            child: ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(11),
                                              child: Image(
                                                // The Data will be loaded from firebase
                                                image: NetworkImage(data
                                                    .productImage1
                                                    .toString()),
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                          ),
                                          SizedBox(
                                            height: 5,
                                          ),
                                          Text(
                                            data.productName.toString(),
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold),
                                          ),
                                          SizedBox(
                                            height: 2,
                                          ),
                                          Text(
                                            data.productDescription.toString(),
                                            maxLines: 1,
                                            overflow: TextOverflow.ellipsis,
                                          ),

                                          Text(
                                            'Price: Rs.${data.productPrice.toString()}',
                                            maxLines: 1,
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                          // data.isStartingBid == true
                                          //     ? Text(
                                          //         'Rs.${data.productCurrentBid.toString()}  is current bid ')
                                          //     : SizedBox(),
                                          // data.isStartingBid == false
                                          //     ? Text('Not on Auction')
                                          //     : (time! - currentTime) >= 0
                                          //         ? Text(
                                          //             '${((time! - currentTime) ~/ 86400)}Days  ${f.format(((time! - currentTime) % 86400) ~/ 3600)}hr time left ')
                                          //         : Text('Time Up')
                                        ],
                                      ),
                                    ),
                                  )),
                            );
                          }),
                    ),
              SizedBox(
                height: 15,
              ),

              ///***************************** Desktops *****************************///

              AppWidgets().categoryRow(
                  categoryText: 'Desktops',
                  textButtonText: '',
                  onPressed: () {
                    // Navigator.push(
                    //     context,
                    //     MaterialPageRoute(
                    //         builder: (context) => MoreDesktops()));
                  }),
              productProvider.getDesktopsProductsList.isEmpty
                  ? Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Center(child: CircularProgressIndicator()),
                    )
                  : SizedBox(
                      height: 240,
                      width: double.infinity,
                      child: ListView.builder(
                          itemCount:
                              productProvider.getDesktopsProductsList.length,
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (BuildContext context, int index) {
                            var data =
                                productProvider.getDesktopsProductsList[index];
                            var time = data.bidEndTimeInSeconds;

                            // children: cellPhonesProductProvider
                            //     .getPadsTabletsProductsList
                            //     .map((PadsTabletsProducts) {
                            return Card(
                              clipBehavior: Clip.antiAlias,
                              elevation: 4,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(11.0),
                              ),
                              child: GestureDetector(
                                  onTap: () {
                                    _auth != null
                                        ? Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    ProductPageCopy(
                                                      isStartingBid:
                                                          data.isStartingBid,
                                                      bidEndTimeInSeconds: data
                                                          .bidEndTimeInSeconds,
                                                      productName: data
                                                          .productName
                                                          .toString(),
                                                      productCurrentBid: data
                                                          .productCurrentBid,
                                                      productDescription: data
                                                          .productDescription
                                                          .toString(),
                                                      productUid: data
                                                          .productUid
                                                          .toString(),
                                                      productImage1: data
                                                          .productImage1
                                                          .toString(),
                                                      productShipping:
                                                          data.productShipping,
                                                      productPrice:
                                                          data.productPrice,
                                                      productPTAApproved: data
                                                          .productPTAApproved,
                                                      productShopkeeperUid: data
                                                          .productShopkeeperUid,
                                                      productSpecification: data
                                                          .productSpecification,
                                                      productCollectionName: data
                                                          .productCollectionName,
                                                    )))
                                        : Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    ProductPageCopy(
                                                      isStartingBid:
                                                          data.isStartingBid,
                                                      bidEndTimeInSeconds: data
                                                          .bidEndTimeInSeconds,
                                                      productName: data
                                                          .productName
                                                          .toString(),
                                                      productCurrentBid: data
                                                          .productCurrentBid,
                                                      productDescription: data
                                                          .productDescription
                                                          .toString(),
                                                      productUid: data
                                                          .productUid
                                                          .toString(),
                                                      productImage1: data
                                                          .productImage1
                                                          .toString(),
                                                      productShipping:
                                                          data.productShipping,
                                                      productPrice:
                                                          data.productPrice,
                                                      productPTAApproved: data
                                                          .productPTAApproved,
                                                      productShopkeeperUid: data
                                                          .productShopkeeperUid,
                                                      productSpecification: data
                                                          .productSpecification,
                                                      productCollectionName: data
                                                          .productCollectionName,
                                                    )));
                                  },
                                  child: Padding(
                                    padding: const EdgeInsets.all(5.0),
                                    child: SizedBox(
                                      width: 178,
                                      child: Column(
                                        children: [
                                          SizedBox(
                                            // width: 155,
                                            height: 120,
                                            child: ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(11),
                                              child: Image(
                                                // The Data will be loaded from firebse
                                                image: NetworkImage(data
                                                    .productImage1
                                                    .toString()),
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                          ),
                                          SizedBox(
                                            height: 5,
                                          ),
                                          Text(
                                            data.productName.toString(),
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold),
                                          ),
                                          SizedBox(
                                            height: 2,
                                          ),
                                          Text(
                                            data.productDescription.toString(),
                                            maxLines: 1,
                                            overflow: TextOverflow.ellipsis,
                                          ),

                                          Text(
                                            'Price: Rs.${data.productPrice.toString()}',
                                            maxLines: 1,
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                          // data.isStartingBid == true
                                          //     ? Text(
                                          //         'Rs.${data.productCurrentBid.toString()}  is current bid ')
                                          //     : SizedBox(),
                                          // data.isStartingBid == false
                                          //     ? Text('Not on Auction')
                                          //     : (time! - currentTime) >= 0
                                          //         ? Text(
                                          //             '${((time! - currentTime) ~/ 86400)}Days  ${f.format(((time! - currentTime) % 86400) ~/ 3600)}hr time left ')
                                          //         : Text('Time Up')
                                        ],
                                      ),
                                    ),
                                  )),
                            );
                          }),
                    ),
              SizedBox(
                height: 15,
              ),

              ///***************************** Accessories *****************************///

              AppWidgets().categoryRow(
                  categoryText: 'Accessories',
                  textButtonText: '',
                  onPressed: () {
                    // Navigator.push(
                    //     context,
                    //     MaterialPageRoute(
                    //         builder: (context) => MoreAccessories()));
                  }),
              productProvider.getAccessoriesProductsList.isEmpty
                  ? Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Center(child: CircularProgressIndicator()),
                    )
                  : SizedBox(
                      height: 240,
                      width: double.infinity,
                      child: ListView.builder(
                          itemCount:
                              productProvider.getAccessoriesProductsList.length,
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (BuildContext context, int index) {
                            var data = productProvider
                                .getAccessoriesProductsList[index];
                            var time = data.bidEndTimeInSeconds;

                            // children: cellPhonesProductProvider
                            //     .getPadsTabletsProductsList
                            //     .map((PadsTabletsProducts) {
                            return Card(
                              clipBehavior: Clip.antiAlias,
                              elevation: 4,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(11.0),
                              ),
                              child: GestureDetector(
                                  onTap: () {
                                    _auth != null
                                        ? Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    ProductPageCopy(
                                                      isStartingBid:
                                                          data.isStartingBid,
                                                      bidEndTimeInSeconds: data
                                                          .bidEndTimeInSeconds,
                                                      productCollectionName: data
                                                          .productCollectionName,
                                                      productName: data
                                                          .productName
                                                          .toString(),
                                                      productCurrentBid: data
                                                          .productCurrentBid,
                                                      productDescription: data
                                                          .productDescription
                                                          .toString(),
                                                      productUid: data
                                                          .productUid
                                                          .toString(),
                                                      productImage1: data
                                                          .productImage1
                                                          .toString(),
                                                      productShipping:
                                                          data.productShipping,
                                                      productPrice:
                                                          data.productPrice,
                                                      productPTAApproved: data
                                                          .productPTAApproved,
                                                      productShopkeeperUid: data
                                                          .productShopkeeperUid,
                                                      productSpecification: data
                                                          .productSpecification,
                                                    )))
                                        : Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    ProductPageCopy(
                                                      isStartingBid:
                                                          data.isStartingBid,
                                                      bidEndTimeInSeconds: data
                                                          .bidEndTimeInSeconds,
                                                      productName: data
                                                          .productName
                                                          .toString(),
                                                      productCurrentBid: data
                                                          .productCurrentBid,
                                                      productDescription: data
                                                          .productDescription
                                                          .toString(),
                                                      productUid: data
                                                          .productUid
                                                          .toString(),
                                                      productImage1: data
                                                          .productImage1
                                                          .toString(),
                                                      productShipping:
                                                          data.productShipping,
                                                      productPrice:
                                                          data.productPrice,
                                                      productPTAApproved: data
                                                          .productPTAApproved,
                                                      productShopkeeperUid: data
                                                          .productShopkeeperUid,
                                                      productSpecification: data
                                                          .productSpecification,
                                                      productCollectionName: data
                                                          .productCollectionName,
                                                    )));
                                  },
                                  child: Padding(
                                    padding: const EdgeInsets.all(5.0),
                                    child: SizedBox(
                                      width: 178,
                                      child: Column(
                                        children: [
                                          SizedBox(
                                            // width: 155,
                                            height: 120,
                                            child: ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(11),
                                              child: Image(
                                                // The Data will be loaded from firebse
                                                image: NetworkImage(data
                                                    .productImage1
                                                    .toString()),
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                          ),
                                          SizedBox(
                                            height: 5,
                                          ),
                                          Text(
                                            data.productName.toString(),
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold),
                                          ),
                                          SizedBox(
                                            height: 2,
                                          ),
                                          Text(
                                            data.productDescription.toString(),
                                            maxLines: 1,
                                            overflow: TextOverflow.ellipsis,
                                          ),

                                          Text(
                                            'Price: Rs.${data.productPrice.toString()}',
                                            maxLines: 1,
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                          // data.isStartingBid == true
                                          //     ? Text(
                                          //         'Rs.${data.productCurrentBid.toString()}  is current bid ')
                                          //     : SizedBox(),
                                          // data.isStartingBid == false
                                          //     ? Text('Not on Auction')
                                          //     : (time! - currentTime) >= 0
                                          //         ? Text(
                                          //             '${((time! - currentTime) ~/ 86400)}Days  ${f.format(((time! - currentTime) % 86400) ~/ 3600)}hr time left ')
                                          //         : Text('Time Up')
                                        ],
                                      ),
                                    ),
                                  )),
                            );
                          }),
                    ),
              SizedBox(
                height: 15,
              ),

              ///***************************** Parts *****************************///

              AppWidgets().categoryRow(
                  categoryText: 'Parts',
                  textButtonText: '',
                  onPressed: () {
                    // Navigator.push(context,
                    //     MaterialPageRoute(builder: (context) => MoreParts()));
                  }),
              SizedBox(
                height: 240,
                width: double.infinity,
                child: ListView.builder(
                    itemCount: productProvider.getPartsProductsList.length,
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (BuildContext context, int index) {
                      var data = productProvider.getPartsProductsList[index];
                      var time = data.bidEndTimeInSeconds;
                      // children: cellPhonesProductProvider
                      //     .getPadsTabletsProductsList
                      //     .map((PadsTabletsProducts) {
                      return Card(
                        clipBehavior: Clip.antiAlias,
                        elevation: 4,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(11.0),
                        ),
                        child: GestureDetector(
                            onTap: () {
                              _auth != null
                                  ? Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => ProductPageCopy(
                                                isStartingBid:
                                                    data.isStartingBid,
                                                bidEndTimeInSeconds:
                                                    data.bidEndTimeInSeconds,
                                                productName:
                                                    data.productName.toString(),
                                                productCurrentBid:
                                                    data.productCurrentBid,
                                                productDescription: data
                                                    .productDescription
                                                    .toString(),
                                                productUid:
                                                    data.productUid.toString(),
                                                productImage1: data
                                                    .productImage1
                                                    .toString(),
                                                productShipping:
                                                    data.productShipping,
                                                productPrice: data.productPrice,
                                                productPTAApproved:
                                                    data.productPTAApproved,
                                                productShopkeeperUid:
                                                    data.productShopkeeperUid,
                                                productSpecification:
                                                    data.productSpecification,
                                                productCollectionName:
                                                    data.productCollectionName,
                                              )))
                                  : Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => ProductPageCopy(
                                                isStartingBid:
                                                    data.isStartingBid,
                                                bidEndTimeInSeconds:
                                                    data.bidEndTimeInSeconds,
                                                productName:
                                                    data.productName.toString(),
                                                productCurrentBid:
                                                    data.productCurrentBid,
                                                productDescription: data
                                                    .productDescription
                                                    .toString(),
                                                productUid:
                                                    data.productUid.toString(),
                                                productImage1: data
                                                    .productImage1
                                                    .toString(),
                                                productShipping:
                                                    data.productShipping,
                                                productPrice: data.productPrice,
                                                productPTAApproved:
                                                    data.productPTAApproved,
                                                productShopkeeperUid:
                                                    data.productShopkeeperUid,
                                                productSpecification:
                                                    data.productSpecification,
                                                productCollectionName:
                                                    data.productCollectionName,
                                              )));
                            },
                            child: Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: SizedBox(
                                width: 178,
                                child: Column(
                                  children: [
                                    SizedBox(
                                      // width: 155,
                                      height: 120,
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(11),
                                        child: Image(
                                          // The Data will be loaded from firebse
                                          image: NetworkImage(
                                              data.productImage1.toString()),
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Text(
                                      data.productName.toString(),
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                    SizedBox(
                                      height: 2,
                                    ),
                                    Text(
                                      data.productDescription.toString(),
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                    Text(
                                      'Price: Rs.${data.productPrice.toString()}',
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                    // data.isStartingBid == true
                                    //     ? Text(
                                    //         'Rs.${data.productCurrentBid.toString()}  is current bid ')
                                    //     : SizedBox(),
                                    // data.isStartingBid == false
                                    //     ? Text('Not on Auction')
                                    //     : (time! - currentTime) >= 0
                                    //         ? Text(
                                    //             '${((time! - currentTime) ~/ 86400)}Days  ${f.format(((time! - currentTime) % 86400) ~/ 3600)}hr time left ')
                                    //         : Text('Time Up')
                                  ],
                                ),
                              ),
                            )),
                      );
                    }),
              ),
              SizedBox(
                height: 15,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// import 'package:flutter/material.dart';
// import '../appbar/My_appbar.dart';
// import '../constants/App_colors.dart';
// import '../constants/App_widgets.dart';
// import 'View_More_Page.dart';
//
// class TradeInPage extends StatefulWidget {
//   const TradeInPage({Key? key}) : super(key: key);
//
//   @override
//   State<TradeInPage> createState() => _TradeInPageState();
// }
//
// class _TradeInPageState extends State<TradeInPage> {
//   @override
//   Widget build(BuildContext context) {
//     final Size size = MediaQuery.of(context).size;
//     return Scaffold(
//       appBar: MyAppbar().myAppBar(context),
//       drawer: MyAppbar().myDrawer(context),
//       body: Padding(
//         padding: const EdgeInsets.all(8.0),
//         child: SingleChildScrollView(
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.start,
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               IconButton(
//                 onPressed: () {print((size.height / 4).toString());},
//                 icon: Icon(Icons.filter_list),
//                 color: AppColors.myIconColor,
//               ),
//
//               // AppWidgets().myAddBannerContainer(height: size.height / 4.2),
//               // SizedBox(height: 15,),
//
//               AppWidgets().categoryRow(categoryText: 'Cell Phones', textButtonText: 'More Cell Phones', onPressed: (){Navigator.push(context, MaterialPageRoute(builder: (context) => ViewMorePage()));}),
//               SizedBox(height: 240, width: double.infinity, child: AppWidgets().myList(context)),
//
//               SizedBox(height: 15,),
//               AppWidgets().categoryRow(categoryText: 'Pads/Tablets', textButtonText: 'More Pads/Tablets', onPressed: (){Navigator.push(context, MaterialPageRoute(builder: (context) => ViewMorePage()));}),
//               SizedBox(height: 240, width: double.infinity, child: AppWidgets().myList(context)),
//
//               SizedBox(height: 15,),
//               AppWidgets().categoryRow(categoryText: 'Smart Watches', textButtonText: 'More Smart Watches', onPressed: (){Navigator.push(context, MaterialPageRoute(builder: (context) => ViewMorePage()));}),
//               SizedBox(height: size.height / 4, width: double.infinity, child: AppWidgets().myList(context)),
//
//               SizedBox(height: 15,),
//               AppWidgets().categoryRow(categoryText: 'Laptops', textButtonText: 'More Laptops', onPressed: (){Navigator.push(context, MaterialPageRoute(builder: (context) => ViewMorePage()));}),
//               SizedBox(height: size.height / 4, width: double.infinity, child: AppWidgets().myList(context)),
//
//               SizedBox(height: 15,),
//               AppWidgets().categoryRow(categoryText: 'Desktops', textButtonText: 'More Desktops', onPressed: (){Navigator.push(context, MaterialPageRoute(builder: (context) => ViewMorePage()));}),
//               SizedBox(height: size.height / 4, width: double.infinity, child: AppWidgets().myList(context)),
//
//               SizedBox(height: 15,),
//               AppWidgets().categoryRow(categoryText: 'Accessories', textButtonText: 'More Accessories', onPressed: (){Navigator.push(context, MaterialPageRoute(builder: (context) => ViewMorePage()));}),
//               SizedBox(height: size.height / 4, width: double.infinity, child: AppWidgets().myList(context)),
//
//               SizedBox(height: 15,),
//               AppWidgets().categoryRow(categoryText: 'Parts', textButtonText: 'More Parts', onPressed: (){Navigator.push(context, MaterialPageRoute(builder: (context) => ViewMorePage()));}),
//               SizedBox(height: size.height / 4, width: double.infinity, child: AppWidgets().myList(context)),
//
//               SizedBox(height: 15,),
//
//
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
//
