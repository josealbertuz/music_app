import 'package:music_app/src/models/song_model.dart';

class Album {
  int id;
  String name;
  String artist;
  String cover;
  int release;
  int seconds;
  List<Song> songs;

  Album({this.id, this.name, this.artist, this.cover, this.release, this.seconds, this.songs});

  Album.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        name = json['name'],
        artist = json['artist'],
        cover = json['cover'],
        release = json['release_date'];

  Album.fromJsonWithSongs(Map<String, dynamic> json) 
  : id = json['id'],
        name = json['album'],
        artist = json['artist'],
        cover = json['cover'],
        release = json['release_date'],
        seconds = json['seconds'],
        songs = Song.songsFromJson(json['songs']);
  


  static List<Album> albumsFromJson(List<dynamic> albums) =>
      albums.map((e) => Album.fromJson(e)).toList();

}
