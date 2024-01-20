import 'dart:convert';
import 'package:http/http.dart' as http;

class DashboardDataProvider {
  final String baseUrl =
      'https://twilio-backend-4rh3.onrender.com/get-all-data';

  Future<List<Map<String, dynamic>>> fetchDashboardData() async {
    final Map<String, String> customHeaders = {
      "ngrok-skip-browser-warning": "69420",
      // Add any other headers if needed
    };

    final response = await http.get(
      Uri.parse('$baseUrl'),
      headers: customHeaders,
    );

    print("the process is started and doing the process");
    print("the response code is ${response.body}");

    if (response.statusCode == 200) {
      print("the process is started again");
      final List<dynamic> jsonData = json.decode(response.body);
      print("the data is $jsonData");
      return jsonData.cast<Map<String, dynamic>>();
    } else {
      print("there is an error try to find out");
      throw Exception('Failed to load dashboard data');
    }
  }
}
