import 'package:flutter/material.dart';
import 'package:weatherapp/services/networking.dart';
import '../services/location.dart';

const apiKey = 'a2821380a396d4fcdb70b99d8c59c36a';

class LoadingScreen extends StatefulWidget {


  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {

  late double longitude;
  late double latitude;

  // String url = '';
  void initState () {
    super.initState();
    getLocationData();
  }

  void  getLocationData () async {
    Location location = Location();
    await location.getCurrentLocation();
    longitude = location.longitude;
    latitude = location.latitide;
    NetworkHelper networkHelper = NetworkHelper('https://api.openweathermap.org/data/2.5/weather?lat=$latitude&$longitude=139&appid=$apiKey');

    var weatherData = await networkHelper.getData();
  }

  @override
  Widget build(BuildContext context) {
  return Scaffold(
      appBar: AppBar(
        title: Text(
            'Weather App',
            style: TextStyle(
                fontSize: 24,
                letterSpacing: 2,
                fontWeight: FontWeight.bold
            ),
        ),
      ),
    );
  }
}
