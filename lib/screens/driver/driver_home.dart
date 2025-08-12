import 'package:flutter/material.dart';

class DriverHome extends StatelessWidget {
  const DriverHome({Key? key}) : super(key: key);

  void _goToProfile(BuildContext context) {
    Navigator.pushNamed(context, '/profile');
  }

  void _viewRideRequests(BuildContext context) {
    Navigator.pushNamed(context, '/rideRequests');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('پنل راننده'),
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
              onPressed: () => _viewRideRequests(context),
              icon: const Icon(Icons.list),
              label: const Text('مشاهده درخواست‌های سفر'),
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
