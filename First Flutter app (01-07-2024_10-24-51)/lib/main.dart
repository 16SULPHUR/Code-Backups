// import 'dart:ffi';
import 'package:http/http.dart' as http;
import 'dart:io';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Create React App'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  int _theme = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  void _changeTheme() {
    setState(() {
      _theme = _theme == 0 ? 1 : 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _theme==0 ? Colors.black : Colors.white,
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
        actions:[
          IconButton(onPressed: _changeTheme, icon: Icon(_theme==0 ? Icons.light_mode: Icons.dark_mode)),
        ]
      ),
      body: Center(
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text('You have pushed the button this many times: $_counter',
              style: TextStyle(color: _theme == 0 ? Colors.white: Colors.black, fontWeight: FontWeight.bold, fontSize: 40),),
              Image(image: NetworkImage("https://media.tenor.com/vtv51_dtb-oAAAAe/discord-light-mode-light-mode.png"))
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
