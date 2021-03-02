import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:music_app/src/models/album_model.dart';

class AlbumProvider {
  final String _endPoint =
      'https://my-api-music-app.herokuapp.com/index.php/album';

  final String key;

  AlbumProvider(this.key);

  Future<Map<String, dynamic>> fetchAlbums(int page, int perPage) async {
    final response = await http.get('$_endPoint/pagination/$page/$perPage',
        headers: {'X-API-KEY': key});

    final json = jsonDecode(response.body);

    return json['err'] ? null : json;
  }

  Future<Album> fetchAlbumById(int id) async {
    final response = await http.get('$_endPoint/id/$id',
    headers: {
      'X-API-KEY' : key
    }
    );

    final json = jsonDecode(response.body);

    return json['err'] ? null : Album.fromJsonWithSongs(json);
  }
}
