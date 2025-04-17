import 'dart:convert';
import 'package:http/http.dart' as http;

class FitbitService {
  static const String refreshUrl = 'https://3x3yoj7fab.execute-api.us-east-2.amazonaws.com/test/fitbitRefresh';

  static Future<void> refreshFitbitToken() async {
    try {
      final response = await http.get(Uri.parse(refreshUrl));

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);

        if (data.containsKey('access_token')) {
          final newAccessToken = data['access_token'];
          final newRefreshToken = data['refresh_token'];
          final userId = data['user_id'];
          final expiresIn = data['expires_in'];
          final tokenType = data['token_type'];
          final timeStamp = data['time_stamp'];

          print("New Access Token: $newAccessToken");
          print("New Refresh Token: $newRefreshToken");
          print("User ID: $userId");
          print("Token Type: $tokenType");
          print("Expires In: $expiresIn seconds");
          print("Time Stamp: $timeStamp");

          // TODO: You can save these tokens in secure storage if needed
        } else {
          print("Token is still valid: ${data['message']}");
        }
      } else {
        print("Failed with ${response.statusCode}: ${response.body}");
      }
    } catch (e) {
      print("Error during Fitbit token refresh: $e");
    }
  }
}

