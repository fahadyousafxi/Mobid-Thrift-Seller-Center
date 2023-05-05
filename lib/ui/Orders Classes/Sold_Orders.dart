import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:mobidthrift_seller_center/providers/sold_product_provider.dart';
import 'package:provider/provider.dart';

import '../../utils/utils.dart';

class SoldOrders extends StatefulWidget {
  const SoldOrders({Key? key}) : super(key: key);

  @override
  State<SoldOrders> createState() => _SoldOrdersState();
}

class _SoldOrdersState extends State<SoldOrders> {
  SoldProductProvider soldProductProvider = SoldProductProvider();

  final _firebaseFireStore = FirebaseFirestore.instance;

  bool loading1 = false;
  // bool loading2 = false;

  @override
  void initState() {
    SoldProductProvider soldProductProvider =
        Provider.of(context, listen: false);
    soldProductProvider.fitchCellPhonesProducts();
    soldProductProvider.fitchPadsTabletsProducts();
    soldProductProvider.fitchLaptopsProducts();
    soldProductProvider.fitchSmartWatchesProducts();
    soldProductProvider.fitchDesktopsProducts();
    soldProductProvider.fitchAccessoriesProducts();
    soldProductProvider.fitchPartsProducts();
    super.initState();
  }

  @override
  void deactivate() {
    soldProductProvider.getSearchProductsList.clear();
    // TODO: implement deactivate
    super.deactivate();
  }

