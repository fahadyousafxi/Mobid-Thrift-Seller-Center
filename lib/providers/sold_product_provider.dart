import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';

import '../models/sold_product_model.dart';

class SoldProductProvider with ChangeNotifier {
  final _firebaseFireStore = FirebaseFirestore.instance;
  SoldProductModel? productModel;

  List<SoldProductModel> searchProductsList = [];

  productModels(QueryDocumentSnapshot element) {
    productModel = SoldProductModel(
      productImage1: element.get("productImage1"),
      buyerUid: element.get("productBuyer"),
      productName: element.get("productName"),
      productDescription: element.get("productDescription"),
      productCurrentBid: element.get("productCurrentBid"),
      productUid: element.get("productUid"),
      productCollectionName: element.get("productCollectionName"),
      productPTAApproved: element.get("productPTAApproved"),
      productShipping: element.get("productShipping"),
      productSpecification: element.get("productSpecification"),
      productPrice: element.get("productPrice"),
      bidEndTimeInSeconds: element.get("BidEndTimeInSeconds"),
      isStartingBid: element.get("IsStartingBid"),
      buyerName: element.get("BuyerName"),
      buyerEmail: element.get("BuyerEmail"),
      buyerAddress: element.get("BuyerAddress"),
      buyerPhoneNumber: element.get("BuyerPhoneNumber"),
      accepted: element.get("Accepted"),
    );
    searchProductsList.add(productModel!);
  }

  ///********************** Cell Phones Products *********************///

  List<SoldProductModel> cellPhonesProductsList = [];
  fitchCellPhonesProducts() async {
    List<SoldProductModel> newList = [];
    QuerySnapshot snapshot = await _firebaseFireStore
        .collection("CellPhonesProducts")
        .where('productSold', isEqualTo: true)
        .get();

    for (var element in snapshot.docs) {
      productModels(element);
      // productModel = ProductModel(
      //   productImage1: element.get("productImage1"),
      //   productName: element.get("productName"),
      //   productDescription: element.get("productDescription"),
      //   productCurrentBid: element.get("productCurrentBid"),
      //   // bidDateTimeLeft: element.get("bidDateTimeLeft"),
      // );
      newList.add(productModel!);
    }
    cellPhonesProductsList = newList;
    notifyListeners();
  }

  List<SoldProductModel> get getCellPhonesProductsList {
    return cellPhonesProductsList;
  }

  ///********************** Pads Tablets Products *********************///

  List<SoldProductModel> padsTabletsProductsList = [];

  fitchPadsTabletsProducts() async {
    List<SoldProductModel> newList = [];
    QuerySnapshot snapshot = await _firebaseFireStore
        .collection("PadsAndTabletsProducts")
        .where('productSold', isEqualTo: true)
        .get();

    for (var element in snapshot.docs) {
      productModels(element);
      newList.add(productModel!);
    }
    padsTabletsProductsList = newList;
    notifyListeners();
  }

  List<SoldProductModel> get getPadsTabletsProductsList {
    return padsTabletsProductsList;
  }

  ///********************** Laptops Products *********************///

  List<SoldProductModel> laptopsProductsList = [];

  fitchLaptopsProducts() async {
    List<SoldProductModel> newList = [];
    QuerySnapshot snapshot = await _firebaseFireStore
        .collection("LaptopsProducts")
        .where('productSold', isEqualTo: true)
        .get();

    for (var element in snapshot.docs) {
      productModels(element);
      newList.add(productModel!);
    }

    laptopsProductsList = newList;
    notifyListeners();
  }

  List<SoldProductModel> get getLaptopsProductsList {
    return laptopsProductsList;
  }

  ///********************** Smart Watches Products *********************///

  List<SoldProductModel> smartWatchesProductsList = [];

