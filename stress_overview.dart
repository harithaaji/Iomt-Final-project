import 'package:flutter/material.dart';

class StressOverviewScreen extends StatelessWidget {
  const StressOverviewScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Stress Overview'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              '10:30',
              style: TextStyle(fontSize: 24),
            ),
            Text(
              'Stress Level',
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(height: 20),
            CircleAvatar(
              radius: 40,
              backgroundColor: Colors.red,
              child: Text(
                '10',
                style: TextStyle(fontSize: 24, color: Colors.white),
              ),
            ),
            SizedBox(height: 20),
            Text('Yesterday'),
          ],
        ),
      ),
    );
  }
}
