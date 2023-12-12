import 'dart:developer';

import 'package:http/http.dart' as http;

class LocationPunchServices {
  Future<void> submitPunch(
      {required double latitude, required double longitude}) async {
    final response = await http.post(
      Uri.parse("https://www.akijpipes.com/api/lat-long"),
      body: {
        "user_id": "111",
        "lat": latitude.toString(),
        "long": longitude.toString()
      },
    );

    if (response.statusCode == 200) {
      log("Punch submitted successfully");
      log("Response data: ${response.body}");
    } else {
      log("Error in submitting punch");
    }
  }

  Future<void> getSubmittedPunches() async {
    final response = await http.get(
      Uri.parse("https://www.akijpipes.com/api/lat-long/111"),
    );

    if (response.statusCode == 200) {
      log(response.body);
    } else {
      log("Error in getting submitted punches");
    }
  }
}