  @override
  Widget build(BuildContext context) {
    soldProductProvider = Provider.of(context);

    var size = MediaQuery.of(context).size;

    return Scaffold(
      body: ListView.builder(
        itemCount: soldProductProvider.getSearchProductsList.length,
        itemBuilder: (BuildContext context, int index) {
          var data = soldProductProvider.getSearchProductsList[index];

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
                    Row(
                      // done
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        data.buyerEmail == ''
                            ? TextButton(
                                onPressed: () {
                                  showDialog(
                                      context: context,
                                      builder: (BuildContext context) {
                                        return AlertDialog(
                                          title: const Text('Please wait'),
                                          //Are you sure to delete the following recrods from the lists
                                          content: const Text(
                                              'You accepted his bid but the buyer didn\'t pay yet'),
                                          actions: [
                                            TextButton(
                                                onPressed: () {
                                                  Navigator.pop(context);
                                                },
                                                child: Text('Ok')),
                                          ],
                                        );
                                      });
                                },
                                child: Text('Buyer didn\'t pay yet'))
                            : data.accepted == ''
                                ? TextButton(
                                    onPressed: () {
                                      showDialog(
                                          context: context,
                                          builder: (context) {
                                            return Center(
                                              child: AlertDialog(
                                                title: const Text(
                                                    'Confirmation!!'),
                                                content: const Text(
                                                    'Do you want to accept'),
                                                actions: [
                                                  TextButton(
                                                    onPressed: () {
                                                      Navigator.pop(context);
                                                    },
                                                    child: Text('Not Now'),
                                                  ),
                                                  TextButton(
                                                    onPressed: () {
                                                      Navigator.pop(context);
                                                      acceptingFunc(
                                                          productUid: data
                                                              .productUid
                                                              .toString(),
                                                          buyerUid: data
                                                              .buyerUid
                                                              .toString(),
                                                          collectionName: data
                                                              .productCollectionName
                                                              .toString());
                                                    },
                                                    child: const Text(
                                                        'Yes Accept'),
                                                  ),
                                                ],
                                              ),
                                            );
                                          });
                                    },
                                    child: const Text(
                                      'Accept',
                                      style: TextStyle(color: Colors.green),
                                    ),
                                  )
                                : TextButton(
                                    onPressed: () {},
                                    child: Text(
                                      'Accepted',
                                      style: TextStyle(color: Colors.green),
                                    ),
                                  ),
                        data.accepted == ''
                            ? TextButton(
                                onPressed: () {
                                  showDialog(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return AlertDialog(
                                        title: const Text('Conformation!!'),
                                        //Are you sure to delete the following recrods from the lists
                                        content: Text(
                                            'Are you sure to delete the product also or Online it again'),
                                        actions: [
                                          TextButton(
                                              onPressed: () {
                                                Navigator.pop(context);
                                                rejectingFunc(
                                                    productUid: data.productUid
                                                        .toString(),
                                                    collectionName: data
                                                        .productCollectionName
                                                        .toString(),
                                                    buyerUid: data.buyerUid
                                                        .toString());
                                              },
                                              child: Text('Online It')),
                                          TextButton(
                                              onPressed: () {
                                                Navigator.pop(context);

                                                _firebaseFireStore
                                                    .collection(data
                                                        .productCollectionName
                                                        .toString())
                                                    .doc(data.productUid)
                                                    .delete()
                                                    .then((value) {
                                                  _firebaseFireStore
                                                      .collection("Cart")
                                                      .doc(data.buyerUid
                                                          .toString())
                                                      .collection("YourCart")
                                                      .doc(data.productUid
                                                          .toString())
                                                      .delete();
                                                  Utils.flutterToast('Deleted');
                                                }).onError((error, stackTrace) {
                                                  Utils.flutterToast(
                                                      error.toString());
                                                });
                                                // setState(() {
                                                //   uidChecking = data
                                                //       .productUid
                                                //       .toString();
                                                // });
                                              },
                                              child: Text('Yes Delete'))
                                        ],
                                      );
                                    },
                                  );
                                },
                                child: Text(
                                  'Reject',
                                  style: TextStyle(color: Colors.red),
                                ),
                              )
                            : SizedBox(),
                        data.buyerEmail == ''
                            ? SizedBox()
                            : TextButton(
                                onPressed: () {
                                  showDialog(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return Dialog(
                                        elevation: 22,
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(15.0)),
                                        child: Container(
                                          height: 400,
                                          width: size.width / 1.1,
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(15.0),
                                              border: Border.all(
                                                  color: Colors.blue, width: 3),
                                              color: Colors.white),
                                          child: Padding(
                                            padding: const EdgeInsets.all(15.0),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                // Row(children: [Text('data')],),

                                                Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.center,
                                                  children: [
                                                    SizedBox(
                                                      width: double.infinity,
                                                    ),
                                                    Icon(
                                                      Icons.receipt_long,
                                                      size: 40,
                                                    ),
                                                    Text(
                                                      textAlign:
                                                          TextAlign.center,
                                                      'Take a Screen Shot',
                                                      style: TextStyle(
                                                          color: Colors.green),
                                                    ),
                                                  ],
                                                ),

                                                SizedBox(
                                                  height: 22,
                                                ),
                                                Text(
                                                    textAlign: TextAlign.center,
                                                    'Product Name:  ${data.productName}'),
                                                SizedBox(
                                                  height: 22,
                                                ),
                                                Text(
                                                    'Buyer Name:  ${data.buyerName}'),
                                                SizedBox(
                                                  height: 5,
                                                ),

                                                Text(
                                                    textAlign: TextAlign.center,
                                                    'Buyer Email:  ${data.buyerEmail}'),
                                                SizedBox(
                                                  height: 5,
                                                ),
                                                Text(
                                                    'Buyer Phone Number:  ${data.buyerPhoneNumber}'),
                                                SizedBox(
                                                  height: 5,
                                                ),
                                                Text(
                                                    maxLines: 3,
                                                    textAlign: TextAlign.center,
                                                    'Buyer Address:  ${data.buyerAddress}'),
                                                SizedBox(
                                                  height: 35,
                                                ),

                                                Text(
                                                    'Product Price:  ${data.productPrice}'),
                                                SizedBox(
                                                  height: 5,
                                                ),

                                                Text(
                                                    'Product Price:  ${data.productShipping}'),
                                                Divider(
                                                  thickness: 3,
                                                ),
                                                SizedBox(
                                                  height: 5,
                                                ),

                                                Text(
                                                    'Total:  ${data.productPrice! + data.productShipping!}'),
                                                Spacer(),
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.end,
                                                  children: [
                                                    TextButton(
                                                        onPressed: () {
                                                          Navigator.pop(
                                                              context);
                                                        },
                                                        child: Text('Ok'))
                                                  ],
                                                )
                                              ],
                                            ),
                                          ),
                                        ),
                                      );
                                    },
                                  );
                                },
                                child: Text('Receipt'),
                              ),
                      ],
                    ),
                    SizedBox(
                      height: 142,
                      child: Image(
                        // The Data will be loaded from firebase
                        image: NetworkImage(data.productImage1.toString()),
                        // fit: BoxFit.cover,
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      data.productName.toString(),
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                    ),
                    SizedBox(
                      height: 11,
                    ),
                    Text(data.productDescription.toString()),
                    Text('Price: Rs.' + data.productPrice.toString()),
                    // Text('1 Day time left '),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  void acceptingFunc({
    required String productUid,
    required String buyerUid,
    required String collectionName,
  }) async {
    if (loading1 == false) {
      setState(() {
        loading1 = true;
      });
      await _firebaseFireStore
          .collection("Cart")
          .doc(buyerUid)
          .collection("YourCart")
          .doc(productUid)
          .update({
        'pleaseWait': 'To Receive',
        // 'SellerStatus': 'false',
      }).then((value) async {
        await _firebaseFireStore
            .collection(collectionName)
            .doc(productUid)
            .update({
          'Accepted': 'Yes',
          // 'SellerStatus': 'false',
        });
        Utils.flutterToast('Accepted');

        setState(() {
          loading1 = false;
        });
      }).onError((error, stackTrace) {
        Utils.flutterToast(error.toString());
        setState(() {
          loading1 = false;
        });
      });
    } else {
      Utils.flutterToast('please wait');
    }
  }

  void rejectingFunc({
    required String productUid,
    required String collectionName,
    required String buyerUid,
  }) async {
    if (loading1 == false) {
      setState(() {
        loading1 = true;
      });
      await _firebaseFireStore
          .collection(collectionName)
          .doc(productUid)
          .update({
        'productSold': false,
        // 'SellerStatus': 'false',
      }).then((value) {
        _firebaseFireStore
            .collection("Cart")
            .doc(buyerUid)
            .collection("YourCart")
            .doc(productUid)
            .update({
          'pleaseWait': 'Rejected',
          // 'SellerStatus': 'false',
        });
        Utils.flutterToast('Your product is online again');
        setState(() {
          loading1 = false;
        });
      }).onError((error, stackTrace) {
        Utils.flutterToast(error.toString());
        setState(() {
          loading1 = false;
        });
      });
    } else {
      Utils.flutterToast('please wait');
    }
  }
}
