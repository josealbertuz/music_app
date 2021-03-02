import 'dart:async';

import 'package:music_app/src/bloc/main_bloc.dart';
import 'package:music_app/src/models/album_model.dart';
import 'package:music_app/src/providers/album_provider.dart';
import 'package:rxdart/rxdart.dart';

class HomeBloc {
  static final HomeBloc _albumBloc = HomeBloc._internal();
  final _albumSubject = BehaviorSubject<List<Album>>();
  final _albumProvider = AlbumProvider(MainBloc().user.apiKey);
  final int perPage = 4;
  List<Album> albums = [];
  int page = 1;
  int nextPage = 0;

  HomeBloc._internal();

  factory HomeBloc() {
    return _albumBloc;
  }

  Stream<List<Album>> get albumStream => _albumSubject.stream;

  Future<void> fetchAlbums() async {
    if (nextPage != 1) {
      final json = await _albumProvider.fetchAlbums(page, perPage);
      nextPage = json['next_page'];
      page++;
      final albums = Album.albumsFromJson(json['albums']);
      this.albums.addAll(albums);
      _albumSubject.add(this.albums);
    }
  }

  void initStream() {
    if (albums.isEmpty) {
      fetchAlbums();
    }else{
      _albumSubject.add(albums);
    }
  }

  void dispose() {
    _albumSubject.close();
  }
}
