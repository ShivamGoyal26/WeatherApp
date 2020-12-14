import 'package:flutter/cupertino.dart';
import 'package:geocoder/geocoder.dart';
import 'package:geolocator/geolocator.dart';

class LocatorFinder with ChangeNotifier {
  Coordinates coordinates;

  var addresses;

  String addressOne;

  String addressTwo;

  getCurrentLocation() async {
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.best);
    print(position);
    coordinates = Coordinates(position.latitude, position.longitude);
    convertGeoCodeToAddress(coordinates);
  }

  convertGeoCodeToAddress(Coordinates coordinates) async {
    addresses = await Geocoder.local.findAddressesFromCoordinates(coordinates);
    addressOne = addresses.first.featureName;
    addressTwo = addresses.first.addressLine;
    print(addressOne);
    print(addressTwo);
  }
}
