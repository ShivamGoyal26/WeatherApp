import 'package:flutter/cupertino.dart';
import 'package:geocoder/geocoder.dart';
import 'package:geolocator/geolocator.dart';

class LocatorFinder with ChangeNotifier {
  Coordinates coordinates;

  var addresses;
  bool isLoading = false;
  String currentUserLocation = "N/A";
  bool currentLocationspiner = false;

  String addressLine = "N/A";
  String countryName = "N/A";
  String countryCode = "N/A";
  String adminArea = "N/A";
  String postalCode = "N/A";
  String featureName = 'N/A';

  getCurrentLocation() async {
    currentLocationspiner = true;
    notifyListeners();
    try {
      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.best);

      coordinates = Coordinates(position.latitude, position.longitude);
      await currentLocation(coordinates);
      currentLocationspiner = false;
      notifyListeners();
    } catch (error) {
      currentLocationspiner = false;
      notifyListeners();
      print(error);
    }
  }

  currentLocation(Coordinates coordinates) async {
    try {
      final result =
          await Geocoder.local.findAddressesFromCoordinates(coordinates);
      currentUserLocation = result.first.addressLine;
      notifyListeners();
    } catch (error) {
      currentUserLocation = 'N/A';
      notifyListeners();
    }
  }

  convertGeoCodeToAddress(Coordinates coordinates) async {
    try {
      isLoading = true;
      notifyListeners();
      addresses =
          await Geocoder.local.findAddressesFromCoordinates(coordinates);
      featureName = addresses.first.featureName;
      addressLine = addresses.first.addressLine;
      countryCode = addresses.first.countryCode;
      countryName = addresses.first.countryName;
      adminArea = addresses.first.adminArea;
      postalCode = addresses.first.postalCode;
      isLoading = false;
      notifyListeners();
    } catch (error) {
      isLoading = false;
      notifyListeners();
      throw (error);
    }
  }
}
