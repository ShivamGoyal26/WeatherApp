import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weatherApp/providers/weather_API.dart';
import 'package:weatherApp/widgets/forecast_element.dart';
import 'package:weatherApp/widgets/user_drawer.dart';
import './providers/locator.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final data = Provider.of<WeatherApi>(context);
    return Scaffold(
        drawer: UserDrawer(),
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0.0,
          actions: [
            Consumer<LocatorFinder>(
              builder: (ctx, data, _) => data.currentLocationspiner
                  ? Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Center(
                        child: CircularProgressIndicator(
                          valueColor: AlwaysStoppedAnimation(Colors.white),
                        ),
                      ),
                    )
                  : GestureDetector(
                      onTap: () {
                        Provider.of<LocatorFinder>(context, listen: false)
                            .getCurrentLocation();
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Icon(Icons.location_city, size: 36.0),
                      ),
                    ),
            ),
          ],
        ),
        backgroundColor: Colors.black54,
        body: data.isLoading
            ? Center(
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation(Colors.white),
                ),
              )
            : SingleChildScrollView(
                child: Column(
                  children: [
                    Column(
                      children: [
                        Center(
                          child: Image.network(
                            'https://www.metaweather.com//static/img/weather/png/${data.abbrevation}.png',
                            width: 100,
                          ),
                        ),
                        SizedBox(height: 10),
                        Center(
                          child: Text(data.temperature.toString() + ' °C',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 40)),
                        ),
                        SizedBox(height: 30),
                        Text(
                          data.location,
                          style: TextStyle(color: Colors.white, fontSize: 40),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 50,
                    ),
                    Container(
                      height: 230,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: 7,
                        itemBuilder: (context, index) => ForecastElement(
                          index: index,
                          abbr: data.abbreviationForcast[index],
                          minTemp: data.minTempForcast[index],
                          maxTemp: data.maxTempForcast[index],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 50,
                    ),
                    Column(
                      children: <Widget>[
                        Container(
                          width: 300,
                          child: TextField(
                            onSubmitted: (String input) async {
                              try {
                                await data.fetchSearch(input);
                              } catch (error) {
                                showDialog(
                                  context: context,
                                  builder: (ctx) => AlertDialog(
                                    title: Text(
                                        'Oops Sorry for the inconvenience!'),
                                    content: Text(
                                        "We don't have data about this city. Try another one."),
                                    actions: [
                                      FlatButton(
                                          onPressed: () {
                                            Navigator.of(context).pop();
                                          },
                                          child: Text("Okay"))
                                    ],
                                  ),
                                );
                              }
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
                    ),
                  ],
                ),
              ));
  }
}
