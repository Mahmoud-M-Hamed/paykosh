import 'PlacesClass.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

class PlacesServices {
  final key = 'AIzaSyCff3CCHJoCi8pOpjOVJhSyZGcFzAnDO4k';
  final distance = 9100.5;

  Future<List<Place>> getPlaces(double lat, double lng) async {
    Uri url = Uri.parse(
        'https://maps.googleapis.com/maps/api/place/nearbysearch/json?location=$lng,$lat&type=cinema&rankby=$distance&key=$key');
    var response = await http.get(url);
    var json = convert.jsonDecode(response.body);
    var jsonResults = json['results'] as List;
    return jsonResults.map((place) => Place.fromJson(place)).toList();
  }
}
