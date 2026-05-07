import 'package:flutter/material.dart';
import 'dart:io';

// Define the same model here (or consider moving it to a separate model file and importing)
class UserModel {
  final String fullName;
  final String dateOfBirth;
  final String email;
  final String cnic;
  final String gender;
  final String siblings;
  final String phone;
  final String imagePath;

  UserModel({
    required this.fullName,
    required this.dateOfBirth,
    required this.email,
    required this.cnic,
    required this.gender,
    required this.siblings,
    required this.phone,
    required this.imagePath,
  });
}

class UserDetailsScreen extends StatelessWidget {
  final UserModel user;

  const UserDetailsScreen({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('User Details')),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (user.imagePath.isNotEmpty)
                Center(child: Image.file(File(user.imagePath), height: 150)),
              SizedBox(height: 20),
              Text(
                "Full Name: ${user.fullName}",
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 20),
              Text(
                "Phone Nember: ${user.phone}",
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 10),
              Text("Email: ${user.email}", style: TextStyle(fontSize: 16)),
              SizedBox(height: 10),
              // Text("DOB: ${user.dateOfBirth}", style: TextStyle(fontSize: 16)),
              Text(
                "Age: ${calculateAge(user.dateOfBirth)}",
                style: TextStyle(fontSize: 16),
              ),

              SizedBox(height: 10),
              Text("CNIC: ${user.cnic}", style: TextStyle(fontSize: 16)),
              SizedBox(height: 10),
              Text("Gender: ${user.gender}", style: TextStyle(fontSize: 16)),
              SizedBox(height: 10),
              Text(
                "Siblings: ${user.siblings}",
                style: TextStyle(fontSize: 16),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

int calculateAge(String dobString) {
  final dob = DateTime.parse(dobString); // convert string to DateTime
  final today = DateTime.now();

  int age = today.year - dob.year;
  if (today.month < dob.month ||
      (today.month == dob.month && today.day < dob.day)) {
    age--;
  }
  return age;
}
