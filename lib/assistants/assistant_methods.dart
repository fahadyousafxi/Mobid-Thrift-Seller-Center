import 'package:geolocator/geolocator.dart';
import 'package:mobidthrift_seller_center/assistants/request_assistant.dart';
import 'package:provider/provider.dart';

import '../models/directions_model.dart';
import '../providers/app_info_provider.dart';

String mapKey = 'AIzaSyAG2LS9DWgKSrmf920KNkhlOy3nb_2MA1w';

class AssistantMethods {
  static Future<String> reverseGeocoding(Position position, context) async {
    String apiUrl =
        'https://maps.googleapis.com/maps/api/geocode/json?latlng=${position.latitude},${position.longitude}&key=$mapKey';
    String readableAddress = '';
    var requestResponse = await RequestAssistant.receiveRequest(apiUrl);
    if (requestResponse != 'Error Occurred') {
      readableAddress = requestResponse['results'][0]['formatted_address'];

      DirectionsModel sellerPickUpAddress = DirectionsModel();
      sellerPickUpAddress.locationLatitude = position.latitude;
      sellerPickUpAddress.locationLongitude = position.longitude;
      sellerPickUpAddress.locationName = readableAddress;

      Provider.of<AppInfoProvider>(context, listen: false)
          .updatePickUpLocation(sellerPickUpAddress);
    }
    return readableAddress;
  }
}
