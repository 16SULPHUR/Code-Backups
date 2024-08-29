import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'home.dart';
import 'login.dart';
import 'register.dart';
import 'welcome.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String email = "";

  Future<void> getLoginDetails() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? spemail = prefs.getString('user_email');
    setState(() {
      email = spemail.toString();
    });
  }

  @override
  void initState() async {
    super.initState();
    await getLoginDetails();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Auth UI',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const WelcomeScreen(),
        '/login': (context) => LoginScreen(),
        '/signup': (context) => const SignUpScreen(),
        '/home': (context) => HomePage(
              email: email,
            ),
      },
    );
  }
}
