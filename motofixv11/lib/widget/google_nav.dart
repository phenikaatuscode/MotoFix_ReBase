import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:motofixv11/screens/home_page.dart';

class GoogleNav extends StatefulWidget {
  @override
  _GoogleNavState createState() => _GoogleNavState();
}

class _GoogleNavState extends State<GoogleNav> {
  GoogleMapController? _mapController;
  final LatLng _center = const LatLng(37.7749, -122.4194); // Default location (San Francisco)

  void _onMapCreated(GoogleMapController controller) {
    _mapController = controller;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white), onPressed: (
            ) { Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                builder: (context) => HomePage(), // Navigate to the login screen
          ),
        );},
        ),
        title: const Text('Google Map Navigation'),
      ),
      body: GoogleMap(
        onMapCreated: _onMapCreated,
        initialCameraPosition: CameraPosition(
          target: _center,
          zoom: 12,
        ),
      ),
    );
  }
}
