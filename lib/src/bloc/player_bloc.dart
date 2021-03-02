import 'package:music_app/src/models/song_model.dart';
import 'package:rxdart/rxdart.dart';

class PlayerBloc {
  static final PlayerBloc _playerBloc = PlayerBloc._internal();
  final BehaviorSubject<Song> _songSubject = BehaviorSubject<Song>();

  Function(Song) get addSong => _songSubject.sink.add;
  Stream<Song> get songStream => _songSubject.stream;

  PlayerBloc._internal();

  factory PlayerBloc() {
    return _playerBloc;
  }

  void dispose() {
    _songSubject.close();
  }
}
