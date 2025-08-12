import 'package:flutter/material.dart';

class PassengerSmartRouteScreen extends StatefulWidget {
  final String startLocation;
  final String destination;

  const PassengerSmartRouteScreen({
    super.key,
    required this.startLocation,
    required this.destination,
  });

  @override
  State<PassengerSmartRouteScreen> createState() =>
      _PassengerSmartRouteScreenState();
}

class _PassengerSmartRouteScreenState extends State<PassengerSmartRouteScreen> {
  String selectedRoute = "";

  // شبیه‌سازی سه نوع مسیر پیشنهادی
  final List<Map<String, dynamic>> routeOptions = [
    {
      "type": "سریع‌ترین مسیر",
      "time": "15 دقیقه",
      "price": "50,000 تومان",
      "traffic": "کم"
    },
    {
      "type": "ارزان‌ترین مسیر",
      "time": "20 دقیقه",
      "price": "35,000 تومان",
      "traffic": "متوسط"
    },
    {
      "type": "مسیر با مناظر زیبا",
      "time": "25 دقیقه",
      "price": "55,000 تومان",
      "traffic": "کم"
    },
  ];

  void selectRoute(int index) {
    setState(() {
      selectedRoute = routeOptions[index]["type"];
    });
  }

  void confirmRoute() {
    if (selectedRoute.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("لطفاً یک مسیر را انتخاب کنید")),
      );
      return;
    }

    // اینجا میشه انتخاب مسافر رو به راننده ارسال کرد
    Navigator.pop(context, selectedRoute);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("انتخاب مسیر هوشمند"),
        backgroundColor: Colors.green,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Text(
              "مبدا: ${widget.startLocation}\nمقصد: ${widget.destination}",
              style: const TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: routeOptions.length,
                itemBuilder: (context, index) {
                  final route = routeOptions[index];
                  return Card(
                    child: ListTile(
                      title: Text(route["type"]),
                      subtitle: Text(
                          "زمان: ${route["time"]} | قیمت: ${route["price"]} | ترافیک: ${route["traffic"]}"),
                      trailing: Radio<String>(
                        value: route["type"],
                        groupValue: selectedRoute,
                        onChanged: (_) => selectRoute(index),
                      ),
                    ),
                  );
                },
              ),
            ),
            ElevatedButton(
              onPressed: confirmRoute,
              style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
              child: const Text("تایید مسیر"),
            )
          ],
        ),
      ),
    );
  }
}
