import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:music_app/src/ui/widgets/minimized_player.dart';
import 'package:music_app/src/utils/constants.dart';
import 'package:provider/provider.dart';

class MainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => _MainModel(),
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(child: Builder(
          builder: (context) {
            final mainModel = Provider.of<_MainModel>(context);

            return Stack(
              fit: StackFit.loose,
              children: [
                bottomAppBarOptions[mainModel.selectedIndex],
                _MinimizedPlayerPositioned()
              ],
            );
          },
        )),
        bottomNavigationBar: _BottomAppBar(),
      ),
    );
  }
}

class _MinimizedPlayerPositioned extends StatelessWidget {
  const _MinimizedPlayerPositioned({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(bottom: 0, right: 0, child: MinimizedPlayer());
  }
}

class _BottomAppBar extends StatelessWidget {
  const _BottomAppBar({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final mainModel = Provider.of<_MainModel>(context);

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
        selectedIndex: mainModel.selectedIndex,
        onTabChange: (index) {
          mainModel.selectedIndex = index;
        });
  }
}

class _MainModel with ChangeNotifier {
  int _seletecIndex = 0;

  int get selectedIndex => _seletecIndex;

  set selectedIndex(int value) {
    _seletecIndex = value;
    notifyListeners();
  }
}
