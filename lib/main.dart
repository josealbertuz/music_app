import 'package:flutter/material.dart';
import 'package:music_app/src/database/app_db.dart';
import 'package:music_app/src/my_app.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await AppDb().initHive();
  runApp(MyApp());
}
