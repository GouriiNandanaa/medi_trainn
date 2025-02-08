import 'package:flutter/material.dart';
import '../models/train_station_model.dart';
import 'package:intl/intl.dart';

class PrintingLocationPage extends StatelessWidget {
  final TrainStationModel train;

  PrintingLocationPage({required this.train});

  @override
  Widget build(BuildContext context) {
    // Get current date and time
    DateTime now = DateTime.now();
    print("\n\nCurrent Time: ${DateFormat('yyyy-MM-dd HH:mm').format(now)}");

    int nextIndex = -1;
    DateTime? nextArrivalTime;

    for (int i = 0; i < train.schedule.length; i++) {
      String arrival = train.schedule[i].arrivalTime;
      int stationDay = train.schedule[i].dayCount; // Get station day count

      if (arrival != "--") {
        try {
          // Parse arrival time correctly
          List<String> timeParts = arrival.split(':');
          int hour = int.parse(timeParts[0]);
          int minute = int.parse(timeParts[1]);

          // Create station arrival time with correct day
          DateTime stationArrival = DateTime(
            now.year,
            now.month,
            now.day + (stationDay - 1), // Adjust for multi-day journeys
            hour,
            minute,
          );

          print("Checking: ${train.schedule[i].stationName}, Arrival: ${DateFormat('yyyy-MM-dd HH:mm').format(stationArrival)}");

          // Find the closest station after the current time
          if (stationArrival.isAfter(now)) {
            if (nextArrivalTime == null || stationArrival.isBefore(nextArrivalTime)) {
              nextIndex = i;
              nextArrivalTime = stationArrival;
            }
          }
        } catch (e) {
          print("Error parsing time for ${train.schedule[i].stationName}: $e");
        }
      }
    }

    print("Next station index: $nextIndex");

    return Scaffold(
      appBar: AppBar(title: Text("Train Location")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Train: ${train.trainName} (${train.trainNumber})",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(
              "Start: ${train.origin}",
              style: TextStyle(fontSize: 18, color: Colors.green),
            ),
            Text(
              "End: ${train.destination}",
              style: TextStyle(fontSize: 18, color: Colors.red),
            ),
            SizedBox(height: 10),
            Text("Intermediate Stations:", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            Expanded(
              child: ListView.builder(
                itemCount: train.schedule.length,
                itemBuilder: (context, index) {
                  final station = train.schedule[index];

                  // Check if this is the next stopping station
                  bool isNextStation = index == nextIndex;

                  return ListTile(
                    title: Text(
                      station.stationName,
                      style: TextStyle(
                        color: isNextStation ? Colors.orange : Colors.black, // Highlight next station
                        fontWeight: isNextStation ? FontWeight.bold : FontWeight.normal,
                      ),
                    ),
                    subtitle: Text("Arrival: ${station.arrivalTime} | Departure: ${station.departureTime}"),
                    leading: Icon(
                      Icons.train,
                      color: isNextStation ? Colors.orange : Colors.grey, // Highlight train icon
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
