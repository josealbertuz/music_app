import 'package:flutter/material.dart';
import 'package:music_app/src/bloc/player_bloc.dart';
import 'package:music_app/src/bloc/song_list_bloc.dart';
import 'package:music_app/src/models/album_model.dart';

class SongListScreen extends StatelessWidget {
  const SongListScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: StreamBuilder(
          stream: SongListBloc().albumStream,
          builder: (context, snapshot) {
            return snapshot.hasData
                ? SingleChildScrollView(
                    child: Column(
                      children: [
                        _SongListHeader(album: snapshot.data),
                        _SongListBody(album: snapshot.data),
                        SizedBox(
                            height: MediaQuery.of(context).size.height * 0.09)
                      ],
                    ),
                  )
                : Center(child: CircularProgressIndicator());
          })
      ),
    );
  }
}

class _SongListBody extends StatelessWidget {
  final Album album;

  const _SongListBody({Key key, this.album}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: EdgeInsets.all(10),
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: album.songs.length,
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () => PlayerBloc().addSong(album.songs[index]),
                  child: ListTile(
            title: Text(album.songs[index].name),
            subtitle: Text(album.songs[index].artist),
          ),
        );
      },
    );
  }
}

class _SongListHeader extends StatelessWidget {
  final Album album;

  const _SongListHeader({Key key, this.album}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    return Container(
      height: screenSize.height * 0.52,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: EdgeInsets.fromLTRB(0, 40, 0, 20),
            child: Image(
                width: 170,
                height: 170,
                image: NetworkImage(album.cover)),
          ),
          Text(album.name,
              style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold)),
          OutlinedButton(
              style: OutlinedButton.styleFrom(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
              ),
              onPressed: null,
              child: Text('Save', style: TextStyle(fontSize: 16))),
          Text('Album by ${album.artist} . ${album.release}'),
          SizedBox(height: 10),
          TextButton(
              style: TextButton.styleFrom(
                backgroundColor: Colors.green,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
                padding: EdgeInsets.fromLTRB(65, 15, 65, 15),
              ),
              onPressed: null,
              child: Text('Shuffle play',
                  style: TextStyle(fontSize: 16, color: Colors.white)))
        ],
      ),
    );
  }
}
