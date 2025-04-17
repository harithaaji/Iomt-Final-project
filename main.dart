import 'package:flutter/material.dart';
import 'secure_login.dart';
import 'home_page.dart';
import 'connect_device.dart';
import 'daily_checkin.dart';
import 'stress_overview.dart';
import 'get_data.dart';
import 'save_data.dart';

void main() {
  runApp(const StressMonitorApp());
}

class StressMonitorApp extends StatelessWidget {
  const StressMonitorApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Stress Monitor App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const SecureLoginScreen(),
      routes: {
        '/home': (context) => const HomePage(),
        '/connect-device': (context) => const ConnectDeviceScreen(),
        '/daily-checkin': (context) => const DailyCheckInScreen(),
        '/stress-overview': (context) => const StressOverviewScreen(),
        '/secure-login': (context) => const SecureLoginScreen(),
        '/query-heart-rate': (context) => const GetData(),
        '/save-heart-rate': (context) => const SaveData(),
      },
    );
  }
}
