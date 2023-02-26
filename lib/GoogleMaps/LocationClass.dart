class LocationClass{

  final double? lng;
  final double? lat;

  LocationClass(
      {this.lng,
      this.lat}
      );

  LocationClass.fromJson(Map<dynamic,dynamic> parsedJson)
  :lat = parsedJson['lat'],
  lng = parsedJson['lng'];
  
}