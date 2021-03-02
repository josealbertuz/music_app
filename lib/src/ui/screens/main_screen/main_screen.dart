import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:music_app/src/bloc/main_bloc.dart';
import 'package:music_app/src/bloc/player_bloc.dart';
import 'package:music_app/src/models/song_model.dart';
import 'package:music_app/src/ui/widgets/minimized_player.dart';
import 'package:music_app/src/utils/constants.dart';

class MainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: StreamBuilder(
            stream: MainBloc().getIndexScreen,
            initialData: 0,
            builder: (context, snapshot) {
              return SafeArea(child: bottomAppBarOptions[snapshot.data]);
            }),
        bottomNavigationBar: _BottomAppBar(),
        bottomSheet: StreamBuilder(
            initialData: Song.placeholder(),
            stream: PlayerBloc().songStream,
            builder: (context, snapshot) {
              return MinimizedPlayer(song: snapshot.data);
            }));
  }
}

class _BottomAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: MainBloc().getIndexScreen,
      initialData: 0,
      builder: (context, snapshot) {
        return GNav(
            gap: 10,
            activeColor: Colors.white,
            iconSize: 24,
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
            tabMargin: EdgeInsets.all(5),
            duration: Duration(milliseconds: 200),
            tabBackgroundColor: Colors.black,
            tabs: [
              GButton(
                icon: FontAwesomeIcons.home,
                text: 'Home',
              ),
              GButton(
                icon: FontAwesomeIcons.search,
                text: 'Search',
              ),
              GButton(
                icon: FontAwesomeIcons.list,
                text: 'Library',
              ),
              GButton(
                icon: FontAwesomeIcons.user,
                text: 'Profile',
              ),
            ],
            selectedIndex: snapshot.data,
            onTabChange: (index) {
              MainBloc().changeScreen(index);
            });
      },
    );
  }
}
