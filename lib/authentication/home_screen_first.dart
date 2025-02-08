import 'package:flutter/material.dart';

import '../DEMO/gg.dart';
import 'onboarding.dart';

class HomeScreenFirst extends StatelessWidget {
  const HomeScreenFirst({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(height: 70),
            Image.asset(
              'assets/images/front.png',
              width: 150,
              height: 150,
              fit: BoxFit.contain,
            ),
            const SizedBox(height: 30),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 30),
              child: Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                      text: 'Your Journey to\nWellness Begins with\n',
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                        letterSpacing: 0.5,
                        color: Colors.black87,
                      ),
                    ),
                    TextSpan(
                      text: 'MEDITRAIN',
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Colors.orange,
                      ),
                    ),
                  ],
                ),
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(height: 30,),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const Onboarding()),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.orange, // Orange background
                foregroundColor: Colors.white, // White text color
                textStyle: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1.2, // Spaced-out text for a premium feel
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12), // Smooth rounded corners
                ),
                elevation: 5, // Slight shadow for a raised effect
                padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 24), // Good padding
              ),
              child: const Text('GET STARTED'), // Capitalized text
            ),
          ],
        ),
      ),
    );
  }
}
