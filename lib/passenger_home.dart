import 'package:flutter/material.dart';

class PassengerHome extends StatelessWidget {
  const PassengerHome({Key? key}) : super(key: key);

  void _goToProfile(BuildContext context) {
    Navigator.pushNamed(context, '/profile');
  }

  void _requestRide(BuildContext context) {
    Navigator.pushNamed(context, '/rideRequest');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('پنل مسافر'),
        actions: [
          IconButton(
            icon: const Icon(Icons.person),
            onPressed: () => _goToProfile(context),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            ElevatedButton.icon(
              onPressed: () => _requestRide(context),
              icon: const Icon(Icons.local_taxi),
              label: const Text('درخواست سفر جدید'),
              style: ElevatedButton.styleFrom(minimumSize: const Size.fromHeight(50)),
            ),
            const SizedBox(height: 16),
            ElevatedButton.icon(
              onPressed: () {
                // TODO: نمایش موقعیت روی نقشه
                Navigator.pushNamed(context, '/map');
              },
              icon: const Icon(Icons.map),
              label: const Text('نمایش نقشه'),
              style: ElevatedButton.styleFrom(minimumSize: const Size.fromHeight(50)),
            ),
          ],
        ),
      ),
    );
  }
}