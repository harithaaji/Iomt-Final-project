import 'package:flutter/material.dart';
import 'api_functions.dart';

// This is a demo page to show how to use http call API gateway to save Fitbit data and display results on UI.
class SaveData extends StatefulWidget {
  const SaveData({super.key});

  @override
  State<SaveData> createState() => _SaveDataPageState();
}

class _SaveDataPageState extends State<SaveData> {
  Future<String>? futureStoreHeartRate;
  final TextEditingController _controller_collectTime = TextEditingController();

  @override
  void initState() {
    super.initState();
    _controller_collectTime.text = '2025-02-14';
  }

  @override
  void dispose() {
    _controller_collectTime.dispose();
    super.dispose();
  }

  void _updateText() {
    futureStoreHeartRate = saveHeartRate(_controller_collectTime.text);
    setState(() {
      build(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            const Padding(
              padding: EdgeInsets.only(top: 110.0),
            ),

            // Text Field: Input collect date time
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: TextField(
                controller: _controller_collectTime,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Collect date time',
                  hintText: 'Enter datetime: yyyy-mm-dd',
                ),
              ),
            ),

            // Store Heart Rate Button
            SizedBox(
              height: 65,
              width: 360,
              child: Padding(
                padding: const EdgeInsets.only(top: 20.0),
                child: ElevatedButton(
                  onPressed: _updateText,
                  child: const Text(
                    'Store Heart Rate',
                    style: TextStyle(
                      color: Color.fromARGB(255, 3, 59, 105),
                      fontSize: 20,
                    ),
                  ),
                ),
              ),
            ),

            // Result display container
            Container(
              margin: const EdgeInsets.all(20),
              padding: const EdgeInsets.all(20),
              child: buildFutureBuilder(),
            ),

            // ✅ Back to Home Button
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
              ),
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text(
                'Back to Home',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }

  FutureBuilder<String> buildFutureBuilder() {
    return FutureBuilder<String>(
      future: futureStoreHeartRate,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return Center(child: Text(snapshot.data!));
        } else if (snapshot.hasError) {
          return Text('${snapshot.error}');
        } else {
          if (futureStoreHeartRate == null) {
            return const Text('No Results.');
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        }
      },
    );
  }
}
