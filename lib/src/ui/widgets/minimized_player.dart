import 'package:flutter/material.dart';
import 'package:music_app/src/models/song_model.dart';

class MinimizedPlayer extends StatelessWidget {
  final Song song;

  const MinimizedPlayer({this.song});

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    return GestureDetector(
      onTap: song.name.isNotEmpty ? () => Navigator.of(context).pushNamed('player') : null,
      child: Container(
          width: screenSize.width,
          height: screenSize.height * 0.09,
          decoration: BoxDecoration(
              border: Border(top: BorderSide(color: Colors.black)),
              color: Colors.white),
          child: Row(
            children: [
              Image(image: song.name.isEmpty ? AssetImage(song.cover) : NetworkImage(song.cover)),
              Container(
                padding: EdgeInsets.all(15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(song.name,
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold)),
                    Text(song.artist, style: TextStyle(fontSize: 14))
                  ],
                ),
              ),
              Spacer(),
              IconButton(
                  icon: Icon(Icons.favorite_border, size: 30),
                  onPressed: () => null),
              SizedBox(width: 10),
              IconButton(
                  icon: Icon(
                    Icons.play_arrow,
                    size: 35,
                  ),
                  onPressed: () => null),
              SizedBox(width: 10)
            ],
          )),
    );
  }
}
