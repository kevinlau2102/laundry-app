import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class GoogleMapsWidget extends StatefulWidget {
  const GoogleMapsWidget({super.key});

  @override
  State<GoogleMapsWidget> createState() => GoogleMapsWidgetState();
}

class GoogleMapsWidgetState extends State<GoogleMapsWidget> {
  final Completer<GoogleMapController> _controller = Completer();

  final CameraPosition _kGooglePlex = const CameraPosition(
    target: LatLng(-6.88617104524478, 107.58111917761019),
    zoom: 15,
  );

  // final CameraPosition _kLake = const CameraPosition(
  //     bearing: 192.8334901395799,
  //     target: LatLng(37.43296265331129, -122.08832357078792),
  //     tilt: 59.440717697143555,
  //     zoom: 19.151926040649414);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GoogleMap(
        mapType: MapType.terrain,
        initialCameraPosition: _kGooglePlex,
        onMapCreated: _onMapCreated,
        markers: Set<Marker>.of(markers.values),
      ),
    );
  }

  Map<MarkerId, Marker> markers =
      <MarkerId, Marker>{}; // CLASS MEMBER, MAP OF MARKS



  void _onMapCreated(GoogleMapController controller) {
    _controller.complete(controller);

    var markerIdVal = "Kost Favorite";
    final MarkerId markerId = MarkerId(markerIdVal);

    // creating a new MARKER
    final Marker marker = Marker(
      markerId: markerId,
      position: const LatLng(-6.88617104524478, 107.58111917761019
      ),
      infoWindow: InfoWindow(title: markerIdVal),
    );

    setState(() {
      // adding a new marker to map
      markers[markerId] = marker;
    });
  }

  // Future<void> _goToTheLake() async {
  //   final GoogleMapController controller = await _controller.future;
  //   controller.animateCamera(CameraUpdate.newCameraPosition(_kLake));
  // }
}
