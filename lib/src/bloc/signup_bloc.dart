import 'package:music_app/src/bloc/validators.dart';
import 'package:music_app/src/models/user_model.dart';
import 'package:music_app/src/providers/user_provider.dart';
import 'package:rxdart/rxdart.dart';

class SignupBloc with Validators {
  static final SignupBloc _signupBloc = SignupBloc._internal();
  final _emailSubject = BehaviorSubject<String>();
  final _passwordSubject = BehaviorSubject<String>();
  final _repeatedPasswordSubject = BehaviorSubject<String>();
  final _usernameSubject = BehaviorSubject<String>();
  final _userProvider = UserProvider();

  SignupBloc._internal();

  factory SignupBloc() {
    return _signupBloc;
  }

  Function(String) get changeEmail => _emailSubject.sink.add;
  Function(String) get changePassword => _passwordSubject.sink.add;
  void changeRepeatedPassword(String repeatedPassword) {
    if (_passwordSubject.value == repeatedPassword) {
      _repeatedPasswordSubject.add(repeatedPassword);
    } else {
      _repeatedPasswordSubject.addError('La contraseñas no coinciden');
    }
  }

  Function(String) get changeUsername => _usernameSubject.sink.add;

  Stream<String> get emailStream =>
      _emailSubject.stream.transform(validateEmail);
  Stream<String> get passwordStream =>
      _passwordSubject.stream.transform(validatePassword);

  Stream<String> get usernameStream =>
      _usernameSubject.transform(validateUsername);

  Stream<String> get repeatedPasswordStream => _repeatedPasswordSubject.stream;

  Stream<bool> get formValidation => Rx.combineLatest4(
      emailStream,
      passwordStream,
      usernameStream,
      repeatedPasswordStream,
      (a, b, c, d) => true);

  Future<bool> insertUser() async {
    String email = _emailSubject.value;
    String password = _passwordSubject.value;
    String username = _usernameSubject.value;

    return await _userProvider.insert(User.signUp(email, username, password));
  }

  void dispose() {
    _emailSubject.close();
    _passwordSubject.close();
    _repeatedPasswordSubject.close();
    _usernameSubject.close();
  }
}
