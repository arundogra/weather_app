import 'package:geolocator/geolocator.dart';

class Location {

   late double latitide;
   late double longitude;

  Future<void> getCurrentLocation() async {
    try {
      Geolocator.requestPermission();
      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high);
      latitide = position.latitude;
      longitude = position.longitude;
      // print(position);
    }
    catch (e) {
      print(e);
    }
  }
}