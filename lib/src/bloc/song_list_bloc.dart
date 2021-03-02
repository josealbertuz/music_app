import 'package:music_app/src/bloc/main_bloc.dart';
import 'package:music_app/src/models/album_model.dart';
import 'package:music_app/src/providers/album_provider.dart';
import 'package:rxdart/rxdart.dart';

class SongListBloc {
  static final SongListBloc _songListBloc = SongListBloc._internal();
  final BehaviorSubject<Album> _albumSubject = BehaviorSubject<Album>();
  final AlbumProvider _albumProvider = AlbumProvider(MainBloc().user.apiKey);
  int albumId = 0;

  SongListBloc._internal();

  factory SongListBloc() {
    return _songListBloc;
  }

  Stream<Album> get albumStream => _albumSubject.stream;

  void fetchAlbumById(int albumId) async {
    if (albumId != this.albumId) {
      _albumSubject.add(null);
      final album = await _albumProvider.fetchAlbumById(albumId);
      this.albumId = albumId;
      _albumSubject.add(album);
    }
  }

  void dispose() {
    _albumSubject.close();
  }
}
