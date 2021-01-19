import 'package:flutter/material.dart';
import 'package:music_app/src/ui/screens/login_signup_slideshow_screen/login_signup_slideshow_screen.dart';
import 'package:music_app/src/ui/screens/main_screen/main_screen.dart';
import 'package:music_app/src/ui/screens/player_screen/player_screen.dart';
import 'package:music_app/src/ui/screens/settings_screen/settings_screen.dart';
import 'package:music_app/src/ui/screens/song_list_screen/song_list_screen.dart';
import 'package:music_app/src/ui/screens/splash_screen/splash_screen.dart';

final Map<String, WidgetBuilder> routes = {
  'splash': (BuildContext context) => SplashScreen(),
  'login': (BuildContext context) => LoginSignupSlideshowScreen(),
  'main': (BuildContext context) => MainScreen(),
  'song_list': (BuildContext context) => SongListPage(),
  'player': (BuildContext context) => PlayerScreen(),
  'settings': (BuildContext context) => SettingsScreen()
};
