import 'package:music_app/src/database/app_db.dart';
import 'package:music_app/src/models/user_model.dart';
import 'package:rxdart/rxdart.dart';

class MainBloc {
  static final MainBloc _mainBloc = MainBloc._internal();
  BehaviorSubject<int> _indexSubject = BehaviorSubject<int>.seeded(0);
  BehaviorSubject<User> _userSubject = BehaviorSubject<User>();


  Stream<int> get getIndexScreen => _indexSubject.stream;

  Function(User) get sinkUser => _userSubject.add;
  Stream<User> get userStream => _userSubject.stream;
  User get user => _userSubject.value;

  MainBloc._internal();

  factory MainBloc() {
    return _mainBloc;
  }

  void changeScreen(int screen) async {
    await AppDb().addCurrentScreen(screen);
    _indexSubject.add(screen);
  }

  void dispose() {
    _userSubject.close();
    _indexSubject.close();
  }
}
