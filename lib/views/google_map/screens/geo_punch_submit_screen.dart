// ignore_for_file: prefer_const_constructors

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_task/views/google_map/services/location_punch_services.dart';
import 'package:flutter_task/widgets/custom_button.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:permission_handler/permission_handler.dart';

import 'widgets/modal_bottom_sheet.dart';

class GeoPunchSubmitScreen extends StatefulWidget {
  const GeoPunchSubmitScreen({super.key});

  @override
  State<GeoPunchSubmitScreen> createState() => _GeoPunchSubmitScreenState();
}

class _GeoPunchSubmitScreenState extends State<GeoPunchSubmitScreen> {
  Position? _currentPosition;
  bool isWithinRadius = false;

  @override
  void initState() {
    super.initState();
    _getCurrentLocation();
  }

  _getCurrentLocation() async {
    var status = await Permission.location.request();

    if (status == PermissionStatus.granted) {
      Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high,
      );
      setState(() {
        _currentPosition = position;
        isWithinRadius = _isWithinRadius(
          _currentPosition!.latitude,
          _currentPosition!.longitude,
        );
      });
    } else {
      log("User denied location permission");
    }
  }

  bool _isWithinRadius(double latitude, double longitude) {
    double akijHouseLat = 37.7749;
    double akijHouseLong = -122.4194;

    double distance = Geolocator.distanceBetween(
      latitude,
      longitude,
      akijHouseLat,
      akijHouseLong,
    );

    return distance <= 100.0;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Google Map"),
      ),
      body: Column(
        children: [
          Expanded(
            child: _currentPosition == null
                ? Center(child: CircularProgressIndicator())
                : GoogleMap(
                    initialCameraPosition: CameraPosition(
                      target: LatLng(
                        _currentPosition!.latitude,
                        _currentPosition!.longitude,
                      ),
                      zoom: 15,
                    ),
                    markers: {
                      Marker(
                        markerId: MarkerId("currentLocation"),
                        position: LatLng(
                          _currentPosition!.latitude,
                          _currentPosition!.longitude,
                        ),
                        infoWindow: InfoWindow(title: "Your Location"),
                      ),
                    },
                  ),
          ),
          if (_currentPosition != null && isWithinRadius)
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: customButton(
                onTap: () {
                  LocationPunchServices().submitPunch(
                    latitude: _currentPosition!.latitude,
                    longitude: _currentPosition!.longitude,
                  );
                },
                btnName: "Save Location",
              ),
            ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: customButton(
              onTap: () {
                modalBottomSheet(context);
              },
              btnName: "Show Location List",
            ),
          ),
        ],
      ),
    );
  }
}
