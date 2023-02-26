import 'dart:async';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class GoogleMapsLocation extends StatefulWidget {
  const GoogleMapsLocation({super.key});

  @override
  _GoogleMapsLocationState createState() => _GoogleMapsLocationState();
}

class _GoogleMapsLocationState extends State<GoogleMapsLocation> {
  final Completer<GoogleMapController> _completer = Completer();

  double? latitude;
  double? longitude;

  Future<void> latitudeProcess() async {
    await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high,
    ).then((value) {
      setState(() {
        latitude = value.latitude;
      });
    });
  }

  Future<void> longitudeProcess() async {
    await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high,
    ).then((value) {
      setState(() {
        longitude = value.longitude;
      });
    });
  }

  Future<void> checkGPS() async {
    await Geolocator.requestPermission().whenComplete(() async {
      await latitudeProcess();
      await longitudeProcess();
    });
  }

  @override
  void initState() {
    checkGPS();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final CameraPosition cameraPosition = CameraPosition(
      target: LatLng(
        latitude!,
        longitude!,
      ),
      zoom: 8.5,
      bearing: 16.5,
      tilt: 16.5,
    );

    List<Marker> marker = [];

    marker.add(
      const Marker(
        markerId: MarkerId("My Location"),
        draggable: false,
        flat: true,
        position: LatLng(30.068826, 31.178913),
        visible: true,
      ),
    );

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          leading: Container(),
          title: const Text("Location Service"),
        ),
        body: Column(
          children: [
            SizedBox(
              height: 250,
              child: GoogleMap(
                mapType: MapType.normal,
                initialCameraPosition: cameraPosition,
                markers: Set.from(marker),
                myLocationEnabled: true,
                myLocationButtonEnabled: true,
                zoomGesturesEnabled: true,
                zoomControlsEnabled: true,
                onMapCreated: (GoogleMapController googleMapController) {
                  _completer.complete(googleMapController);
                },
              ),
            ),
            const SizedBox(height: 12.0),
            const Card(
              child: ListTile(
                title: Text(
                  "CineWorld",
                  style: TextStyle(
                      color: Colors.black, fontWeight: FontWeight.bold),
                ),
                leading: Icon(
                  Icons.directions,
                  color: Colors.deepOrange,
                ),
                subtitle: Text(
                  "105 El-Nozha Street, El-Sheikh Zayed City.",
                  style: TextStyle(color: Colors.black26),
                ),
              ),
            ),
            const Card(
              child: ListTile(
                title: Text(
                  "Dream Palace",
                  style: TextStyle(
                      color: Colors.black, fontWeight: FontWeight.bold),
                ),
                leading: Icon(
                  Icons.directions,
                  color: Colors.deepOrange,
                ),
                subtitle: Text(
                  "77 El-Zohor Street, El-Obour City.",
                  style: TextStyle(color: Colors.black26),
                ),
              ),
            ),
            const Card(
              child: ListTile(
                title: Text(
                  "Galaxy Star",
                  style: TextStyle(
                      color: Colors.black, fontWeight: FontWeight.bold),
                ),
                leading: Icon(
                  Icons.directions,
                  color: Colors.deepOrange,
                ),
                subtitle: Text(
                  "5 Talaat Mostafa Street, Al-Rehab, New Cairo City.",
                  style: TextStyle(
                    color: Colors.black26,
                  ),
                ),
              ),
            ),
            const Card(
              child: ListTile(
                title: Text(
                  "CircuitTheater",
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                leading: Icon(
                  Icons.directions,
                  color: Colors.deepOrange,
                ),
                subtitle: Text(
                  "33 Street, 250 Maadi Grand Mall, El-Maadi.",
                  style: TextStyle(color: Colors.black26),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
