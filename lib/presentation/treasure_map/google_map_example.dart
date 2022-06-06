import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapSample extends StatefulWidget {
  @override
  State<MapSample> createState() => MapSampleState();
}

class MapSampleState extends State<MapSample> {
  @override
  void initState() {
    super.initState();
    _markers.add(Marker(
        markerId: MarkerId('1'),
        draggable: true,
        onTap: () => print('서울숲 별빛공원'),
        position: LatLng(37.54541905, 127.03828863)));

    _markers.add(Marker(
        markerId: MarkerId('2'),
        draggable: true,
        onTap: () => print('서울숲 입구'),
        position: LatLng(37.54441171, 127.03750708)));
  }

  Completer<GoogleMapController> _controller = Completer();

  List<Marker> _markers = [];

  static final CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(37.54541905, 127.03828863),
    zoom: 14.4746,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GoogleMap(
        mapType: MapType.normal,
        markers: Set.from(_markers),
        initialCameraPosition: _kGooglePlex,
        myLocationButtonEnabled: false,
        // onCameraMove: ((_position) => _updatePosition(_position)),
      ),
    );
  }

  void _updatePosition(CameraPosition _position) {
    var m = _markers.firstWhere(
          (element) => element.markerId == MarkerId('1'),
      orElse: null,
    );
    _markers.remove(m);
    _markers.add(
        Marker(
          markerId: MarkerId('1'),
          position: LatLng(
              _position.target.latitude, _position.target.longitude),
          draggable: true,
        ),
    );
    setState(() {});
  }
}
