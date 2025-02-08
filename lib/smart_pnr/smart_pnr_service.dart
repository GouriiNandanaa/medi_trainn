import 'dart:async';
import 'package:http/http.dart' as http;

class SmartPNRService {
  // Function to fetch train location based on train number
  static Future<String> location(String trainNumber) async {
    print(trainNumber);
    final String url =
        "https://indian-railway-irctc.p.rapidapi.com/api/trains-search/v1/train/$trainNumber?isH5=true&client=web";

    try {
      final response = await http.get(
        Uri.parse(url),
        headers: {
          "X-RapidAPI-Key": "bb7bfb6711mshb0e91359725544fp13ef5fjsnc987d6e425b3",
          "X-RapidAPI-Host": "indian-railway-irctc.p.rapidapi.com",
          "x-rapid-api":"rapid-api-database",
        },
      );
      print(response);
      if (response.statusCode == 200) {
        return response.body; // Return API response
      } else {
        return "Error: ${response.statusCode} - ${response.reasonPhrase}";
      }
    } catch (e) {
      return "Error fetching location: $e";
    }
  }
}
