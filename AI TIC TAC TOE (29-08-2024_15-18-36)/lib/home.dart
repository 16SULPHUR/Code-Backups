import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

// ignore: must_be_immutable
class HomePage extends StatelessWidget {
  String email;
  HomePage({super.key, required this.email});

  Future<void> logout() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('name', "");
    await prefs.setString('user_email', "");
    await prefs.setString('user_password', "");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Page'),
        actions: [
          IconButton(
            onPressed: () async {
              await logout();

              Navigator.pushNamed(context, '/login');
            },
            icon: const Icon(Icons.logout),
          )
        ],
      ),
      body: Center(
        child: Text(
          'Welcome, $email!',
          style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}