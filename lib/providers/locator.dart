import 'package:flutter/cupertino.dart';
import 'package:geocoder/geocoder.dart';
import 'package:geolocator/geolocator.dart';

class LocatorFinder with ChangeNotifier {
  Coordinates coordinates;

  var addresses;

  String addressOne = "N/A";

  String addressTwo = "N/A";

  getCurrentLocation() async {
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.best);
    print(position);
    coordinates = Coordinates(position.latitude, position.longitude);
    convertGeoCodeToAddress(coordinates);
  }

  convertGeoCodeToAddress(Coordinates coordinates) async {
    try {
      addresses =
          await Geocoder.local.findAddressesFromCoordinates(coordinates);
      addressOne = addresses.first.featureName;
      addressTwo = addresses.first.addressLine;
      notifyListeners();
    } catch (error) {
      throw (error);
    }
  }
}
