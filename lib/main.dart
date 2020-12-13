import 'package:flutter/material.dart';
import 'package:weatherApp/HomeScreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Weather",
      theme: ThemeData(primarySwatch: Colors.blue),
      home: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/images/clear.png'),
                fit: BoxFit.cover),
          ),
          child: HomeScreen()),
    );
  }
}
