import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weatherApp/providers/weather_API.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final data = Provider.of<WeatherApi>(context);
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: data.isLoading
          ? Center(
              child: CircularProgressIndicator(),
            )
          : Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Column(
                  children: [
                    Center(
                      child: Text(data.temperature.toString() + ' °C',
                          style:
                              TextStyle(color: Colors.white, fontSize: 60.0)),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Text(
                      data.location,
                      style: TextStyle(color: Colors.white, fontSize: 40),
                    ),
                  ],
                ),
                Column(
                  children: <Widget>[
                    Container(
                      width: 300,
                      child: TextField(
                        onSubmitted: (String input) {
                          data.fetchSearch(input);
                        },
                        style: TextStyle(color: Colors.white, fontSize: 17),
                        decoration: InputDecoration(
                            hintText: "Seach another location...",
                            hintStyle: TextStyle(color: Colors.white),
                            prefixIcon: Icon(
                              Icons.search,
                              color: Colors.white,
                            )),
                      ),
                    ),
                  ],
                )
              ],
            ),
    );
  }
}
