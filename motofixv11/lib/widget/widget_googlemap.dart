import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:permission_handler/permission_handler.dart' as permission_handler;

class GoogleMapWidget extends StatefulWidget {
  @override
  _GoogleMapWidgetState createState() => _GoogleMapWidgetState();
}

class _GoogleMapWidgetState extends State<GoogleMapWidget> {
  GoogleMapController? mapController;
  Location location = Location();

  @override
  void initState() {
    super.initState();
    getCurrentLocation();
  }

  Future<void> getCurrentLocation() async {
    bool serviceEnabled;
    permission_handler.PermissionStatus locationPermissionStatus;
    LocationData? locationData;

    // Check if location service is enabled
    serviceEnabled = await location.serviceEnabled();
    if (!serviceEnabled) {
      serviceEnabled = await location.requestService();
      if (!serviceEnabled) {
        // Handle case when location service is not enabled
        return;
      }
    }

    // Request location permission
    locationPermissionStatus = await _requestLocationPermission();
    if (locationPermissionStatus != permission_handler.PermissionStatus.granted) {
      // Handle case when location permission is not granted
      return;
    }

    // Get current location
    try {
      locationData = await location.getLocation();
      LatLng currentLatLng = LatLng(locationData.latitude!, locationData.longitude!);

      // Update the camera position
      mapController?.moveCamera(CameraUpdate.newLatLngZoom(currentLatLng, 12));
    } catch (e) {
      // Handle case when unable to get the current location
      print('Error getting current location: $e');
    }
  }

  Future<permission_handler.PermissionStatus> _requestLocationPermission() async {
    final status = await permission_handler.Permission.locationWhenInUse.request();
    return status;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: GoogleMap(
        initialCameraPosition: CameraPosition(
          target: LatLng(37.7749, -122.4194), // Default location (San Francisco)
          zoom: 12,
        ),
        onMapCreated: (controller) {
          setState(() {
            mapController = controller;
          });
        },
      ),
    );
  }
}
