// import 'package:flutter/material.dart';
// import 'authentication/onboarding.dart';
//
// void main() {
//   runApp(const MyApp());
// }
//
// class MyApp extends StatelessWidget {
//   const MyApp({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'MediTrain',
//       theme: ThemeData(
//         colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
//         useMaterial3: true,
//       ),
//       home: const HomeScreen(),
//     );
//   }
// }
//
// class HomeScreen extends StatelessWidget {
//   const HomeScreen({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//
//       backgroundColor: Colors.grey[200],
//       body: Center( // Centers everything in the screen
//         child: Column(
//
//           mainAxisAlignment: MainAxisAlignment.center, // Centers vertically
//           mainAxisSize: MainAxisSize.min,
//           children: [
//             SizedBox(height: 100),
//             Image.asset(
//               'assets/images/front.png',
//               width: 150,
//               height: 150,
//               fit: BoxFit.contain,
//             ),
//             const SizedBox(height: 30),
//             const Padding(
//               padding: EdgeInsets.symmetric(horizontal: 30),
//               child: Text.rich(
//                 TextSpan(
//                   children: [
//                     TextSpan(
//                       text: 'Your Journey to\nWellness Begins with\n',
//                       style: TextStyle(
//                         fontFamily: 'Poppins', // Custom font
//                         fontSize: 20,
//                         fontWeight: FontWeight.w500,
//                         letterSpacing: 0.5,
//                         color: Colors.black87,
//                       ),
//                     ),
//                     TextSpan(
//                       text: 'MEDITRAIN',
//                       style: TextStyle(
//                         fontFamily: 'Poppins', // Same font for consistency
//                         fontSize: 22,
//                         fontWeight: FontWeight.bold,
//                         color: Colors.orange,
//                       ),
//                     ),
//                   ],
//                 ),
//                 textAlign: TextAlign.center,
//               ),
//             ),
//
//             const SizedBox(height: 20),
//             ElevatedButton(
//               onPressed: () {
//                 Navigator.push(
//                   context,
//                   MaterialPageRoute(builder: (context) => const Onboarding()),
//                 );
//               },
//               style: ElevatedButton.styleFrom(
//                 backgroundColor: Colors.orange, // Orange background
//                 foregroundColor: Colors.white, // White text color
//                 textStyle: const TextStyle(
//                   fontSize: 16,
//                   fontWeight: FontWeight.bold,
//                   letterSpacing: 1.2, // Spaced-out text for a premium feel
//                 ),
//                 shape: RoundedRectangleBorder(
//                   borderRadius: BorderRadius.circular(12), // Smooth rounded corners
//                 ),
//                 elevation: 5, // Slight shadow for a raised effect
//                 padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 24), // Good padding
//               ),
//               child: const Text('GET STARTED'), // Capitalized text
//             ),
//
//           ],
//         ),
//       ),
//     );
//   }
// }
