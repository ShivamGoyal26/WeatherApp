import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  int temp = 0;
  String location = 'Delhi';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Column(
            children: [
              Center(
                child: Text(temp.toString() + ' °C',
                    style: TextStyle(color: Colors.white, fontSize: 60.0)),
              ),
              SizedBox(
                height: 30,
              ),
              Text(
                location,
                style: TextStyle(color: Colors.white, fontSize: 40),
              ),
            ],
          ),
          Column(
            children: <Widget>[
              Container(
                width: 300,
                child: TextField(
                  style: TextStyle(color: Colors.white, fontSize: 17),
                  decoration: InputDecoration(
                      hintText: "Seach another location...",
                      hintStyle: TextStyle(color: Colors.white),
                      prefixIcon: Icon(
                        Icons.search,
                        color: Colors.white,
                      )),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
