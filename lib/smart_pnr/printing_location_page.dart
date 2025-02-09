import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../models/train_station_model.dart';

class PrintingLocationPage extends StatelessWidget {
  final TrainStationModel train;

  PrintingLocationPage({required this.train});

  @override
  Widget build(BuildContext context) {
    DateTime now = DateTime.now();
    int nextIndex = -1;
    DateTime? nextArrivalTime;

    for (int i = 0; i < train.stations.length; i++) {
      String arrival = train.stations[i].arrivalTime;

      if (arrival != "--") {
        try {
          List<String> timeParts = arrival.split(':');
          int hour = int.parse(timeParts[0]);
          int minute = int.parse(timeParts[1]);

          DateTime stationArrival = DateTime(
            now.year,
            now.month,
            now.day,
            hour,
            minute,
          );

          if (stationArrival.isAfter(now)) {
            if (nextArrivalTime == null || stationArrival.isBefore(nextArrivalTime)) {
              nextIndex = i;
              nextArrivalTime = stationArrival;
            }
          }
        } catch (e) {
          print("Error parsing time for ${train.stations[i].stationName}: $e");
        }
      }
    }

    return Scaffold(
      appBar: AppBar(title: Text("Train Location")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Current Station: ${train.currentStation}",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(
              "Train Status: ${train.trainStatusMessage}",
              style: TextStyle(fontSize: 18, color: Colors.blueGrey),
            ),
            SizedBox(height: 10),
            Text("Upcoming Stations:", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            Expanded(
              child: ListView.builder(
                itemCount: train.stations.length,
                itemBuilder: (context, index) {
                  final station = train.stations[index];
                  bool isNextStation = index == nextIndex;

                  return ListTile(
                    title: Text(
                      "${station.stationName} (${station.stationCode})",
                      style: TextStyle(
                        color: isNextStation ? Colors.orange : Colors.black,
                        fontWeight: isNextStation ? FontWeight.bold : FontWeight.normal,
                      ),
                    ),
                    subtitle: Text(
                      "Arrival: ${station.actualArrivalTime} | Departure: ${station.actualDepartureTime}\nPlatform: ${station.expectedPlatform}",
                    ),
                    leading: Icon(
                      Icons.train,
                      color: isNextStation ? Colors.orange : Colors.grey,
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}