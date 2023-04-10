import 'package:flutter/material.dart';

import '../models/directions_model.dart';

class AppInfoProvider extends ChangeNotifier {
  DirectionsModel? sellerPickUpLocation;

  void updatePickUpLocation(DirectionsModel sellerPickUpAddress) {
    sellerPickUpLocation = sellerPickUpAddress;
    notifyListeners();
  }
}
