import 'package:flutter/material.dart';
import 'api_functions.dart'; // Make sure this has your getHeartRate function

class GetData extends StatefulWidget {
  const GetData({super.key});

  @override
  State<GetData> createState() => _GetDataState();
}

class _GetDataState extends State<GetData> {
  Future<String>? futureHeartRate;
  final TextEditingController _controllerStartDate = TextEditingController();
  final TextEditingController _controllerEndDate = TextEditingController();

  @override
  void initState() {
    super.initState();
    _controllerStartDate.text = '2025-02-14';
    _controllerEndDate.text = '2025-02-14';
  }

  @override
  void dispose() {
    _controllerStartDate.dispose();
    _controllerEndDate.dispose();
    super.dispose();
  }

  void _fetchHeartRateData() {
    futureHeartRate =
        getHeartRate(_controllerStartDate.text, _controllerEndDate.text);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Get Heart Rate Data'),
        backgroundColor: Colors.blue,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            const Padding(padding: EdgeInsets.only(top: 40.0)),

            // Start Date Input
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: TextField(
                controller: _controllerStartDate,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Start Date',
                  hintText: 'Enter start date: yyyy-mm-dd',
                ),
              ),
            ),

            // End Date Input
            Padding(
              padding: const EdgeInsets.only(left: 15.0, right: 15.0, top: 15),
              child: TextField(
                controller: _controllerEndDate,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'End Date',
                  hintText: 'Enter end date: yyyy-mm-dd',
                ),
              ),
            ),

            // Get Heart Rate Data Button
            SizedBox(
              height: 65,
              width: 360,
              child: Padding(
                padding: const EdgeInsets.only(top: 20.0),
                child: ElevatedButton(
                  child: const Text(
                    'Get Heart Rate Data',
                    style: TextStyle(
                      color: Color.fromARGB(255, 3, 59, 105),
                      fontSize: 20,
                    ),
                  ),
                  onPressed: _fetchHeartRateData,
                ),
              ),
            ),

            // Display Results
            Container(
              margin: const EdgeInsets.all(20),
              padding: const EdgeInsets.all(20),
              child: buildFutureBuilder(),
            ),

            // Back to Home Button
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
      future: futureHeartRate,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return Center(child: Text(snapshot.data!));
        } else if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        } else {
          if (futureHeartRate == null) {
            return const Text('No data fetched yet.');
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        }
      },
    );
  }
}
