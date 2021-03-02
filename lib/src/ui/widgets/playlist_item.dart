import 'package:flutter/material.dart';
import 'package:music_app/src/bloc/main_bloc.dart';
import 'package:music_app/src/bloc/song_list_bloc.dart';
import 'package:music_app/src/models/album_model.dart';

class PlaylistItem extends StatelessWidget {
  final Album album;

  const PlaylistItem({@required this.album});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        SongListBloc().fetchAlbumById(album.id);
        MainBloc().changeScreen(4);
      },
      child: Container(
          padding: EdgeInsets.all(8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                height: 150,
                width: 150,
                margin: EdgeInsets.only(bottom: 8),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    image: DecorationImage(
                        image: RegExp('^https.+').hasMatch(album.cover)
                            ? NetworkImage(album.cover)
                            : AssetImage(album.cover),
                        fit: BoxFit.cover)),
              ),
              Text(album.name,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
              Text(album.artist,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16))
            ],
          )),
    );
  }
}
