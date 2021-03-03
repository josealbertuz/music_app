import 'package:flutter/material.dart';
import 'package:music_app/src/bloc/home_bloc.dart';
import 'package:music_app/src/models/album_model.dart';
import 'package:music_app/src/ui/widgets/creation_aware_list_item.dart';
import 'package:music_app/src/ui/widgets/placeholder_container.dart';
import 'package:music_app/src/ui/widgets/playlist_item.dart';
import 'package:music_app/src/ui/widgets/title.dart' as title;
import 'package:music_app/src/ui/widgets/title_with_icon.dart';
import 'package:music_app/src/utils/constants.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    HomeBloc().initStream();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.all(10),
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TitleWithIcon(
                  title: 'New Releases',
                  icon: Icons.settings,
                  route: 'settings'),
              _NewReleases(),
              title.Title(title: 'Recently played'),
              StreamBuilder(
                  stream: HomeBloc().albumStream,
                  builder: (context, snapshot) {
                    return snapshot.hasData
                        ? _RecentlyPlayed(albums: snapshot.data)
                        : _AlbumListPlaceholder();
                  }),
              title.Title(title: 'Made for you'),
              _PlaylistView(playlistItems),
              title.Title(title: 'Based on your listening'),
              _PlaylistView(playlistItems),
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

class _RecentlyPlayed extends StatelessWidget {
  final List<Album> albums;

  const _RecentlyPlayed({Key key, @required this.albums}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    return Container(
        height: screenSize.height * 0.29,
        child: ListView.builder(
            physics: BouncingScrollPhysics(),
            scrollDirection: Axis.horizontal,
            itemCount: albums.length,
            itemBuilder: (context, index) => CreationAwareListItem(
                itemCreated: () {
                  if ((albums.length - 1) == index) HomeBloc().fetchAlbums();
                },
                child: PlaylistItem(
                  album: albums[index],
                ))));
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

class _AlbumListPlaceholder extends StatelessWidget {
  const _AlbumListPlaceholder({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    return Container(
        height: screenSize.height * 0.2,
        child: ListView(
            physics: BouncingScrollPhysics(),
            scrollDirection: Axis.horizontal,
            children: List<Widget>.generate(4, (index) {
              return PlaceholderContainerAnimation(
                margin: EdgeInsets.symmetric(horizontal: 10),
                width: 150,
                height: 150,
              );
            })));
  }
}
