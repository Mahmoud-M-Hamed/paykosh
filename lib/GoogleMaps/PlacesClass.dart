import 'package:paykosh/GoogleMaps/Geometry.dart';

class Place{

  String? name , vicinity;
  double? rating;
  int? userRatingCount;
  Geometry? geometry;
  
  Place({this.name,this.geometry,this.rating,this.vicinity,this.userRatingCount});
  
  Place.fromJson(Map<dynamic,dynamic> parsedJson)
  : name = parsedJson['name'],
  rating = (parsedJson['rating'] != null) ? parsedJson['rating'].toDouble() : null,
  userRatingCount = (parsedJson['user_rating_total'] != null) ? parsedJson['user_rating_total'] : null,
  vicinity = parsedJson['vicinity'],
  geometry = Geometry.fromJson(parsedJson['geometry']);
}