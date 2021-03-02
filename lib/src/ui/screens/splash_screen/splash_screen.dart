import 'dart:async';

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:music_app/src/bloc/main_bloc.dart';
import 'package:music_app/src/database/app_db.dart';

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
    _initApp();
  }

  Future<Timer> _initApp() async {
    return Timer(Duration(seconds: 1), () {
      AppDb().readUser().then((user) {
        if (user != null) {
          AppDb().readCurrentScreen().then((value) {
            MainBloc()
              ..sinkUser(user)
              ..changeScreen(value);
            Navigator.pushReplacementNamed(context, 'main');
          });
        } else {
          Navigator.pushReplacementNamed(context, 'login');
        }
      });
    });
  }
}
