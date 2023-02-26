import 'package:geolocator/geolocator.dart';

class Geolocation{

  Future<Position> getLocation() async =>
     await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);


}