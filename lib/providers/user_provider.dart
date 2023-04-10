import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:mobidthrift_seller_center/models/user_model.dart';

class UserProvider with ChangeNotifier {
  ///********************** User Data *********************///

  String? userUid;

  dataUser() {
    FirebaseFirestore.instance.collection("users").get().then(
      (querySnapshot) {
        for (var docSnapshot in querySnapshot.docs) {
          UserModel userModel = UserModel(
            uId: docSnapshot.id,
          );

          userUid = userModel.uId;
        }
      },
      onError: (e) => print("Error completing: $e"),
    );
  }
}
