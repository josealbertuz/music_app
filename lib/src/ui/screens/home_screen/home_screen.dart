import 'package:flutter/material.dart';
import 'package:music_app/src/ui/widgets/playlist_item.dart';
import 'package:music_app/src/ui/widgets/title.dart' as title;
import 'package:music_app/src/ui/widgets/title_with_icon.dart';
import 'package:music_app/src/utils/constants.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.all(10),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TitleWithIcon(title: 'New Releases', icon: Icons.settings, route: 'settings'),
              _NewReleases(),
              title.Title(title: 'Recently played'),
              _PlaylistView(playlistItems),
              title.Title(title: 'Made for you'),
              _PlaylistView(playlistItems),
              title.Title(title: 'Based on your listening'),
              _PlaylistView(playlistItems),
              SizedBox(height: MediaQuery.of(context).size.height * 0.09)
            ],
          ),
        ));
  }
}

class _NewReleases extends StatelessWidget {
  const _NewReleases({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    return Container(
        width: double.infinity,
        height: screenSize.height * 0.32,
        child: ListView(
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          physics: ClampingScrollPhysics(),
          children: newReleasesList,
        ));
  }
}

class _PlaylistView extends StatelessWidget {
  final List<PlaylistItem> _playlistList;

  _PlaylistView(this._playlistList);

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    return Container(
        margin: EdgeInsets.only(top: 15),
        height: screenSize.height * 0.29,
        child: ListView(
          scrollDirection: Axis.horizontal,
          shrinkWrap: true,
          physics: ClampingScrollPhysics(),
          children: _playlistList,
        ));
  }
}


