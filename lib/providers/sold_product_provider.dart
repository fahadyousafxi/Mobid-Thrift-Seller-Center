import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

import '../models/sold_product_model.dart';

class SoldProductProvider with ChangeNotifier {
  final _auth = FirebaseAuth.instance.currentUser!.uid.toString();
  List<SoldProductModel> soldProductDataList = [];

  void getSoldProductData() async {
    List<SoldProductModel> newList = [];
    QuerySnapshot soldProductData = await FirebaseFirestore.instance
        .collection("SoldProducts")
        .where('ShopKeeperUid', isEqualTo: _auth)
        .where(
          'Accepted',
          isEqualTo: true,
        )
        .get();

    for (var element in soldProductData.docs) {
      SoldProductModel cartModel = SoldProductModel(
        productImage1: element.get("ProductImage"),
        productName: element.get("ProductName"),
        productDescription: element.get("ProductDescription"),
        productUid: element.get("ProductUid"),
        shopkeeperUid: element.get("ShopKeeperUid"),
        productPrice: element.get("ProductPrice"),
        productShipping: element.get("ProductShipping"),
        productSpecification: element.get("ProductSpecifications"),
        productPTAApproved: element.get("ProductPTAApproved"),
        buyerUid: element.get("BuyerUid"),
        sellerStatus: element.get("SellerStatus"),
        productAccepted: element.get("Accepted"),
      );
      newList.add(cartModel);
    }
    soldProductDataList = newList;
    notifyListeners();
  }

  List<SoldProductModel> get getSoldProductDataList {
    return soldProductDataList;
  }
}
