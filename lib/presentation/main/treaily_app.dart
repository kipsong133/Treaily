import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:treaily/base/constants/route+constants.dart';
import 'package:treaily/presentation/treasure_map/treasure_map_view.dart';
import 'package:treaily/presentation/treasure_map/treasure_map_viewmodel.dart';

import '../splash/splash_view.dart';
import '../splash/splash_viewmodel.dart';

class TreailyApp extends StatefulWidget {
  const TreailyApp({Key? key}) : super(key: key);

  @override
  State<TreailyApp> createState() => _TreailyAppState();
}

class _TreailyAppState extends State<TreailyApp> {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(providers: [
      ChangeNotifierProvider(create: (context) => SplashViewModel()),
      ChangeNotifierProvider(create: (context) => TreasureMapViewModel()),
    ],
      child: _routingView(),
    );
  }

  _routingView() {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: TreailyRouter.splash,
      routes: {
        TreailyRouter.splash: (context) => SplashView(),
        TreailyRouter.treaureMap: (context) => TreasureMapView(),
      },
    );
  }
}