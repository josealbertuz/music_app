import 'package:flutter/material.dart';

class PlaylistItem extends StatelessWidget {
  final imageUrl;
  final songName;
  final artistName;

  PlaylistItem({@required this.imageUrl, @required this.songName, @required this.artistName});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.pushNamed(context, 'song_list'),
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
                        image: AssetImage(imageUrl), fit: BoxFit.cover)),
              ),
              Text(songName,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
              Text(artistName,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16))
            ],
          )),
    );
  }
}
