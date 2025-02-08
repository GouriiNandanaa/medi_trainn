import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:medii/smart_pnr/printing_location_page.dart';
import 'package:medii/smart_pnr/smart_pnr_service.dart';
import '../models/train_station_model.dart'; // Import the model

class SmartPNRTrackerPage extends StatefulWidget {
  @override
  _SmartPNRTrackerPageState createState() => _SmartPNRTrackerPageState();
}

class _SmartPNRTrackerPageState extends State<SmartPNRTrackerPage> {
  final TextEditingController _trainController = TextEditingController();

  // Function to fetch train location and parse into TrainStationModel
  void _fetchTrainLocation() async {
    String trainNumber = _trainController.text.trim();
    if (trainNumber.isEmpty) {
      print("Please enter a valid train number");
      return;
    }

    try {
      String locationJson = await SmartPNRService.location(trainNumber);
      Map<String, dynamic> jsonData = jsonDecode(locationJson);

      // Ensure the response has valid train data
      if (jsonData.containsKey("body") &&
          jsonData["body"].isNotEmpty &&
          jsonData["body"][0].containsKey("trains") &&
          jsonData["body"][0]["trains"].isNotEmpty) {

        // Extract train details
        var trainData = jsonData["body"][0]["trains"][0];

        // Convert to TrainStationModel
        TrainStationModel train = TrainStationModel.fromJson(trainData);

        // Navigate to PrintingLocationPage with parsed train data
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => PrintingLocationPage(train: train),
          ),
        );

      } else {
        print("No train data found in API response");
      }
    } catch (e) {
      print("Error fetching location: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("SmartPNR Tracker")),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Image.asset("assets/images/pnr_tracker.png", height: 300),
              SizedBox(height: 20),
              Text(
                "Enter your PNR and get live location",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500, color: Colors.grey[700]),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 20),
              TextField(
                controller: _trainController,
                decoration: InputDecoration(
                  labelText: "Enter Train Number",
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.number,
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: _fetchTrainLocation,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.orange,
                  foregroundColor: Colors.white,
                  padding: EdgeInsets.symmetric(horizontal: 40, vertical: 14),
                  textStyle: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                child: Text("TRACK THE TRAIN"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
