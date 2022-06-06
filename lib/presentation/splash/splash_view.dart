import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:treaily/base/constants/route+constants.dart';

import '../authentication/auth_service.dart';

class SplashView extends StatefulWidget {
  const SplashView({Key? key}) : super(key: key);

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 1), () {
      final authService = context.read<AuthService>();
      final user = authService.currentUser();
      final routingView = (user == null) ? TreailyRouter.login : TreailyRouter.treaureMap;
      Navigator.of(context).pushReplacementNamed(routingView);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text('여기는 스플래시뷰')),
    );
  }
}
