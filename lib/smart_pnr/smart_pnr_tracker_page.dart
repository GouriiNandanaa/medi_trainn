import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:medii/smart_pnr/printing_location_page.dart';
import 'package:medii/smart_pnr/smart_pnr_service.dart';
import '../models/train_station_model.dart';

class SmartPNRTrackerPage extends StatefulWidget {
  @override
  _SmartPNRTrackerPageState createState() => _SmartPNRTrackerPageState();
}

class _SmartPNRTrackerPageState extends State<SmartPNRTrackerPage> {
  final TextEditingController _trainController = TextEditingController();
  TrainStationModel? _trainData;

  String _getTodayDate() {
    return DateFormat('yyyyMMdd').format(DateTime.now());
  }

  void _fetchTrainLocation() async {
    String trainNumber = _trainController.text.trim();
    if (trainNumber.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Please enter a valid train number")),
      );
      return;
    }

    String departureDate = _getTodayDate();

    try {
      String response = await SmartPNRService.location(trainNumber);
      Map<String, dynamic> jsonData = jsonDecode(response);

      if (jsonData["code"] == 200 && jsonData["status"]["result"] == "success" && jsonData["body"] != null) {
        setState(() {
          _trainData = TrainStationModel.fromJson(jsonData["body"]);
        });
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => PrintingLocationPage(train: _trainData!),
          ),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("No train data found for train number: $trainNumber")),
        );
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Error fetching location for train number: $trainNumber. Error: $e")),
      );
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
