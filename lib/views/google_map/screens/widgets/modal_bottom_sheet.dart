// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_task/model/location_model.dart';

import '../../services/location_punch_services.dart';

Future<dynamic> modalBottomSheet(BuildContext context) {
  return showModalBottomSheet(
    context: context,
    builder: (BuildContext context) {
      return Column(
        children: [
          SizedBox(height: 10),
          Text(
            "Your(id: 84) Location List",
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w500,
            ),
          ),
          SizedBox(height: 10),
          Expanded(
            child: FutureBuilder(
              future: LocationPunchServices().getSubmittedPunches(),
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  return Center(child: CircularProgressIndicator());
                } else if (snapshot.data.data.isEmpty) {
                  return Center(
                    child: Text("No location found"),
                  );
                } else {
                  return ListView.builder(
                    itemCount: snapshot.data.data.length,
                    itemBuilder: (context, index) {
                      LocationModel location = snapshot.data;
                      Datum data = location.data[index];
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Card(
                          child: ListTile(
                            leading: CircleAvatar(
                              child: Text(data.id.toString()),
                            ),
                            title: Text(
                              "lat: ${data.lat}",
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            subtitle: Text(
                              "long: ${data.long}",
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  );
                }
              },
            ),
          ),
        ],
      );
    },
  );
}
