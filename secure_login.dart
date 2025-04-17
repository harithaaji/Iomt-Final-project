import 'package:flutter/material.dart';

class SecureLoginScreen extends StatelessWidget {
  const SecureLoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Login title
              const Text(
                'LOGIN',
                style: TextStyle(
                  fontSize: 32, // Bigger font size for the title
                  fontWeight: FontWeight.bold,
                  color: Colors.blue, // Arrow color
                ),
              ),
              const SizedBox(height: 40), // Spacing below the title

              // Username input
              TextField(
                decoration: const InputDecoration(
                  labelText: 'Username',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 20),

              // Password input
              TextField(
                obscureText: true,
                decoration: const InputDecoration(
                  labelText: 'Password',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 20),

              // Login arrow button
              Align(
                alignment: Alignment.centerRight, // Align arrow to the right
                child: IconButton(
                  onPressed: () {
                    Navigator.pushReplacementNamed(context, '/home');
                  },
                  icon: const Icon(Icons.arrow_forward), // Right-pointing arrow
                  iconSize: 40, // Bigger arrow size
                  color: Colors.blue, // Arrow color
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
