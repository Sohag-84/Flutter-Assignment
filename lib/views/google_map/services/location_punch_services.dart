import 'dart:convert';
import 'dart:developer';

import 'package:flutter_task/model/location_model.dart';
import 'package:flutter_task/utils/utils.dart';
import 'package:http/http.dart' as http;

class LocationPunchServices {
  Future<void> submitPunch(
      {required double latitude, required double longitude}) async {
    final response = await http.post(
      Uri.parse("https://www.akijpipes.com/api/lat-long"),
      body: {
        "user_id": "84",
        "lat": latitude.toString(),
        "long": longitude.toString()
      },
    );
    if (response.statusCode == 201) {
      final jsonData = jsonDecode(response.body);
      snackBar(title: "Success", description: jsonData['message']);
      log("Response data: ${response.body}");
    } else {
      log("Error in submitting punch.${response.statusCode}");
    }
  }

  Future getSubmittedPunches() async {
    final response = await http.get(
      Uri.parse("https://www.akijpipes.com/api/lat-long/84"),
    );

    if (response.statusCode == 200) {
      final jsonData = jsonDecode(response.body);
      return LocationModel.fromJson(jsonData);
    } else {
      log("Error in getting submitted punches");
    }
  }
}
