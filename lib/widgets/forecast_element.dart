import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ForecastElement extends StatelessWidget {
  ForecastElement({
    this.abbr,
    this.index,
    this.maxTemp,
    this.minTemp,
  });
  String abbr;
  int minTemp;
  int maxTemp;
  int index;
  DateTime now = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 16.0,
      ),
      child: Container(
        decoration: BoxDecoration(
          color: Color.fromRGBO(205, 212, 228, 0.2),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              Text(
                DateFormat.E().format(now.add(Duration(days: index + 1))),
                style: TextStyle(fontSize: 25, color: Colors.white),
              ),
              Text(
                DateFormat.MMMd().format(now.add(Duration(days: index + 1))),
                style: TextStyle(fontSize: 20, color: Colors.white),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 16.0, bottom: 16.0),
                child: Image.network(
                  'https://www.metaweather.com//static/img/weather/png/$abbr.png',
                  width: 50,
                ),
              ),
              Text(
                'Max: ' + maxTemp.toString() + ' °C',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                ),
              ),
              Text(
                'Min: ' + minTemp.toString() + ' °C',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
