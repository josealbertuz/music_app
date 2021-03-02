import 'package:flutter/material.dart';
import 'package:music_app/src/bloc/player_bloc.dart';
import 'package:music_app/src/models/song_model.dart';
import 'package:music_app/src/ui/widgets/gradient_background_from_image.dart';
import 'package:music_app/src/utils/app_utils.dart';

class PlayerScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: PlayerBloc().songStream,
        builder: (BuildContext context, AsyncSnapshot<Song> snapshot) {
          return snapshot.hasData
              ? Stack(
                  children: [
                    GradientBackgroundFromImage(image: snapshot.data.cover),
                    Scaffold(
                      backgroundColor: Colors.transparent,
                      appBar: _appBar(context, snapshot.data),
                      body: Column(
                        children: [
                          _SongCoverInfo(song: snapshot.data),
                          _MediaControls()
                        ],
                      ),
                    )
                  ],
                )
              : Center(child: CircularProgressIndicator());
        });
  }

  Widget _appBar(BuildContext context, Song song) {
    return AppBar(
      leading: IconButton(
        icon: Icon(Icons.keyboard_arrow_down),
        onPressed: () => Navigator.pop(context),
      ),
      title: Center(
        child: Column(
          children: [
            Text('Playing from album', style: TextStyle(fontSize: 14)),
            Text(song.album)
          ],
        ),
      ),
      actions: [
        SizedBox(width: 25),
        Icon(Icons.more_vert),
      ],
    );
  }
}

class _SongCoverInfo extends StatelessWidget {
  final Song song;

  const _SongCoverInfo({this.song});

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    return Center(
      child: Container(
        padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
        child: Column(
          children: [
            Container(
              height: screenSize.height * 0.58,
              width: screenSize.width * 0.9,
              child: Image(image: NetworkImage(song.cover)),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(song.name,
                        style: TextStyle(
                            fontSize: 23,
                            fontWeight: FontWeight.bold,
                            color: Colors.white)),
                    Text(song.artist,
                        style: TextStyle(fontSize: 18, color: Colors.white))
                  ],
                ),
                Icon(Icons.favorite_border, color: Colors.white, size: 35)
              ],
            )
          ],
        ),
      ),
    );
  }
}

class _MediaControls extends StatefulWidget {
  @override
  _MediaControlsState createState() => _MediaControlsState();
}

class _MediaControlsState extends State<_MediaControls> {
  double _currentSliderValue = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
      child: Column(
        children: [_slider(), _mediaPlayer()],
      ),
    );
  }

  Widget _slider() {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: Slider(
                  min: 0,
                  max: 210,
                  value: _currentSliderValue,
                  onChanged: (value) => setState(() {
                        _currentSliderValue = value;
                      })),
            )
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(secondsToMs(_currentSliderValue),
                style: TextStyle(color: Colors.white)),
            Text(secondsToMs(210), style: TextStyle(color: Colors.white))
          ],
        )
      ],
    );
  }

  Widget _mediaPlayer() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Icon(Icons.shuffle, color: Colors.white, size: 30),
        Icon(Icons.skip_previous, color: Colors.white, size: 45),
        Icon(Icons.play_circle_fill, color: Colors.white, size: 80),
        Icon(Icons.skip_next, color: Colors.white, size: 45),
        Icon(Icons.repeat, color: Colors.white, size: 30),
      ],
    );
  }
}
