import 'package:flutter/material.dart';
import 'package:medii/aiMedGuide/ai_med_guide.dart';
import 'package:medii/ai_assistant/ai_med_guide.dart';
import 'package:medii/authentication/home_screen_first.dart';
import 'package:medii/doc_on_track/doc_on_track.dart';
import 'package:medii/medical_care_hsptl/station_care_page.dart';
import 'package:medii/medicine_delivery/med_express_page.dart';
import 'package:medii/profiles/profile_update_page.dart';
import 'package:medii/smart_pnr/smart_pnr_tracker_page.dart';
import 'package:medii/track_my_med/track_my_med.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<Map<String, dynamic>> features = [
    {"title": "MedExpress", "subtitle": "Order medicine on the go", "image": "assets/images/med_express.png", "page": MedExpressPage()},
    {"title": "TrackMyMeds", "subtitle": "Live tracking of your order", "image": "assets/images/track_meds.png", "page": TrackMyMedsPage()},
    {"title": "DocOnTrack", "subtitle": "Consult a doctor instantly", "image": "assets/images/doc_on_track.png", "page": DocOnTrackPage()},
    {"title": "SmartPNR Tracker", "subtitle": "Real-time train location tracking", "image": "assets/images/smart_pnr.png", "page": SmartPNRTrackerPage()},
    {"title": "AI MedGuide", "subtitle": "Get AI-powered medicine suggestions", "image": "assets/images/ai_medguide.png", "page": AIMedGuidePage()},
    {"title": "StationCare", "subtitle": "Find nearby medical help", "image": "assets/images/station_care.png", "page": StationCarePage()},
    {"title": "HealthAssist 24/7", "subtitle": "Chat or call support anytime", "image": "assets/images/health_assist.png", "page": HealthAssistPage()},
    {"title": "Profile Update", "subtitle": "Update your profile", "image": "assets/images/pro_update.png", "page": ProfileUpdatePage()},
  ];

  void _confirmLogout(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext dialogContext) {
        return AlertDialog(
          title: Text("Confirm Logout"),
          content: Text("Are you sure you want to log out?"),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(dialogContext), // Close the dialog
              child: Text("Cancel"),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(dialogContext); // Close the dialog first
                _logout(context); // Call logout function
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.orange, // Orange background
                foregroundColor: Colors.white, // White text color
                textStyle: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8), // Rounded corners
                ),
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10), // Button padding
              ),
              child: Text("YES"),
            ),
          ],
        );
      },
    );
  }

  void _logout(BuildContext context) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('isLoggedIn'); // Clear login status

    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (context) => HomeScreenFirst()),
          (route) => false, // Removes all previous routes
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 70.0,
            floating: false,
            pinned: false, // Title disappears when scrolling
            flexibleSpace: FlexibleSpaceBar(
              title: Text("Train Health Hub", style: TextStyle(fontSize: 18)),
              centerTitle: false,
            ),
            actions: [
              IconButton(
                icon: Icon(Icons.logout),
                onPressed: () => _confirmLogout(context), // Pass context explicitly
              ),
            ],
          ),
          SliverPadding(
            padding: const EdgeInsets.all(12.0),
            sliver: SliverGrid(
              delegate: SliverChildBuilderDelegate(
                    (context, index) {
                  return FeatureCard(
                    title: features[index]["title"]!,
                    subtitle: features[index]["subtitle"]!,
                    imagePath: features[index]["image"]!,
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => features[index]["page"] as Widget),
                      );
                    },
                  );
                },
                childCount: features.length,
              ),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 12,
                mainAxisSpacing: 12,
                childAspectRatio: 0.9,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class FeatureCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final String imagePath;
  final VoidCallback onTap;

  const FeatureCard({required this.title, required this.subtitle, required this.imagePath, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        elevation: 4,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(imagePath, height: 80),
            SizedBox(height: 10),
            Text(title, style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Text(subtitle, textAlign: TextAlign.center, style: TextStyle(fontSize: 12, color: Colors.grey[700])),
            ),
          ],
        ),
      ),
    );
  }
}

// Placeholder Pages











