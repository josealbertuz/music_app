import 'dart:async';

import 'package:music_app/src/bloc/main_bloc.dart';
import 'package:music_app/src/bloc/validators.dart';
import 'package:music_app/src/database/app_db.dart';
import 'package:music_app/src/models/user_model.dart';
import 'package:music_app/src/providers/user_provider.dart';
import 'package:rxdart/rxdart.dart';

class LoginBloc with Validators {
  static final LoginBloc _loginBloc = LoginBloc._internal();
  final _emailSubject = BehaviorSubject<String>();
  final _passwordSubject = BehaviorSubject<String>();
  final _userProvider = UserProvider();

  LoginBloc._internal();

  factory LoginBloc() {
    return _loginBloc;
  }

  Function(String) get changeEmail => _emailSubject.sink.add;
  Function(String) get changePassword => _passwordSubject.sink.add;

  Stream<String> get emailStream =>
      _emailSubject.stream.transform(validateEmail);
  Stream<String> get passwordStream =>
      _passwordSubject.stream.transform(validatePassword);

  Stream<bool> get formValidStream => Rx.combineLatest2(
      emailStream, passwordStream, (String a, String b) => true);

  Future<bool> getUser() async {
    String email = _emailSubject.value;
    String password = _passwordSubject.value;

    User user = await _userProvider.read(email, password);

    if (user != null) {
      MainBloc().sinkUser(user);
      await AppDb().addUser(user);
      return true;
    }

    return false;
  }

  void dispose() {
    _emailSubject.close();
    _passwordSubject.close();
  }
}
