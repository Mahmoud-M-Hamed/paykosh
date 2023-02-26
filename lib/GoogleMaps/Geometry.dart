import 'LocationClass.dart';

class Geometry{

  final LocationClass locationClass;
  Geometry({required this.locationClass});

  Geometry.fromJson(Map<dynamic,dynamic> parsedJson)
  : locationClass = LocationClass.fromJson(parsedJson['location']);
}