import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SignUpScreen extends StatelessWidget {
  SignUpScreen({super.key});

  Future<void> saveLoginDetails(
    String name,
    String email,
    String password,
  ) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('name', name);
    await prefs.setString('user_email', email);
    await prefs.setString('user_password', password);
  }

  final nameCont = TextEditingController();
  final emailCont = TextEditingController();
  final passwordCont = TextEditingController();

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
                  'Sign Up Now',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Color.fromRGBO(25, 42, 86, 1),
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  'Please fill the details and create account',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 16, color: Colors.grey[600]),
                ),
                const SizedBox(height: 20),
                TextField(
                  controller: nameCont,
                  decoration: const InputDecoration(
                    labelText: 'Name',
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 16),
                TextField(
                  controller: emailCont,
                  decoration: const InputDecoration(
                    labelText: 'Email',
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 16),
                TextField(
                  controller: passwordCont,
                  decoration: const InputDecoration(
                    labelText: 'Password',
                    border: OutlineInputBorder(),
                  ),
                  obscureText: true,
                ),
                const SizedBox(height: 24),
                ElevatedButton(
                  onPressed: () async {
                    final nameText = nameCont.text;
                    final emailText = emailCont.text;
                    final emailPassword = passwordCont.text;

                    try {
                      await saveLoginDetails(
                          nameText, emailText, emailPassword);
                      Navigator.pushNamed(context, '/login');
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
                  child: const Text('Sign Up'),
                ),
                const SizedBox(height: 16),
                TextButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/login');
                  },
                  child: const Text("Already have an account? Log In"),
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
