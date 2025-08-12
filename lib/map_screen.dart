import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({super.key});

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  GoogleMapController? mapController;

  final LatLng _initialPosition = const LatLng(34.5281, 69.1723); // کابل

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("نقشه"),
        backgroundColor: Colors.green,
      ),
      body: GoogleMap(
        onMapCreated: _onMapCreated,
        initialCameraPosition: CameraPosition(
          target: _initialPosition,
          zoom: 14.0,
        ),
        myLocationEnabled: true,
        myLocationButtonEnabled: true,
      ),
    );
  }
}