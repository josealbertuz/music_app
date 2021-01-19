import 'package:flutter/material.dart';
import 'package:music_app/src/routes/app_routes.dart';
import 'package:music_app/src/ui/themes/app_theme.dart';
 
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Music app',
      theme: primaryTheme,
      routes: routes,
      initialRoute: 'splash',
    );
  }
}