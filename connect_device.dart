import 'package:flutter/material.dart';

class ConnectDeviceScreen extends StatelessWidget {
  const ConnectDeviceScreen({super.key}); // Add Key parameter

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Connect Device'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0), // Add padding for better spacing
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start, // Align content to the left
          children: [
            const Text(
              'Follow these steps to pair your device and start tracking your stress data.',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            // Instructions
            const Text('1. Ensure your device is powered on.',
                style: TextStyle(fontSize: 14)),
            const SizedBox(height: 10),
            const Text('2. Enable Bluetooth or Wi-Fi on your device.',
                style: TextStyle(fontSize: 14)),
            const SizedBox(height: 10),
            const Text('3. Select your device from the list below.',
                style: TextStyle(fontSize: 14)),
            const SizedBox(height: 30),
            // Device Pairing Options
            ListTile(
              title: const Text('Apple Watch'),
              trailing: ElevatedButton(
                onPressed: () {},
                child: const Text('Pair'),
              ),
            ),
            ListTile(
              title: const Text('Device XYZ'),
              trailing: ElevatedButton(
                onPressed: () {},
                child: const Text('Pair'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
