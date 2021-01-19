import 'dart:async';

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class SplashScreen extends StatefulWidget {
  SplashScreen({Key key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        body: Center(child: LottieBuilder.asset('assets/music_volumen.json')));
  }

  @override
  void initState() {
    super.initState();
    _countDown();
  }

  Future<Timer> _countDown() async {
    return Timer(Duration(seconds: 1),
        () => Navigator.pushReplacementNamed(context, 'login'));
  }
}
