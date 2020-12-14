import 'package:flutter/cupertino.dart';
import 'package:geolocator/geolocator.dart';

class Locator with ChangeNotifier {
  getCurrentLocation() async {
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.best);
    print(position);
  }
}
