import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:mobidthrift_seller_center/models/seller_model.dart';

import '../models/seller_reviews_model.dart';

class SellerProvider with ChangeNotifier {
  SellerModel? sellerModel;

  List<SellerModel> searchProductsList = [];

  productModels(QueryDocumentSnapshot element) {
    sellerModel = SellerModel(
      verification: element.get("Verification"),
      name: element.get("Name"),
      // productDescription: element.get("productDescription"),
      // productCurrentBid: element.get("productCurrentBid"),
      // productUid: element.get("productUid"),
      // productCollectionName: element.get("productCollectionName")
      // bidDateTimeLeft: element.get("bidDateTimeLeft"),
    );
    searchProductsList.add(sellerModel!);
  }

  List<SellerModel> SellerVerificationList = [];
  fitchCellPhonesProducts() async {
    List<SellerModel> newList = [];
    QuerySnapshot snapshot =
        await FirebaseFirestore.instance.collection("CellPhonesProducts").get();

    for (var element in snapshot.docs) {
      productModels(element);
      // productModel = ProductModel(
      //   productImage1: element.get("productImage1"),
      //   productName: element.get("productName"),
      //   productDescription: element.get("productDescription"),
      //   productCurrentBid: element.get("productCurrentBid"),
      //   // bidDateTimeLeft: element.get("bidDateTimeLeft"),
      // );
      newList.add(sellerModel!);
    }
    SellerVerificationList = newList;
    notifyListeners();
  }

  List<SellerModel> get getSellerVerificationList {
    return SellerVerificationList;
  }

  ///*************************  Reviews  *****************************

  List<SellerReviewsModel> sellerReviewsDataList = [];

  void getSellerReviewsData(String productShopkeeperUid) async {
    List<SellerReviewsModel> newList = [];
    QuerySnapshot sellerReviewsData = await FirebaseFirestore.instance
        .collection("SellerCenterUsers")
        .doc(productShopkeeperUid)
        .collection('Reviews')
        .get();

    for (var element in sellerReviewsData.docs) {
      SellerReviewsModel sellerReviewModel = SellerReviewsModel(
        name: element.get("User_Name"),

        reviewRating: element.get("My_Review_Rating"),
        review: element.get("User_Review"),
        timeInMilliseconds: element.get("Review_Timing_In_Milliseconds"),
        // cartUid: element.get("cartUid"),
      );
      newList.add(sellerReviewModel);
    }
    sellerReviewsDataList = newList;
    notifyListeners();
  }

  List<SellerReviewsModel> get getSellerReviewsDataList {
    return sellerReviewsDataList;
  }
}
