import 'package:flutter/material.dart';
import '/utilities/constants.dart';
import 'package:weatherapp/services/weather.dart';
import 'city_screen.dart';

class LocationScreen extends StatefulWidget {

  LocationScreen({this.locationWeather});
  final locationWeather;


  @override
  _LocationScreenState createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {

  WeatherModel weather = WeatherModel();

  late int temprature;
  late String cityName;
  late String weatherIcon;
  late String weatherTemp;


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    updateUi(widget.locationWeather);
  }

  void updateUi(dynamic weatherData) {
    setState(() {
      if(weatherData == null) {
        temprature = 0;
        weatherIcon = 'Error';
        weatherTemp = 'Unable to get weather data';
        cityName = 'No data';
      }
      else {
        double temp = weatherData['main']['temp'];
        temprature =temp.toInt();
        cityName = weatherData['name'];
        var   condition = weatherData['weather'][0] ['id'];
        weatherIcon = weather.getWeatherIcon(condition);
        weatherTemp = weather.getMessage(temprature);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/bgg.png'),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
                Colors.black.withOpacity(0.4), BlendMode.srcIn),
          ),
        ),
        constraints: BoxConstraints.expand(),
        child: SafeArea(
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  FlatButton(
                    onPressed: () async {
                      var weatherData = await weather.getLocationWeather();
                      updateUi(weatherData);
                    },
                    child: Icon(
                      Icons.near_me,
                      color: Colors.blueGrey,
                      size: 28.0,
                    ),
                  ),
                  FlatButton(
                    onPressed: () async {
                      var typedName = await Navigator.push(context, MaterialPageRoute(builder: (context){
                        return CityScreen();
                      },
                      ),
                      );
                      if(typedName != null) {
                        var weatherData = await weather.getCityWeather(typedName);
                        updateUi(weatherData);
                      }
                    },
                    child: Icon(
                      Icons.location_city,
                      color: Colors.blueGrey,
                      size: 28.0,
                    ),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.only(left: 15.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      '$temprature°',
                      style: kTempTextStyle,
                    ),
                    Text(
                      '$weatherIcon️',
                      style: kConditionTextStyle,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(right: 15.0),
                child: Column(
                  children: [
                    Text(
                      '$weatherTemp',
                      style: TextStyle(
                          fontSize: 16,
                          letterSpacing: 3,
                          fontWeight: FontWeight.bold
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text('in',style: TextStyle(color: Colors.white,fontSize: 32,letterSpacing: 2 ),),
                    SizedBox(
                      height:4,
                    ),
                    Text('$cityName',
                        style: kMessageTextStyle,
                      )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
