import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:treaily/base/constants/route+constants.dart';
import '../common/BorderTextFieldDecoration.dart';
import '../common/ContainerShadowDecoration.dart';

class TreasureMapView extends StatefulWidget {
  const TreasureMapView({Key? key}) : super(key: key);

  @override
  State<TreasureMapView> createState() => _TreasureMapViewState();
}

class _TreasureMapViewState extends State<TreasureMapView> {
  // Completer<GoogleMapController> _controller = Completer();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // 지도가 위치할 컨테이너
          Container(
            color: Colors.white,
            child: SizedBox(
              width: double.infinity,
              height: double.infinity,
            ),
          ),

          SafeArea(
            child: Column(
              // Main Column
              children: [
                _textFieldStyleButton(context),
              ],
            ),
          ),

          Column(
            children: [
              Spacer(),
              Stack(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 30),
                    child: AddButton(),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 30, right: 22),
                    child: NavigatorIconButton(),
                  )
                ],
              ),
            ],
          )
        ],
      ),
    );
  }

  Padding _textFieldStyleButton(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 22, left: 22, right: 22),
      child: Container(
        decoration: ContainerShadowDecoration(),
        height: 48,
        child: Row(
          children: [
            Icon(Icons.menu),
            Expanded(
              child: Text('보물 검색'),
            ),
          ],
        ),
      ),
    );
  }
}

// class TreasureListButton extends StatelessWidget {
//   const TreasureListButton({
//     Key? key,
//   }) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return IconButton(
//         onPressed: () {
//           Navigator.of(context).pushNamed(TreailyRouter.treaureList);
//         },
//         icon: const Icon(
//           Icons.menu,
//           color: Colors.purple,
//         ));
//   }
// }

class AddButton extends StatelessWidget {
  const AddButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: FloatingActionButton(
        backgroundColor: Colors.purple,
        child: Icon(Icons.add),
        onPressed: () {},
      ),
    );
  }
}

class NavigatorIconButton extends StatelessWidget {
  const NavigatorIconButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomRight,
      child: FloatingActionButton(
        backgroundColor: Colors.purple,
        child: Icon(Icons.navigation_outlined),
        onPressed: () {},
      ),
    );
  }
}
