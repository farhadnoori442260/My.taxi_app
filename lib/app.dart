import 'package:flutter/material.dart';
import 'routes.dart';

class MyTaxiApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My Taxi',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute: Routes.login,
      routes: Routes.getRoutes(),
    );
  }
}
