class Song {
  int id;
  String name;
  String artist;
  String album;
  String cover;
  String file;
  int releaseDate;
  int seconds;

  Song.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        name = json['name'],
        artist = json['artist'],
        album = json['album'],
        cover = json['cover'],
        file = json['file'],
        releaseDate = json['release_date'],
        seconds = json['seconds'];

  Song.placeholder() {
    name = '';
    artist = '';
    cover = 'assets/placeholder-music.png';
  }

  static List<Song> songsFromJson(List<dynamic> songs) =>
      songs.map((e) => Song.fromJson(e)).toList();
}
