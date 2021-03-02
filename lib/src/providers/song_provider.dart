import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:music_app/src/models/song_model.dart';

class SongProvider {
  final String _endPoint =
      'https://my-api-music-app.herokuapp.com/index.php/song';

  final String key;

  SongProvider(this.key);

  Future<List<Song>> searchSongByName(String name) async {
    final response = await http.get('$_endPoint/search/$name',
    headers: {
      'X-API-KEY' : key
    }
    );

    final json = jsonDecode(response.body);

    return json['err'] ? [] : Song.songsFromJson(json['songs']);
  }
}
