import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weatherApp/providers/locator.dart';

class GetLocationDetail extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final data = Provider.of<LocatorFinder>(context);

    return Expanded(
      child: data.isLoading
          ? Center(
              child: CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation(Colors.black),
            ))
          : SingleChildScrollView(
              child: Column(
                children: [
                  Text(
                    "Your Results...",
                    style: TextStyle(fontSize: 20),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Container(
                    width: double.infinity,
                    child: Card(
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          children: [
                            Text("Feature Name:"),
                            Text(data.featureName ?? "Not Found"),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Container(
                    width: double.infinity,
                    child: Card(
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          children: [
                            Text("Address:"),
                            Text(data.addressLine ?? "Not Found"),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Container(
                    width: double.infinity,
                    child: Card(
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          children: [
                            Text("Country Code:"),
                            Text(data.countryCode ?? "Not Found"),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Container(
                    width: double.infinity,
                    child: Card(
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          children: [
                            Text("Country Name:"),
                            Text(data.countryName ?? "Not Found"),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Container(
                    width: double.infinity,
                    child: Card(
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          children: [
                            Text("State:"),
                            Text(data.adminArea ?? "Not Found"),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Container(
                    width: double.infinity,
                    child: Card(
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          children: [
                            Text("Postal Code:"),
                            Text(data.postalCode ?? "Not Found"),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
    );
  }
}
