// ignore_for_file: dead_code, prefer_const_constructors

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../components/sidemenu.dart';

class MapGg extends StatefulWidget {
  MapGg({Key? key}) : super(key: key);

  @override
  State<MapGg> createState() => _MapGgState();
}

class _MapGgState extends State<MapGg> {
  Completer<GoogleMapController> _controller = Completer();
  Set<Marker> marker = const <Marker>{};
  LatLng? loca;


  

  static final CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(37.42796133580664, -122.085749655962),
    zoom: 14.4746,
  );

  static final CameraPosition _kLake = CameraPosition(
      bearing: 192.8334901395799,
      target: LatLng(37.43296265331129, -122.08832357078792),
      tilt: 59.440717697143555,
      zoom: 19.151926040649414);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('GoogleMap'),
      ),
      body: GoogleMap(
        mapType: MapType.hybrid,
        initialCameraPosition: _kGooglePlex,
        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
        },
        onTap: (LatLng value) {
          setState(() {

            marker.add(Marker(
                markerId: MarkerId('MarkarLocation'),
                position: value,
                infoWindow: InfoWindow(
                    title: 'MarkerLocation', snippet: 'รายละเอียด')));
          });
        },
        markers: marker,
      ),
      // floatingActionButton: FloatingActionButton.extended(
      //   onPressed: _goToTheLake,
      //   label: Text('To the lake!'),
      //   icon: Icon(Icons.directions_boat),
      // ),
      drawer: SideMenu(),
    );
  }

  Future<void> _goToTheLake() async {
    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(_kLake));
  }
}
