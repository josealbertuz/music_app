import 'package:music_app/src/bloc/main_bloc.dart';
import 'package:music_app/src/bloc/validators.dart';
import 'package:music_app/src/database/app_db.dart';
import 'package:music_app/src/models/user_model.dart';
import 'package:music_app/src/providers/user_provider.dart';
import 'package:rxdart/rxdart.dart';

class UpdateProfileBloc with Validators {
  static final UpdateProfileBloc _updateProfileBloc =
      UpdateProfileBloc._internal();
  final UserProvider _userProvider = UserProvider();
  BehaviorSubject<String> _usernameSubject = BehaviorSubject<String>();
  BehaviorSubject<String> _passwordSubject = BehaviorSubject<String>();
  BehaviorSubject<String> _descriptionSubject = BehaviorSubject<String>();

  UpdateProfileBloc._internal();

  factory UpdateProfileBloc() {
    return _updateProfileBloc;
  }

  Function(String) get changeUsername => _usernameSubject.add;
  Stream<String> get usernameStream =>
      _usernameSubject.stream.transform(validateUsername);

  Function(String) get changePassword => _passwordSubject.add;
  Stream<String> get passwordStream =>
      _passwordSubject.stream.transform(validatePassword);

  Function(String) get changeDescription => _descriptionSubject.add;

  Stream<bool> get validateForm => Rx.combineLatest2(
      usernameStream, passwordStream, (username, password) => true);

  Future<bool> updateUser() async {
    String username = _usernameSubject.value;
    String password = _passwordSubject.value;
    String description = _descriptionSubject.value;

    User user = User.clone(MainBloc().user);

    user
      ..username = username
      ..password = password
      ..description = description;

    return _userProvider.update(user).then((failure) async {
      if (failure) {
        return false;
      } else {
        await AppDb().addUser(user);
        MainBloc().sinkUser(user);
        return true;
      }
    });
  }

  void dispose() {
    _usernameSubject.close();
    _passwordSubject.close();
    _descriptionSubject.close();
  }
}
