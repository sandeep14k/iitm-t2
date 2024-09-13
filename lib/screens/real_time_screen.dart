import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class RealTimeScreen extends StatefulWidget {
  @override
  _RealTimeScreenState createState() => _RealTimeScreenState();
}

class _RealTimeScreenState extends State<RealTimeScreen> {
  var weatherData;

  void fetchWeather() async {
    final response = await http.get(Uri.parse(
      'http://api.weatherstack.com/current?access_key=2dede383f6d4bbcdda5be9097c780163&query=New%20York',
    ));

    if (response.statusCode == 200) {
      setState(() {
        weatherData = json.decode(response.body);
      });
    } else {
      // Handle the error appropriately
      print('Failed to load weather data');
    }
  }

  @override
  void initState() {
    super.initState();
    fetchWeather();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Real-Time Weather')),
      body: weatherData != null
          ? Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                      'Temperature: ${weatherData['current']['temperature']} °C'),
                  Text(
                      'Condition: ${weatherData['current']['weather_descriptions'][0]}'),
                ],
              ),
            )
          : Center(child: CircularProgressIndicator()),
    );
  }
}
