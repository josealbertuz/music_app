import 'package:flutter/material.dart';
import 'package:music_app/src/ui/widgets/title.dart' as title;
import 'package:music_app/src/utils/constants.dart';

class LibraryScreen extends StatefulWidget {
  LibraryScreen({Key key}) : super(key: key);

  @override
  _LibraryScreenState createState() => _LibraryScreenState();
}

class _LibraryScreenState extends State<LibraryScreen>
    with SingleTickerProviderStateMixin {
  final tabBarStyle = TextStyle(fontSize: 18, fontWeight: FontWeight.bold);
  TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(length: 3, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: title.Title(title: 'Your library'),
          ),
          TabBar(
              controller: _tabController,
              indicatorColor: Colors.black,
              labelColor: Colors.black,
              indicatorSize: TabBarIndicatorSize.label,
              isScrollable: true,
              tabs: [
                Text('Playlist', style: tabBarStyle),
                Text('Artist', style: tabBarStyle),
                Text('Albums', style: tabBarStyle),
              ]),
          Expanded(
              child: TabBarView(controller: _tabController, children: [
            _PlaylistTab(),
            _ArtistTab(),
            _AlbumTab()
          ]))
        ],
      ),
    );
  }
}

class _AlbumTab extends StatelessWidget {
  const _AlbumTab({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        child: ListView.builder(
          padding: EdgeInsets.only(bottom: 50),
            itemCount: myAlbums.length,
            itemBuilder: (context, index) {
              return ListTile(
                leading: SizedBox(
                  height: 70,
                  width: 60,
                  child: Image(image: AssetImage(myAlbums[index]['photo']), fit: BoxFit.cover,),
                ),
                title: Text(myAlbums[index]['title'], overflow: TextOverflow.ellipsis),
                subtitle: Text(myAlbums[index]['artist']),
              );
            }));
  }
}

class _ArtistTab extends StatelessWidget {
  const _ArtistTab({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        child: ListView.builder(
            padding: EdgeInsets.only(bottom: 50),
            itemCount: myArtist.length,
            itemBuilder: (context, index) {
              return ListTile(
                leading: CircleAvatar(
                  backgroundImage: AssetImage(myArtist[index]['photo']),
                  radius: 40,
                ),
                title: Text(myArtist[index]['name']),
                subtitle: Text('Songs ${myArtist[index]['songs']}'),
              );
            }));
  }
}

class _PlaylistTab extends StatelessWidget {
  const _PlaylistTab({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
          padding: EdgeInsets.only(bottom: 50),
          itemCount: myPlaylist.length,
          itemBuilder: (context, index) {
            return ListTile(
              leading: SizedBox(
                height: 70,
                width: 55,
                child: 
              Image(image: 
              AssetImage(myPlaylist[index]['photo']), fit: BoxFit.cover,)),
              title: Text(myPlaylist[index]['name']),
              subtitle: Text('by ${myPlaylist[index]['by']}')
            );
          }),
    );
  }
}