import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // Initial theme is EmeraldTheme
  bool _isEmeraldTheme = true;

  void _toggleTheme() {
    setState(() {
      _isEmeraldTheme = !_isEmeraldTheme;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: _isEmeraldTheme ? emeraldTheme : rubyTheme,
      home: MyHomePage(
        onThemeToggle: _toggleTheme,
        themeName: _isEmeraldTheme ? "EmeraldTheme" : "RubyTheme",
      ),
    );
  }
}

class MyHomePage extends StatelessWidget {
  final VoidCallback onThemeToggle;
  final String themeName;

  MyHomePage({required this.onThemeToggle, required this.themeName});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final themeColor = theme.primaryColor;

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: 300,
              child: TextField(
                decoration: InputDecoration(
                  filled: true,
                  fillColor: themeColor.withOpacity(0.1), 
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(color: themeColor),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(color: themeColor),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(color: themeColor),
                  ),
                  labelText: themeName,
                  labelStyle: TextStyle(color: themeColor),
                ),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: onThemeToggle,
              child: Text('Switch Theme'),
            ),
            SizedBox(height: 20),
            Text(
              themeName,
              style: theme.textTheme.headline4,
            ),
          ],
        ),
      ),
    );
  }
}

// Define EmeraldTheme
final ThemeData emeraldTheme = ThemeData(
  primarySwatch: Colors.green,
   primaryColor: Colors.greenAccent,
  textTheme: TextTheme(
    headline4: TextStyle(color: Colors.green[800]),
  ),
  inputDecorationTheme: InputDecorationTheme(
    filled: true,
    fillColor: Colors.green.withOpacity(0.1),
    border: OutlineInputBorder(),
    labelStyle: TextStyle(color: Colors.green[700]),
  ),
  buttonTheme: ButtonThemeData(
    buttonColor: Colors.green,
    textTheme: ButtonTextTheme.primary,
  ),
);

// Define RubyTheme
final ThemeData rubyTheme = ThemeData(
  primarySwatch: Colors.red,
  primaryColor: Colors.redAccent,
  textTheme: TextTheme(
    headline4: TextStyle(color: Colors.red[800]),
  ),
  inputDecorationTheme: InputDecorationTheme(
    filled: true,
    fillColor: Colors.red.withOpacity(0.1),
    border: OutlineInputBorder(),
    labelStyle: TextStyle(color: Colors.red[700]),
  ),
  buttonTheme: ButtonThemeData(
    buttonColor: Colors.red,
    textTheme: ButtonTextTheme.primary,
  ),
);
