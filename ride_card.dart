import 'package:flutter/material.dart';
import '../models/ride.dart';

class RideCard extends StatelessWidget {
  final Ride ride;
  final VoidCallback onAccept;
  RideCard({required this.ride, required this.onAccept});
  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text('Ride ${ride.id}'),
        subtitle: Text('From: ${ride.fromLat},${ride.fromLng}\nTo: ${ride.toLat},${ride.toLng}'),
        trailing: ElevatedButton(onPressed: onAccept, child: Text('Accept')),
      ),
    );
  }
}