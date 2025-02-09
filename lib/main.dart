import 'package:flutter/material.dart';
import 'package:medii/authentication/home_screen_first.dart';
import 'package:medii/homeScreen/homescreen.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized(); // Ensures async execution before runApp
  final prefs = await SharedPreferences.getInstance();
  bool isLoggedIn = prefs.getBool('isLoggedIn') ?? false; // Check if logged in
  print('\n\n\n');

  print(isLoggedIn);

  runApp(MyApp(isLoggedIn: isLoggedIn));
}

class MyApp extends StatelessWidget {
  final bool isLoggedIn;
  const MyApp({super.key, required this.isLoggedIn});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'MediTrain',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: isLoggedIn ? HomeScreen() : HomeScreenFirst(), // Navigate based on login status
    );
  }
}
