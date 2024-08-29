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
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    _initializeApp();
  }

  Future<void> _initializeApp() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? spemail = await prefs.getString('user_email');
    setState(() {
      email = spemail ?? ""; // Ensure email is not null
      isLoading = false; // Update the state to indicate initialization is done
    });
  }

  @override
  Widget build(BuildContext context) {
    // Display a loading indicator while initializing
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
        '/signup': (context) => SignUpScreen(),
        '/home': (context) => HomePage(email: email),
      },
    );
  }
}
