class TrainStationModel {
  final String trainNumber;
  final String trainName;
  final String origin;
  final String destination;
  final String stationFrom;
  final String stationTo;
  final String runningOn;
  final List<String> journeyClasses;
  final List<String> trainType;
  final List<Station> schedule;

  TrainStationModel({
    required this.trainNumber,
    required this.trainName,
    required this.origin,
    required this.destination,
    required this.stationFrom,
    required this.stationTo,
    required this.runningOn,
    required this.journeyClasses,
    required this.trainType,
    required this.schedule,
  });

  // Factory method to create an instance from JSON
  factory TrainStationModel.fromJson(Map<String, dynamic> json) {
    return TrainStationModel(
      trainNumber: json['trainNumber'],
      trainName: json['trainName'],
      origin: json['origin'],
      destination: json['destination'],
      stationFrom: json['stationFrom'],
      stationTo: json['stationTo'],
      runningOn: json['runningOn'],
      journeyClasses: List<String>.from(json['journeyClasses']),
      trainType: List<String>.from(json['train_type']),
      schedule: (json['schedule'] as List)
          .map((stationJson) => Station.fromJson(stationJson))
          .toList(),
    );
  }
}

class Station {
  final String stationCode;
  final String stationName;
  final String arrivalTime;
  final String departureTime;
  final String routeNumber;
  final String haltTime;
  final String distance;
  final int dayCount;
  final int stnSerialNumber;
  final bool boardingDisabled;

  Station({
    required this.stationCode,
    required this.stationName,
    required this.arrivalTime,
    required this.departureTime,
    required this.routeNumber,
    required this.haltTime,
    required this.distance,
    required this.dayCount,
    required this.stnSerialNumber,
    required this.boardingDisabled,
  });

  // Factory method to create an instance from JSON
  factory Station.fromJson(Map<String, dynamic> json) {
    return Station(
      stationCode: json['stationCode'],
      stationName: json['stationName'],
      arrivalTime: json['arrivalTime'],
      departureTime: json['departureTime'],
      routeNumber: json['routeNumber'],
      haltTime: json['haltTime'],
      distance: json['distance'],
      dayCount: int.parse(json['dayCount']),
      stnSerialNumber: int.parse(json['stnSerialNumber']),
      boardingDisabled: json['boardingDisabled'].toString().toLowerCase() == 'true',
    );
  }
}
