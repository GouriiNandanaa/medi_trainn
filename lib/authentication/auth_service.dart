import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import '../homeScreen/homescreen.dart';

class AuthService {
  final String baseUrl = 'http://localhost:5000/api/auth';
  final String role = "patient";

  Future<void> signUp(BuildContext context, String name, String email, String password) async {
    print("\n\n\nThe Name is $name, \nThe email is $email, \nThe password is $password\n\n\n");

    final response = await http.post(
      Uri.parse('$baseUrl/signup'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({
        'name': name,
        'email': email,
        'password': password,
        'role': role
      }),
    );

    print("SignUp Response Code: ${response.statusCode}");
    print("SignUp Response Body: ${response.body}");

    if (response.statusCode == 200) {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setBool('isLoggedIn', true); // Save login status

      if (!context.mounted) return; // Prevent navigation error

      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => HomeScreen()),
            (route) => false, // Removes all previous routes
      );

    } else {
      _showErrorSnackbar(context, "Signup failed. Please try again.");
    }
  }

  Future<void> signIn(BuildContext context, String email, String password) async {
    print("\n\n The email is $email, \nThe password is $password\n\n\n");

    final response = await http.post(
      Uri.parse('$baseUrl/signin'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({'email': email, 'password': password}),
    );

    print("SignIn Response Code: ${response.statusCode}");
    print("SignIn Response Body: ${response.body}");

    if (response.statusCode == 200) {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setBool('isLoggedIn', true); // Save login status

      if (!context.mounted) return; // Prevent navigation error

      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => HomeScreen()),
            (route) => false, // Removes all previous routes
      );

    } else {
      _showErrorSnackbar(context, "Login failed. Please check your credentials.");
    }
  }

  void _showErrorSnackbar(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message)),
    );
  }
}
