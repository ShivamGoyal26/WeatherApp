import 'package:flutter/material.dart';
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
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Icon(
                    Icons.location_pin,
                  ),
                  FlatButton(
                    onPressed: () {
                      Navigator.of(context)
                          .pushNamed(GetLocationScreen.routeName);
                    },
                    child: Text(
                      "Get Location",
                      style: TextStyle(fontSize: 22),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
