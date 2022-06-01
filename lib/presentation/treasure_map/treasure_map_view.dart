import 'package:flutter/material.dart';

class TreasureMapView extends StatefulWidget {
  const TreasureMapView({Key? key}) : super(key: key);

  @override
  State<TreasureMapView> createState() => _TreasureMapViewState();
}

class _TreasureMapViewState extends State<TreasureMapView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Center(child: Text('MapView'),),);
  }
}
