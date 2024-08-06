import 'package:flutter/material.dart';

class ProfileCard extends StatelessWidget {
  const ProfileCard({
    super.key,
    required this.name,
    required this.number,
    required this.imageUrl,
    required this.hobbies,
  });

  final String name;
  final String number;
  final String imageUrl;
  final List<String> hobbies;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(15),
      child: Container(
        padding: EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
          border: Border.all(color: Colors.grey[300]!, width: 1), // Thin light gray border
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1), // Lighter shadow
              spreadRadius: 2,
              blurRadius: 4,
              offset: Offset(0, 1), // Subtle shadow
            ),
          ],
        ),
        child: Row(
          children: [
            CircleAvatar(
              backgroundImage: NetworkImage(imageUrl),
              radius: 40,
            ),
            SizedBox(width: 20),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Name: $name",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    "Enrollment No: $number",
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.grey[600],
                    ),
                  ),
                  SizedBox(height: 8),
                  Wrap(
                    spacing: 8.0,
                    runSpacing: 4.0,
                    children: hobbies.map((hobby) {
                      return Chip(
                        label: Text(hobby),
                        backgroundColor: Colors.blueAccent,
                        labelStyle: TextStyle(color: Colors.white),
                      );
                    }).toList(),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