  fitchSmartWatchesProducts() async {
    List<SoldProductModel> newList = [];
    QuerySnapshot snapshot = await _firebaseFireStore
        .collection("SmartWatches")
        .where('productSold', isEqualTo: true)
        .get();

    for (var element in snapshot.docs) {
      productModels(element);
      newList.add(productModel!);
    }
    smartWatchesProductsList = newList;
    notifyListeners();
  }

  List<SoldProductModel> get getSmartWatchesProductsList {
    return smartWatchesProductsList;
  }

  ///********************** Desktops Products *********************///

  List<SoldProductModel> desktopsProductsList = [];

  fitchDesktopsProducts() async {
    List<SoldProductModel> newList = [];
    QuerySnapshot snapshot = await _firebaseFireStore
        .collection("Desktops")
        .where('productSold', isEqualTo: true)
        .get();

    for (var element in snapshot.docs) {
      productModels(element);
      newList.add(productModel!);
    }
    desktopsProductsList = newList;
    notifyListeners();
  }

  List<SoldProductModel> get getDesktopsProductsList {
    return desktopsProductsList;
  }

  ///********************** Accessories Products *********************///

  List<SoldProductModel> accessoriesProductsList = [];

  fitchAccessoriesProducts() async {
    List<SoldProductModel> newList = [];
    QuerySnapshot snapshot = await _firebaseFireStore
        .collection("Accessories")
        .where('productSold', isEqualTo: true)
        .get();

    for (var element in snapshot.docs) {
      productModels(element);
      newList.add(productModel!);
    }
    accessoriesProductsList = newList;
    notifyListeners();
  }

  List<SoldProductModel> get getAccessoriesProductsList {
    return accessoriesProductsList;
  }

  ///********************** Parts Products *********************///

  List<SoldProductModel> partsProductsList = [];

  fitchPartsProducts() async {
    List<SoldProductModel> newList = [];
    QuerySnapshot snapshot = await _firebaseFireStore
        .collection("Parts")
        .where('productSold', isEqualTo: true)
        .get();

    for (var element in snapshot.docs) {
      productModels(element);
      newList.add(productModel!);
    }
    partsProductsList = newList;
    notifyListeners();
  }

  List<SoldProductModel> get getPartsProductsList {
    return partsProductsList;
  }

  ///********************** Search Products *********************///

  List<SoldProductModel> get getSearchProductsList {
    return searchProductsList;
  }
}

// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/cupertino.dart';
//
// import '../models/sold_product_model.dart';
//
// class SoldProductProvider with ChangeNotifier {
//   final _auth = FirebaseAuth.instance.currentUser!.uid.toString();
//   List<SoldProductModel> soldProductDataList = [];
//
//   void getSoldProductData() async {
//     List<SoldProductModel> newList = [];
//     QuerySnapshot soldProductData = await FirebaseFirestore.instance
//         .collection("SoldProducts")
//         .where('ShopKeeperUid', isEqualTo: _auth)
//         .where(
//           'Accepted',
//           isEqualTo: true,
//         )
//         .get();
//
//     for (var element in soldProductData.docs) {
//       SoldProductModel cartModel = SoldProductModel(
//         productImage1: element.get("ProductImage"),
//         productName: element.get("ProductName"),
//         productDescription: element.get("ProductDescription"),
//         productUid: element.get("ProductUid"),
//         shopkeeperUid: element.get("ShopKeeperUid"),
//         productPrice: element.get("ProductPrice"),
//         productShipping: element.get("ProductShipping"),
//         productSpecification: element.get("ProductSpecifications"),
//         productPTAApproved: element.get("ProductPTAApproved"),
//         buyerUid: element.get("BuyerUid"),
//         sellerStatus: element.get("SellerStatus"),
//         productAccepted: element.get("Accepted"),
//       );
//       newList.add(cartModel);
//     }
//     soldProductDataList = newList;
//     notifyListeners();
//   }
//
//   List<SoldProductModel> get getSoldProductDataList {
//     return soldProductDataList;
//   }
// }
