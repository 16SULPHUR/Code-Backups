import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  Future<void> saveLoginDetails(String email, String password) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('user_email', email);
    await prefs.setString('user_password', password);
  }

  final email = TextEditingController();
  final password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/logo.png',
                  height: 100,
                ),
                const SizedBox(height: 20),
                const Text(
                  'Log In Now',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Color.fromRGBO(25, 42, 86, 1),
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  'Please login to continue using our app',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 16, color: Colors.grey[600]),
                ),
                const SizedBox(height: 20),
                TextField(
                  controller: email,
                  decoration: const InputDecoration(
                    labelText: 'Email',
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 16),
                TextField(
                  controller: password,
                  decoration: const InputDecoration(
                    labelText: 'Password',
                    border: OutlineInputBorder(),
                  ),
                  obscureText: true,
                ),
                const SizedBox(height: 8),
                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    onPressed: () {},
                    child: const Text('Forgot Password'),
                  ),
                ),
                const SizedBox(height: 24),
                ElevatedButton(
                  onPressed: () async{
                    final emailText = email.text;
                    final emailPassword = password.text;

                    try {
                      await saveLoginDetails(emailText, emailPassword);
                    } catch (e) {
                      // ignore: use_build_context_synchronously
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text("Log In Succesfull"),
                        ),
                      );
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    minimumSize: const Size(double.infinity, 50),
                    backgroundColor: const Color.fromRGBO(25, 42, 86, 1),
                    foregroundColor: Colors.white,
                  ),
                  child: const Text('Log In'),
                ),
                const SizedBox(height: 16),
                TextButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/signup');
                  },
                  child: const Text("Don't have an account? Sign Up"),
                ),
                const SizedBox(height: 16),
                const Text('Or connect with'),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                      icon: const Icon(Icons.facebook),
                      onPressed: () {},
                    ),
                    IconButton(
                      icon: const Icon(Icons.apple),
                      onPressed: () {},
                    ),
                    IconButton(
                      icon: const Icon(Icons.email),
                      onPressed: () {},
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}