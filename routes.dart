import 'package:flutter/material.dart';
import 'screens/auth/login_screen.dart';
import 'screens/passenger/passenger_home.dart';
import 'screens/driver/driver_home.dart';
import 'screens/auth/signup_screen.dart';

class Routes {
  static const String login = '/login';
  static const String signup = '/signup';
  static const String passengerHome = '/passenger';
  static const String driverHome = '/driver';

  static Map<String, WidgetBuilder> getRoutes() {
    return {
      login: (_) => LoginScreen(),
      signup: (_) => SignupScreen(),
      passengerHome: (_) => PassengerHomeScreen(),
      driverHome: (_) => DriverHomeScreen(),
    };
  }
}