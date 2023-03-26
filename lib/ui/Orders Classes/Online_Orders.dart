import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:mobidthrift_seller_center/constants/App_widgets.dart';
import 'package:mobidthrift_seller_center/ui/Add%20Products/edit_product.dart';
import 'package:ndialog/ndialog.dart';
import 'package:provider/provider.dart';

import '../../providers/product_accepting_provider.dart';
import '../../providers/seller_products_provider.dart';

class OnlineOrders extends StatefulWidget {
  const OnlineOrders({Key? key}) : super(key: key);

  @override
  State<OnlineOrders> createState() => _OnlineOrdersState();
}

class _OnlineOrdersState extends State<OnlineOrders> {
  SellerProductProvider sellerProductProvider = SellerProductProvider();
  ProductAcceptingProvider productAcceptingProvider =
      ProductAcceptingProvider();
  final _firebaseStorage = FirebaseFirestore.instance;

  String uidChecking = '';

  @override
  void initState() {
    SellerProductProvider sellerProductProvider =
        Provider.of(context, listen: false);
    ProductAcceptingProvider productAcceptingProvider =
        Provider.of(context, listen: false);
    productAcceptingProvider.getProductAcceptingData();
    sellerProductProvider.fitchCellPhonesProducts();
    sellerProductProvider.fitchPadsTabletsProducts();
    sellerProductProvider.fitchLaptopsProducts();
    sellerProductProvider.fitchSmartWatchesProducts();
    sellerProductProvider.fitchDesktopsProducts();
    sellerProductProvider.fitchAccessoriesProducts();
    sellerProductProvider.fitchPartsProducts();
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose

    sellerProductProvider.getSearchProductsList.clear();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    sellerProductProvider = Provider.of(context);
    productAcceptingProvider = Provider.of(context);
    // // productProvider.fitchCellPhonesProducts();
    // // productProvider.fitchPadsTabletsProducts();
    // // productProvider.fitchLaptopsProducts();
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
        body: SingleChildScrollView(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 0, right: 50, left: 50),
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: Colors.blue, width: 2)),
              height: productAcceptingProvider
                      .getProductAcceptingDataList.isNotEmpty
                  ? size.height / 2.5
                  : 0,
              child: ListView.builder(
                shrinkWrap: true,
                itemCount:
                    productAcceptingProvider.getProductAcceptingDataList.length,
                itemBuilder: (BuildContext context, int index) {
                  var data = productAcceptingProvider
                      .getProductAcceptingDataList[index];

                  return Column(
                    children: [
                      index == 0
                          ? Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  border: Border.all(
                                      color: Colors.green, width: 2)),
                              child: const Text('  Accept And Deliver  '))
                          : SizedBox(
                              height: 10,
                            ),
                      Padding(
                        padding:
                            const EdgeInsets.only(top: 10, right: 0, left: 0),
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
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    SizedBox(
                                      height: 142,
                                      width: 105,
                                      child: Image(
                                        // The Data will be loaded from firebse
                                        image:
                                            NetworkImage(data.productImage1!),
                                        // fit: BoxFit.cover,
                                      ),
                                    ),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    SizedBox(
                                      width: size.width / 2.9,
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          SizedBox(
                                            height: 5,
                                          ),
                                          Text(data.productName!),
                                          SizedBox(
                                            height: 5,
                                          ),
                                          Text(
                                            data.productDescription.toString(),
                                            maxLines: 1,
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                          Text(
                                              'Price: Rs.${data.productPrice}'),
                                          SizedBox(
                                            height: 5,
                                          ),
                                          data.sellerStatus.toString() ==
                                                  "Seller Accepted the order, but didn't delivered till now"
                                              ? AppWidgets().myElevatedBTN(
                                                  onPressed: () {
                                                    showDialog(
                                                      context: context,
                                                      builder: (BuildContext
                                                          context) {
                                                        return AlertDialog(
                                                          title: const Text(
                                                              'Conformation!!'),
                                                          //Are you sure to delete the following recrods from the lists
                                                          content: const Text(
                                                              'Are you sure that the product is delivered?'),
                                                          actions: [
                                                            TextButton(
                                                                onPressed: () {
                                                                  Navigator.pop(
                                                                      context);
                                                                },
                                                                child: const Text(
                                                                    'Not Delivered')),
                                                            TextButton(
                                                                onPressed: () {
                                                                  Navigator.pop(
                                                                      context);

                                                                  //*******************

                                                                  ProgressDialog
                                                                      progressDialog =
                                                                      ProgressDialog(
                                                                    context,
                                                                    title: const Text(
                                                                        'Accepting!!!'),
                                                                    message:
                                                                        const Text(
                                                                            'Please wait'),
                                                                  );

                                                                  setState(() {
                                                                    progressDialog
                                                                        .show();
                                                                  });
                                                                  _firebaseStorage
                                                                      .collection(
                                                                          "Cart")
                                                                      .doc(data
                                                                          .buyerUid
                                                                          .toString())
                                                                      .collection(
                                                                          "YourCart")
                                                                      .doc(data
                                                                          .productUid)
                                                                      .update({
                                                                    'pleaseWait':
                                                                        'Seller delivered the order',
                                                                    // 'SellerStatus': 'false',
                                                                  }).then(
                                                                          (value) {
                                                                    setState(
                                                                        () {
                                                                      progressDialog
                                                                          .dismiss();
                                                                    });
                                                                    _firebaseStorage
                                                                        .collection(
                                                                            'SoldProducts')
                                                                        .doc(data
                                                                            .productUid)
                                                                        .update({
                                                                      'SellerStatus':
                                                                          "Seller delivered the order",
                                                                      'Accepted':
                                                                          true,
                                                                    }).then(
                                                                            (value) {
                                                                      setState(
                                                                          () {
                                                                        progressDialog
                                                                            .dismiss();
                                                                      });
                                                                    }).onError((error,
                                                                            stackTrace) {
                                                                      setState(
                                                                          () {
                                                                        progressDialog
                                                                            .dismiss();
                                                                      });
                                                                    });
                                                                  }).onError((error,
                                                                          stackTrace) {
                                                                    setState(
                                                                        () {
                                                                      progressDialog
                                                                          .dismiss();
                                                                    });
                                                                  });
                                                                  //*******************
                                                                },
                                                                child: Text(
                                                                    'Delivered'))
                                                          ],
                                                        );
                                                      },
                                                    );
                                                  },
                                                  btnText: 'Delivered',
                                                  btnHeight: 33.0,
                                                  btnColor: Colors.green)
                                              : Column(
                                                  children: [
                                                    AppWidgets().myElevatedBTN(
                                                        onPressed: () {
                                                          ProgressDialog
                                                              progressDialog =
                                                              ProgressDialog(
                                                            context,
                                                            title: const Text(
                                                                'Accepting!!!'),
                                                            message: const Text(
                                                                'Please wait'),
                                                          );

                                                          setState(() {
                                                            progressDialog
                                                                .show();
                                                          });
                                                          _firebaseStorage
                                                              .collection(
                                                                  "Cart")
                                                              .doc(data.buyerUid
                                                                  .toString())
                                                              .collection(
                                                                  "YourCart")
                                                              .doc(data
                                                                  .productUid)
                                                              .update({
                                                            'pleaseWait':
                                                                'Seller accepted the order, please wait for delivery',
                                                            // 'SellerStatus': 'false',
                                                          }).then((value) {
                                                            _firebaseStorage
                                                                .collection(
                                                                    'SoldProducts')
                                                                .doc(data
                                                                    .productUid)
                                                                .update({
                                                              'SellerStatus':
                                                                  "Seller Accepted the order, but didn't delivered till now",
                                                            }).then((value) {
                                                              setState(() {
                                                                progressDialog
                                                                    .dismiss();
                                                              });
                                                            }).onError((error,
                                                                    stackTrace) {
                                                              setState(() {
                                                                progressDialog
                                                                    .dismiss();
                                                              });
                                                            });
                                                          }).onError((error,
                                                                  stackTrace) {
                                                            setState(() {
                                                              progressDialog
                                                                  .dismiss();
                                                            });
                                                          });
                                                        },
                                                        btnText: 'Accept',
                                                        btnHeight: 33.0,
                                                        btnColor: Colors.green),
                                                    AppWidgets().myElevatedBTN(
                                                        onPressed: () {
                                                          ProgressDialog
                                                              progressDialog =
                                                              ProgressDialog(
                                                            context,
                                                            title: const Text(
                                                                'Rejecting!!!'),
                                                            message: const Text(
                                                                'Please wait'),
                                                          );

                                                          setState(() {
                                                            progressDialog
                                                                .show();
                                                          });
                                                          _firebaseStorage
                                                              .collection(
                                                                  'SoldProducts')
                                                              .doc(data
                                                                  .productUid)
                                                              .delete()
                                                              .then((value) {
                                                            _firebaseStorage
                                                                .collection(
                                                                    "Cart")
                                                                .doc(data
                                                                    .buyerUid
                                                                    .toString())
                                                                .collection(
                                                                    "YourCart")
                                                                .doc(data
                                                                    .productUid)
                                                                .update({
                                                              'pleaseWait':
                                                                  'Seller Rejected the Order',
                                                              // 'SellerStatus': 'false',
                                                            }).then((value) {
                                                              setState(() {
                                                                progressDialog
                                                                    .dismiss();
                                                              });
                                                            }).onError((error,
                                                                    stackTrace) {
                                                              setState(() {
                                                                progressDialog
                                                                    .dismiss();
                                                              });
                                                            });
                                                          }).onError((error,
                                                                  stackTrace) {
                                                            setState(() {
                                                              progressDialog
                                                                  .dismiss();
                                                            });
                                                          });
                                                        },
                                                        btnText: 'Reject',
                                                        btnHeight: 22.0,
                                                        btnColor: Colors.red),
                                                  ],
                                                ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),

                                // Text('1 Day time left '),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
          ),
          SizedBox(
            height:
                productAcceptingProvider.getProductAcceptingDataList.isNotEmpty
                    ? size.height / 1.3
                    : size.height / 1.3,
            child: ListView.builder(
              itemCount: sellerProductProvider.getSearchProductsList.length,
              itemBuilder: (BuildContext context, int index) {
                var data = sellerProductProvider.getSearchProductsList[index];
                return data.productUid == uidChecking
                    ? SizedBox()
                    : Padding(
                        padding:
                            const EdgeInsets.only(top: 33, right: 33, left: 33),
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
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    TextButton(
                                      onPressed: () {
                                        showDialog(
                                          context: context,
                                          builder: (BuildContext context) {
                                            return AlertDialog(
                                              title:
                                                  const Text('Conformation!!'),
                                              //Are you sure to delete the following recrods from the lists
                                              content: Text(
                                                  'Are you sure to delete'),
                                              actions: [
                                                TextButton(
                                                    onPressed: () {
                                                      Navigator.pop(context);
                                                    },
                                                    child: Text('No')),
                                                TextButton(
                                                    onPressed: () {
                                                      Navigator.pop(context);

                                                      _firebaseStorage
                                                          .collection(data
                                                              .productCollectionName
                                                              .toString())
                                                          .doc(data.productUid)
                                                          .delete();
                                                      setState(() {
                                                        uidChecking = data
                                                            .productUid
                                                            .toString();
                                                      });
                                                    },
                                                    child: Text('Yes'))
                                              ],
                                            );
                                          },
                                        );
                                      },
                                      child: Text('Remove'),
                                    ),
                                    TextButton(
                                      onPressed: () {
                                        showDialog(
                                          context: context,
                                          builder: (BuildContext context) {
                                            return AlertDialog(
                                              title:
                                                  const Text('Conformation!!'),
                                              //Are you sure to delete the following recrods from the lists
                                              content: Text(
                                                  'Are you sure to edit all details'),
                                              actions: [
                                                TextButton(
                                                    onPressed: () {
                                                      Navigator.pop(context);
                                                    },
                                                    child: Text('No')),
                                                TextButton(
                                                    onPressed: () {
                                                      Navigator.pop(context);

                                                      Navigator.push(
                                                          context,
                                                          MaterialPageRoute(
                                                              builder:
                                                                  (context) =>
                                                                      EditProduct(
                                                                        productCollectionName: data
                                                                            .productCollectionName
                                                                            .toString(),
                                                                        productUid: data
                                                                            .productUid
                                                                            .toString(),
                                                                      )));
                                                    },
                                                    child: Text('Yes'))
                                              ],
                                            );
                                          },
                                        );
                                      },
                                      child: Text('Edit'),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 142,
                                  child: Image(
                                    // The Data will be loaded from firebase
                                    image: NetworkImage(data.productImage1!),
                                    // fit: BoxFit.cover,
                                  ),
                                ),
                                Text(data.productName!),
                                SizedBox(
                                  height: 11,
                                ),
                                Text(data.productDescription.toString()),
                                Text('Price: Rs.${data.productPrice}'),
                                // Text('1 Day time left '),
                              ],
                            ),
                          ),
                        ),
                      );
              },
            ),
          ),
        ],
      ),
    ));
  }
}

// Padding(
//   padding: const EdgeInsets.only(top: 33, right: 33, left: 33),
//   child: Card(
//     clipBehavior: Clip.antiAlias,
//     elevation: 4,
//     shape: RoundedRectangleBorder(
//       borderRadius: BorderRadius.circular(11.0),
//     ),
//     child: Padding(
//       padding: const EdgeInsets.all(8.0),
//       child: Column(
//         children: [
//           Row(
//
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               TextButton(onPressed: () {  }, child: Text('Remove'),),
//               SizedBox(
//
//                 height: 142,
//                 child: Image(
//                   // The Data will be loaded from firebse
//                   image: AssetImage("assets/images/phone.png"),
//                   // fit: BoxFit.cover,
//                 ),
//               ),
//               TextButton(onPressed: () {  }, child: Text('Edit'),),
//             ],
//           ),
//           Text('Iphone 14 Pro Max'),
//           SizedBox(height: 11,),
//           Text('Product discription'),
//           Text('Rs.1000 is current bid '),
//           Text('1 Day time left '),
//         ],
//       ),
//     ),
//   ),
// ),
