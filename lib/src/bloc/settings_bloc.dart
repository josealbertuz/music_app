import 'package:music_app/src/bloc/main_bloc.dart';
import 'package:music_app/src/database/app_db.dart';
import 'package:music_app/src/providers/user_provider.dart';

class SettingsBloc {
  static final SettingsBloc _settingsBloc = SettingsBloc._internal();
  final UserProvider _userProvider = UserProvider();
  final MainBloc _mainBloc = MainBloc();
  final AppDb _appDb = AppDb();

  SettingsBloc._internal();

  factory SettingsBloc() {
    return _settingsBloc;
  }

  Future<void> closeSession() async {
    await _appDb.deleteUser();
    await _appDb.deleteCurrentScreen();

    _mainBloc.sinkUser(null);
  }

  Future<bool> deleteUser() async {
    bool failure = await _userProvider.delete(_mainBloc.user);

    if (failure) {
      return false;
    } else {
      await _appDb.deleteUser();
      await _appDb.deleteCurrentScreen();
      _mainBloc.sinkUser(null);
      return true;
    }
  }
}
