import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import '../../services/map_service.dart';

class PassengerHomeScreen extends StatefulWidget {
  @override
  _PassengerHomeScreenState createState() => _PassengerHomeScreenState();
}

class _PassengerHomeScreenState extends State<PassengerHomeScreen> {
  GoogleMapController? _mapController;
  MapService _mapService = MapService();
  LatLng _initial = LatLng(35.6892, 51.3890); // placeholder

  @override
  void initState() {
    super.initState();
    _locate();
  }

  void _locate() async {
    try {
      final pos = await _mapService.getCurrentLocation();
      setState(() {
        _initial = LatLng(pos.latitude, pos.longitude);
      });
      _mapController?.animateCamera(CameraUpdate.newLatLng(_initial));
    } catch (e) {
      print('loc error $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Passenger')),
      body: Stack(
        children: [
          GoogleMap(
            initialCameraPosition: CameraPosition(target: _initial, zoom: 14),
            myLocationEnabled: true,
            onMapCreated: (c) => _mapController = c,
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: ElevatedButton(onPressed: () {/* request ride flow */}, child: Text('Request Ride')),
            ),
          )
        ],
      ),
    );
  }
}