import 'package:flutter/material.dart';

class Section extends StatefulWidget {
  const Section({super.key});

  @override
  State<Section> createState() => _SectionState();
}

class _SectionState extends State<Section> {
  final _num1 = TextEditingController();
  final _num2 = TextEditingController();
  int sum = 0;

  void calculate() {
    setState(() {
      // Handle input errors
      try {
        final num1 = int.parse(_num1.text);
        final num2 = int.parse(_num2.text);
        sum = num1 + num2;
      } catch (e) {
        sum = 0; // Reset sum if there is an error
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        title: Text('Calculator'),
        backgroundColor: Colors.blueAccent,
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: EdgeInsets.symmetric(vertical: 10),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.3),
                    spreadRadius: 2,
                    blurRadius: 5,
                    offset: Offset(0, 3),
                  ),
                ],
              ),
              child: TextField(
                controller: _num1,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: "Enter Number 1",
                  contentPadding: EdgeInsets.symmetric(horizontal: 20),
                ),
                keyboardType: TextInputType.number,
                style: TextStyle(fontSize: 18),
              ),
            ),
            SizedBox(height: 20),
            Container(
              padding: EdgeInsets.symmetric(vertical: 10),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.3),
                    spreadRadius: 2,
                    blurRadius: 5,
                    offset: Offset(0, 3),
                  ),
                ],
              ),
              child: TextField(
                controller: _num2,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: "Enter Number 2",
                  contentPadding: EdgeInsets.symmetric(horizontal: 20),
                ),
                keyboardType: TextInputType.number,
                style: TextStyle(fontSize: 18),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: calculate,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blueAccent,
                padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: Text(
                "Calculate",
                style: TextStyle(fontSize: 18,color: Colors.white),
              ),
            ),
            SizedBox(height: 20),
            Container(
              padding: EdgeInsets.symmetric(vertical: 10),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.3),
                    spreadRadius: 2,
                    blurRadius: 5,
                    offset: Offset(0, 3),
                  ),
                ],
              ),
              child: Center(
                child: Text(
                  'Sum: $sum',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
