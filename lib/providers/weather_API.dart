import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';

class WeatherApi with ChangeNotifier {
  WeatherApi() {
    fetchSearch("Los angeles");
  }

  bool isLoading = false;

  String abbrevation = '';

  String searchApiUrl =
      'https://www.metaweather.com/api/location/search/?query=';

  String locationApiUrl = 'https://www.metaweather.com/api/location/';

  // int woeid = 28743736;

  String location = "Delhi";

  int temperature = 0;

  String weather = 'clear';

  var minTempForcast = List(7);
  var maxTempForcast = List(7);
  var abbreviationForcast = List(7);

  fetchSearch(String input) async {
    isLoading = true;
    notifyListeners();
    try {
      var searchResult = await http.get(searchApiUrl + input);
      var result = json.decode(searchResult.body)[0];
      location = result['title'];
      await fetchLocation(result['woeid'].toString());
      await fetchLocationDay(result['woeid'].toString());
      isLoading = false;
      notifyListeners();
    } catch (error) {
      isLoading = false;
      notifyListeners();
      throw (error);
    }
  }

  fetchLocationDay(String woeid) async {
    var today = DateTime.now();
    for (var i = 0; i < 7; i++) {
      var locationDayResult = await http.get(locationApiUrl +
          woeid.toString() +
          '/' +
          DateFormat('y/M/d')
              .format(today.add(new Duration(days: i + 1)))
              .toString());
      var result = json.decode(locationDayResult.body);
      var data = result[0];
      minTempForcast[i] = data["min_temp"].round();
      maxTempForcast[i] = data["max_temp"].round();
      abbreviationForcast[i] = data['weather_state_abbr'];
    }
    print(abbreviationForcast);
  }

  fetchLocation(String woeid) async {
    var locationResult = await http.get(locationApiUrl + woeid.toString());
    var result = json.decode(locationResult.body);
    var consolidatedWeather = result['consolidated_weather'];
    var data = consolidatedWeather[0];
    temperature = data['the_temp'].round();
    weather = data['weather_state_name'].replaceAll(" ", "").toLowerCase();
    abbrevation = data['weather_state_abbr'];
  }
}
