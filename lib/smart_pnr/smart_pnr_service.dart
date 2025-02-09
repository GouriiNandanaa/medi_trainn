import 'dart:async';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';

class SmartPNRService {
  // Function to fetch train location based on train number
  static Future<String> location(String trainNumber) async {
    print(trainNumber);
    final String url =
        "https://indian-railway-irctc.p.rapidapi.com/api/trains/v1/train/status?departure_date=${DateFormat('yyyyMMdd').format(DateTime.now())}&isH5=true&client=web&train_number=$trainNumber";

    try {
      final response = await http.get(
        Uri.parse(url),
        headers: {
          "x-rapidapi-key": "acd23b5253mshd33c12201c1e3fbp13f3fcjsnae6aabb4b220",
          "x-rapidapi-host": "indian-railway-irctc.p.rapidapi.com",
          "x-rapid-api":"rapid-api-database",
        },
      );
      print(response);
      if (response.statusCode == 200) {
        print(response);
        print(response.statusCode);
        return response.body; // Return API response
      } else {
        return "Error: ${response.statusCode} - ${response.reasonPhrase}";
      }
    } catch (e) {
      return "Error fetching location: $e";
    }
  }
}
