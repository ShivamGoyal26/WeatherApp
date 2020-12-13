import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

class WeatherApi with ChangeNotifier {
  bool isLoading = false;
  String searchApiUrl =
      'https://www.metaweather.com/api/location/search/?query=';

  String locationApiUrl = 'https://www.metaweather.com/api/location/';

  int woeid = 28743736;

  String location = "Delhi";

  int temperature = 0;

  String weather = 'clear';

  void fetchSearch(String input) async {
    isLoading = true;
    notifyListeners();
    var searchResult = await http.get(searchApiUrl + input);
    var result = json.decode(searchResult.body)[0];
    print(result);
    location = result['title'];
    fetchLocation(result['woeid'].toString());
    notifyListeners();
  }

  void fetchLocation(String woeid) async {
    var locationResult = await http.get(locationApiUrl + woeid.toString());
    var result = json.decode(locationResult.body);
    print(result);
    var consolidatedWeather = result['consolidated_weather'];
    var data = consolidatedWeather[0];
    temperature = data['the_temp'].round();
    weather = data['weather_state_name'].replaceAll(" ", "").toLowerCase();
    notifyListeners();
    isLoading = false;
  }
}
