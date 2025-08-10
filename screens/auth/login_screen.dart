import 'package:flutter/material.dart';
import '../../services/auth_service.dart';
import 'package:uuid/uuid.dart';
import '../../routes.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _emailCtrl = TextEditingController();
  final _passCtrl = TextEditingController();
  final AuthService _auth = AuthService();
  bool _loading = false;

  void _login() async {
    setState(() => _loading = true);
    try {
      await _auth.signIn(_emailCtrl.text.trim(), _passCtrl.text.trim());
      // TODO: determine user role (driver/passenger) from Firestore profile
      Navigator.pushReplacementNamed(context, Routes.passengerHome);
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(e.toString())));
    } finally {
      setState(() => _loading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Login')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(controller: _emailCtrl, decoration: InputDecoration(labelText: 'Email')),
            TextField(controller: _passCtrl, decoration: InputDecoration(labelText: 'Password'), obscureText: true),
            SizedBox(height: 20),
            ElevatedButton(onPressed: _loading ? null : _login, child: Text('Login')),
            TextButton(onPressed: () => Navigator.pushNamed(context, Routes.signup), child: Text('Sign up')),
          ],
        ),
      ),
    );
  }
}
