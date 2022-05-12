import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:weatherapp/services/networking.dart';
import '../services/location.dart';
import 'location_screen.dart';

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
    NetworkHelper networkHelper = NetworkHelper('https://api.openweathermap.org/data/2.5/weather?lat=$latitude&lon=$longitude&appid=$apiKey&units=metric');

    var weatherData = await networkHelper.getData();
    Navigator.push(context, MaterialPageRoute(builder: (context){
      return LocationScreen(locationWeather: weatherData);
    }));
  }

  @override
  Widget build(BuildContext context) {
  return const Scaffold(
    body: Center(
      child: SpinKitChasingDots(
        color: Colors.yellowAccent,
        // size: 100.0,
      ),
    ),
    );
  }
}
