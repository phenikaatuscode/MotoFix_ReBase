import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:motofixv11/screens/home_page.dart';
import 'package:motofixv11/homepage.dart';
class GoogleNav extends StatefulWidget {
  @override
  _GoogleNavState createState() => _GoogleNavState();
}

class _GoogleNavState extends State<GoogleNav> {
  GoogleMapController? _mapController;
  LatLng _center = LatLng(37.7749, -122.4194); // Default location (San Francisco)
  double _zoom = 14;
  Set<Marker> _markers = {}; // Set to hold the markers

  @override
  void initState() {
    super.initState();
    _getCurrentLocation();
  }

  Future<void> _getCurrentLocation() async {
    Location location = Location();

    bool serviceEnabled;
    PermissionStatus permissionGranted;

    // Check if location services are enabled
    serviceEnabled = await location.serviceEnabled();
    if (!serviceEnabled) {
      serviceEnabled = await location.requestService();
      if (!serviceEnabled) {
        return;
      }
    }

    // Check if location permission is granted
    permissionGranted = await location.hasPermission();
    if (permissionGranted == PermissionStatus.denied) {
      permissionGranted = await location.requestPermission();
      if (permissionGranted != PermissionStatus.granted) {
        return;
      }
    }

    LocationData? currentLocation = await location.getLocation();
    if (currentLocation != null) {
      setState(() {
        _center = LatLng(currentLocation.latitude!, currentLocation.longitude!);
        _zoom = 19; // Set a higher zoom level to zoom in on the user's location

        _markers.clear(); // Clear existing markers

        Marker sourceMarker = Marker(
          markerId: MarkerId('source'),
          position: _center,
        );

        _markers.add(sourceMarker); // Add the new source marker
      });

      _mapController?.animateCamera(
        CameraUpdate.newLatLngZoom(_center, _zoom),
      );
    }
  }

  void _onMapCreated(GoogleMapController controller) {
    _mapController = controller;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => MyHomePage(title: 'MotoFix'), // Navigate to the home page
              ),
            );
          },
        ),
        title: const Text('Google Map Navigation'),
      ),
      body: GoogleMap(
        onMapCreated: _onMapCreated,
        initialCameraPosition: CameraPosition(
          target: _center,
          zoom: _zoom,
        ),
        markers: _markers,
      ),
    );
  }
}
