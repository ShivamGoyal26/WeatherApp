import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weatherApp/providers/locator.dart';
import 'package:weatherApp/screens/get_location_screen.dart';

class UserDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: Colors.transparent,
        child: Column(
          children: [
            SizedBox(
              height: 50,
            ),
            Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16), color: Colors.black),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  "Your Current Location",
                  style: TextStyle(fontSize: 16, color: Colors.white),
                ),
              ),
            ),
            SizedBox(
              height: 8,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.black,
                      width: 2.0,
                    ),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(Provider.of<LocatorFinder>(context)
                        .currentUserLocation),
                  )),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    color: Colors.black),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.location_pin,
                        color: Colors.white,
                      ),
                      FlatButton(
                        onPressed: () {
                          Navigator.of(context)
                              .pushNamed(GetLocationScreen.routeName);
                        },
                        child: Text(
                          "Get Any Location",
                          style: TextStyle(fontSize: 16, color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
