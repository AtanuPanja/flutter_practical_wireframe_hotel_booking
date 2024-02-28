import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart'; // used to get the latitude and longitude of the current location of the device

// function to get location permissions
Future<bool> getLocationPermission(BuildContext context) async {
  // if location services are off, this will return false
  bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
  if (!serviceEnabled) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text(
          'Please enable location services. The location services are disabled.',
        ),
      ),
    );
    return false;
  }

  // if location services are enabled, the app asks for permission, to access the location
  // if denied access, Snackbars show the message, that location was not allowed.
  LocationPermission permission = await Geolocator.checkPermission();
  if (permission == LocationPermission.denied) {
    permission = await Geolocator.requestPermission();

    if (permission == LocationPermission.denied) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
            'Location permission was denied',
          ),
        ),
      );
      return false;
    }
  }

  if (permission == LocationPermission.deniedForever) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text(
          'Location permissions are permanently denied, we cannot request permissions.',
        ),
      ),
    );
    return false;
  }
  return true;
}

Future<Map<String, double>> getCurrentLocation() async {
  Position position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);

  var result = {
    'latitude': position.latitude,
    'longitude': position.longitude,
  };
  return result;
}
