import 'dart:async';
import 'dart:typed_data';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:inovolatask/feature/domain/entites/reservation.dart';
import 'package:intl/intl.dart';

class LocationHelper {
  static Future<Position> determineCurrentLocation() async {
    bool isServiceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!isServiceEnabled) {
      await Geolocator.requestPermission();
    }
    return await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high,
    );
  }
}

class GeolocatorService {
  static Future<Position?> determinePosition() async {
    LocationPermission permission;
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.deniedForever) {
        return Future.error('Location Not Available');
      }
    } else {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.deniedForever) {
        return Future.error('Location Not Available');
      }
    }
    return await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high,
    );
  }
}

class MyMap extends StatefulWidget {
  final List<Reservation> reservation;

  MyMap({required this.reservation});

  @override
  _MyMapState createState() => _MyMapState();
}

class _MyMapState extends State<MyMap> {
  Completer<GoogleMapController> mapController = Completer();
  List<Marker> myMarkers = [];

  Future<Uint8List> getMarker() async {
    ByteData byteData = await rootBundle.load("assets/images/maplabel.png");
    return byteData.buffer.asUint8List();
  }

  static Position? position;

  double? lat;
  double? long;

  Future<void> getCurrentLocation() async {
    position = await GeolocatorService.determinePosition().whenComplete(() {
      setState(() {});
    });
  }

  Widget buildMAp() {
    return GoogleMap(
      initialCameraPosition: CameraPosition(
        bearing: 0.0,
        target: LatLng(
          double.tryParse(widget.reservation[0].latitude) ?? 0.0,
          double.tryParse(widget.reservation[0].longitude) ?? 0.0,
        ),
        tilt: 0.0,
        zoom: 14,
      ),
      mapType: MapType.normal,
      myLocationButtonEnabled: true,
      zoomControlsEnabled: false,
      myLocationEnabled: false,
      markers: Set.from(myMarkers),
      onMapCreated: (GoogleMapController _controller) async {
        mapController.complete(_controller);
        setState(() {
          myMarkers = [];
          myMarkers.add(
            Marker(
              markerId: MarkerId(
                widget.reservation[0].latitude,
              ),
              position: LatLng(
                double.tryParse(
                      widget.reservation[0].latitude,
                    ) ??
                    0.0,
                double.tryParse(
                      widget.reservation[0].longitude,
                    ) ??
                    0.0,
              ),
            ),
          );
        });
      },
      onTap: (LatLng latLng) {

        lat = latLng.latitude;
        long = latLng.longitude;
        setState(() {
          myMarkers = [];
          myMarkers.add(
            Marker(
                markerId: MarkerId(latLng.longitude.toString()),
                position: latLng),
          );
        });
      },
    );
  }


  @override
  void initState() {
    getCurrentLocation();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          position != null
              ? buildMAp()
              : Center(
                  child: Container(
                    child: CircularProgressIndicator(
                      color: Colors.blue,
                    ),
                  ),
                ),
        ],
      ),
    );
  }
}
