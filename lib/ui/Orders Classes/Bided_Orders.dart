import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:mobidthrift_seller_center/utils/utils.dart';
import 'package:ndialog/ndialog.dart';
import 'package:provider/provider.dart';

import '../../providers/bidding_product_provider.dart';

class BiddingOrders extends StatefulWidget {
  const BiddingOrders({Key? key}) : super(key: key);

  @override
  State<BiddingOrders> createState() => _BiddingOrdersState();
}

class _BiddingOrdersState extends State<BiddingOrders> {
  BiddingProductProvider biddingProductProvider = BiddingProductProvider();
  @override
  void initState() {
    BiddingProductProvider biddingProductProvider =
        Provider.of(context, listen: false);
    biddingProductProvider.fitchCellPhonesProducts();
    biddingProductProvider.fitchPadsTabletsProducts();
    biddingProductProvider.fitchLaptopsProducts();
    biddingProductProvider.fitchSmartWatchesProducts();
    biddingProductProvider.fitchDesktopsProducts();
    biddingProductProvider.fitchAccessoriesProducts();
    biddingProductProvider.fitchPartsProducts();
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose

    biddingProductProvider.getSearchProductsList.clear();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    biddingProductProvider = Provider.of(context);
    return Scaffold(
      body: ListView.builder(
        itemCount: biddingProductProvider.searchProductsList.length,
        itemBuilder: (BuildContext context, int index) {
          var data = biddingProductProvider.searchProductsList[index];
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
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: 60,
                        ),
                        TextButton(
                          onPressed: () async {
                            if (data.higherBidder != '') {
                              ProgressDialog progressDialog2 = ProgressDialog(
                                context,
                                title: const Text('Product Accepting!!!'),
                                message: const Text('Please wait'),
                              );
                              setState(() {});
                              progressDialog2.show();
                              await FirebaseFirestore.instance
                                  .collection("Cart")
                                  .doc(data.higherBidder)
                                  .collection("YourCart")
                                  .doc(data.productUid)
                                  .set({
                                "cartImage1": data.productImage1,
                                // "cartImage2": cartImage2,
                                // "cartImage3": cartImage3,
                                // "cartImage4": cartImage4,
                                // "cartImage5": cartImage5,
                                // "cartImage6": cartImage6,
                                "cartCollectionName":
                                    data.productCollectionName,
                                "cartName": data.productName,
                                "cartDescription": data.productDescription,
                                "cartSpecification": data.productSpecification,
                                "cartUid": data.productUid,
                                "cartShopkeeperUid": data.productShopkeeperUid,
                                "cartCurrentBid": data.productCurrentBid,
                                "cartShipping": data.productShipping,
                                "cartPrice": data.productPrice,
                                "cartDateTime": data.productDateTime,
                                "bidDateTimeLeft": data.bidEndTimeInSeconds,
                                "cartPTAApproved": data.productPTAApproved,
                                'pleaseWait': 'To Pay',
                                'SellerStatus': '',
                              });
                              await FirebaseFirestore.instance
                                  .collection(
                                      data.productCollectionName.toString())
                                  .doc(data.productUid.toString())
                                  .update({
                                // "productSold": true,
                                // "productBuyer": FirebaseAuth
                                //     .instance.currentUser!.uid
                                //     .toString()

                                "productSold": true,
                                "addedToCart": true,
                                "Accepted": '',
                                "BuyerAddress": '',
                                "BuyerEmail": '',
                                "BuyerName": '',
                                "BuyerPhoneNumber": '',
                              }).then((value) {
                                progressDialog2.dismiss();
                                Utils.flutterToast('Added to Cart!!');
                              }).onError((error, stackTrace) {
                                progressDialog2.dismiss();
                                Utils.flutterToast(error.toString());
                              });
                            } else {
                              Utils.flutterToast('No bid on your product');
                            }
                          },
                          child: Text('Accept'),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 142,
                      child: Image(
                        // The Data will be loaded from firebse
                        image: NetworkImage(data.productImage1.toString()),
                        // fit: BoxFit.cover,
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      data.productName!,
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 11,
                    ),
                    Text(data.productDescription!),
                    Text('Price: Rs.${data.productPrice!}'),
                    // Text('${data.higherBidder}'),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
