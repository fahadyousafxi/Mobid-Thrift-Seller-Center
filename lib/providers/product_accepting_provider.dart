import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

import '../models/product_accepting_model.dart';

class ProductAcceptingProvider with ChangeNotifier {
  final _auth = FirebaseAuth.instance.currentUser!.uid.toString();
  List<ProductAcceptingModel> productAcceptingDataList = [];

  void getProductAcceptingData() async {
    List<ProductAcceptingModel> newList = [];
    QuerySnapshot productAcceptingData = await FirebaseFirestore.instance
        .collection("SoldProducts")
        .where('ShopKeeperUid', isEqualTo: _auth)
        .get();

    for (var element in productAcceptingData.docs) {
      ProductAcceptingModel cartModel = ProductAcceptingModel(
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
      );
      newList.add(cartModel);
    }
    productAcceptingDataList = newList;
    notifyListeners();
  }

  List<ProductAcceptingModel> get getProductAcceptingDataList {
    return productAcceptingDataList;
  }
}
