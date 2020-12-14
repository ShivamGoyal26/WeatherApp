import 'package:flutter/material.dart';
import 'package:geocoder/geocoder.dart';
import 'package:provider/provider.dart';
import 'package:weatherApp/providers/locator.dart';
import 'package:weatherApp/widgets/get_location_details.dart';
import 'package:weatherApp/widgets/user_drawer.dart';

class GetLocationScreen extends StatefulWidget {
  static const routeName = '/getLocationScreen';

  @override
  _GetLocationScreenState createState() => _GetLocationScreenState();
}

class _GetLocationScreenState extends State<GetLocationScreen> {
  TextEditingController _latitude = TextEditingController();

  TextEditingController _longitude = TextEditingController();

  final _key = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    LocatorFinder data = Provider.of<LocatorFinder>(context, listen: false);
    return Scaffold(
      drawer: UserDrawer(),
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text("Find Your Place"),
      ),
      body: Column(
        children: [
          Container(
            child: Form(
              key: _key,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    TextFormField(
                      controller: _latitude,
                      textInputAction: TextInputAction.next,
                      keyboardType: TextInputType.number,
                      validator: (value) {
                        if (value.isEmpty) {
                          return "Please enter the latitude";
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                          labelText: 'Latitude',
                          prefixIcon: Icon(Icons.location_city_rounded)),
                    ),
                    TextFormField(
                      controller: _longitude,
                      keyboardType: TextInputType.number,
                      validator: (value) {
                        if (value.isEmpty) {
                          return "Please enter the longitude";
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                          labelText: 'Longitude',
                          prefixIcon: Icon(Icons.location_city_rounded)),
                    ),
                    SizedBox(height: 30),
                    FlatButton(
                      onPressed: () async {
                        final isValid = _key.currentState.validate();
                        if (!isValid) {
                          return;
                        }
                        final coordinates = Coordinates(
                            double.parse(_latitude.text),
                            double.parse(_longitude.text));
                        try {
                          await data.convertGeoCodeToAddress(coordinates);
                        } catch (error) {
                          showDialog(
                            context: context,
                            builder: (ctx) => AlertDialog(
                              title: Text('Oops Sorry for the inconvenience!'),
                              content:
                                  Text("Somthing Went Wrong Please try again!"),
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
                      child: Text("Get Location"),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18.0),
                        side: BorderSide(color: Theme.of(context).primaryColor),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          GetLocationDetail(),
        ],
      ),
    );
  }
}
