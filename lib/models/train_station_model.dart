class TrainStationModel {
  final String currentStation;
  final bool terminated;
  final String trainStatusMessage;
  final List<Station> stations;

  TrainStationModel({
    required this.currentStation,
    required this.terminated,
    required this.trainStatusMessage,
    required this.stations,
  });

  factory TrainStationModel.fromJson(Map<String, dynamic> json) {
    return TrainStationModel(
      currentStation: json["current_station"],
      terminated: json["terminated"],
      trainStatusMessage: json["train_status_message"],
      stations: (json["stations"] as List)
          .map((station) => Station.fromJson(station))
          .toList(),
    );
  }
}

class Station {
  final String stationCode;
  final String stationName;
  final String arrivalTime;
  final String departureTime;
  final int expectedPlatform;
  final String actualArrivalTime;
  final String actualDepartureTime;

  Station({
    required this.stationCode,
    required this.stationName,
    required this.arrivalTime,
    required this.departureTime,
    required this.expectedPlatform,
    required this.actualArrivalTime,
    required this.actualDepartureTime,
  });

  factory Station.fromJson(Map<String, dynamic> json) {
    return Station(
      stationCode: json["stationCode"],
      stationName: json["stationName"],
      arrivalTime: json["arrivalTime"],
      departureTime: json["departureTime"],
      expectedPlatform: json["expected_platform"],
      actualArrivalTime: json["actual_arrival_time"],
      actualDepartureTime: json["actual_departure_time"],
    );
  }
}
