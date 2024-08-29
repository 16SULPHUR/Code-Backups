import 'package:flutter/material.dart';
import 'package:loginpage/menu.dart';
import 'package:loginpage/tic_tac_toe_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final isLoggedIn = await _getLoginStatus();
  runApp(MyApp(isLoggedIn: isLoggedIn));
}

Future<bool> _getLoginStatus() async {
  final prefs = await SharedPreferences.getInstance();
  return prefs.getBool('isLoggedIn') ?? false;
}

class MyApp extends StatelessWidget {
  final bool isLoggedIn;

  MyApp({required this.isLoggedIn});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Auth App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MenuScreen(), // Start with the menu screen
      routes: {
        '/login': (context) => LoginPage(),
        '/signup': (context) => SignUpPage(),
      },
    );
  }
}


class WelcomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Welcome')),
      body: Center(
        child: Column(
  mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            SizedBox(height: 40),
            Container(
              width: 100,
              child: Center(
                child: Text(
                  '⚙️', 
                  style: TextStyle(fontSize: 70, color: Color.fromARGB(255, 51, 65, 112)),
                ),
              ),
            ),
            Text(
              'Welcome to ',
              style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold),
            ),
            Text(
              'Create an account and access thousands of cool stuff',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/login');
              },
              child: Text('Get Started'),
            ),
          ],
        ),
      ),
    );
  }
}

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  Future<void> _login() async {
    final email = _emailController.text;
    final password = _passwordController.text;

    // Basic validation (replace with your own logic)
    if (email == 'test@example.com' && password == 'password') {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setBool('isLoggedIn', true);
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomePage()));
    } else {
      // Show error message
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Invalid credentials')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Login')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(height: 40),
            Container(
              width: 100,
              child: Center(
                child: Text(
                  '⚙️', 
                  style: TextStyle(fontSize: 70, color: Color.fromARGB(255, 51, 65, 112)),
                ),
              ),
            ),
            SizedBox(height: 20),
            Text(
              'Log In Now',
              style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            TextField(
              controller: _emailController,
              decoration: InputDecoration(labelText: 'Email'),
            ),
            SizedBox(height: 10),
            TextField(
              controller: _passwordController,
              decoration: InputDecoration(labelText: 'Password'),
              obscureText: true,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _login,
              child: Text('Log In'),
            ),
            TextButton(
              onPressed: () {
                Navigator.pushNamed(context, '/signup');
              },
              child: Text('Don\'t have an account? Sign Up'),
            ),
          ],
        ),
      ),
    );
  }
}

class SignUpPage extends StatefulWidget {
  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  Future<void> _signUp() async {
    final name = _nameController.text;
    final email = _emailController.text;
    final password = _passwordController.text;

    // Basic sign-up logic (replace with your own logic)
    if (name.isNotEmpty && email.isNotEmpty && password.isNotEmpty) {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setBool('isLoggedIn', true);
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomePage()));
    } else {
      // Show error message
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Please fill all fields')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Sign Up')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(height: 40),
            Container(
              width: 100,
              child: Center(
                child: Text(
                  '⚙️', 
                  style: TextStyle(fontSize: 70, color: Color.fromARGB(255, 51, 65, 112)),
                ),
              ),
            ),
            SizedBox(height: 20),
            Text(
              'Sign Up Now',
              style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            TextField(
              controller: _nameController,
              decoration: InputDecoration(labelText: 'Name'),
            ),
            SizedBox(height: 10),
            TextField(
              controller: _emailController,
              decoration: InputDecoration(labelText: 'Email'),
            ),
            SizedBox(height: 10),
            TextField(
              controller: _passwordController,
              decoration: InputDecoration(labelText: 'Password'),
              obscureText: true,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _signUp,
              child: Text('Sign Up'),
            ),
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('Already have an account? Log In'),
            ),
            Text(
              'Follow Us!',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Home')),
      body: Center(
        child: ElevatedButton(
          onPressed: () async {
            final prefs = await SharedPreferences.getInstance();
            await prefs.setBool('isLoggedIn', false);
            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => WelcomePage()));
          },
          child: Text('Logout'),
        ),
      ),
    );
  }
}