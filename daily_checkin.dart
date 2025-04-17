import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class DailyCheckInScreen extends StatefulWidget {
  const DailyCheckInScreen({super.key});

  @override
  State<DailyCheckInScreen> createState() => _DailyCheckInScreenState();
}

class _DailyCheckInScreenState extends State<DailyCheckInScreen> {
  double stressLevel = 5;
  double moodRating = 5;
  double sleepQuality = 5;
  double activityLevel = 5;
  bool isSubmitting = false;

  Future<void> submitCheckIn() async {
    setState(() {
      isSubmitting = true;
    });

    final url = Uri.parse("https://3x3yoj7fab.execute-api.us-east-2.amazonaws.com/test/DailyCheckIn");

    final response = await http.post(
      url,
      headers: {"Content-Type": "application/json"},
      body: json.encode({
        "user_id": "kate_test", // Replace with real user ID if needed
        "date": DateTime.now().toUtc().toIso8601String().split('.').first + 'Z',
        "stressLevel": stressLevel.toInt(),
        "moodRating": moodRating.toInt(),
        "sleepQuality": sleepQuality.toInt(),
        "activityLevel": activityLevel.toInt(),
      }),
    );

    setState(() {
      isSubmitting = false;
    });

    if (response.statusCode == 200) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Check-in submitted successfully!')),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error submitting check-in: ${response.body}')),
      );
    }
  }

  Widget _buildSlider(String label, double value, ValueChanged<double> onChanged) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('$label: ${value.toInt()}', style: const TextStyle(fontSize: 16)),
        Slider(
          value: value,
          min: 1,
          max: 10,
          divisions: 9,
          label: value.toInt().toString(),
          onChanged: onChanged,
        ),
        const SizedBox(height: 10),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Daily Check-In')),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: ListView(
          children: [
            _buildSlider('Stress Level', stressLevel, (val) => setState(() => stressLevel = val)),
            _buildSlider('Mood Rating', moodRating, (val) => setState(() => moodRating = val)),
            _buildSlider('Sleep Quality', sleepQuality, (val) => setState(() => sleepQuality = val)),
            _buildSlider('Activity Level', activityLevel, (val) => setState(() => activityLevel = val)),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: isSubmitting ? null : submitCheckIn,
              child: isSubmitting
                  ? const CircularProgressIndicator(color: Colors.white)
                  : const Text('Submit Check-In'),
            ),
          ],
        ),
      ),
    );
  }
}

