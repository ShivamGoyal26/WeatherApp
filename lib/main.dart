import 'package:flutter/material.dart';
import 'package:weatherApp/HomeScreen.dart';
import 'package:provider/provider.dart';
import 'package:weatherApp/providers/weather_API.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(
          value: WeatherApi(),
        ),
      ],
      child: MaterialApp(
        theme: ThemeData(
          fontFamily: 'Lato',
        ),
        debugShowCheckedModeBanner: false,
        title: "Weather",
        home: Consumer<WeatherApi>(
          builder: (ctx, data, _) => Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/images/${data.weather}.png'),
                    fit: BoxFit.cover),
              ),
              child: HomeScreen()),
        ),
      ),
    );
  }
}
