import 'dart:io';
import 'package:hive/hive.dart';
import 'package:music_app/src/models/user_model.dart';
import 'package:path_provider/path_provider.dart' as pathProvider;

class AppDb {
  static final AppDb _appDb = AppDb._internal();
  Box box;

  AppDb._internal();

  factory AppDb() {
    return _appDb;
  }

  Future<void> initHive() async {
    Directory directory = await pathProvider.getApplicationDocumentsDirectory();
    Hive.init(directory.path);
    Hive.registerAdapter(UserAdapter());
    box = await Hive.openBox('appdb');
  }

  Future<void> addUser(User user) async {
    await box.put('user', user);
  }

  Future<User> readUser() async {
    return await box.get('user') ?? null;
  }

  Future<void> deleteUser() async {
    await box.delete('user');
  }

  Future<void> addCurrentScreen(int screen) async {
    await box.put('screen', screen);
  }

  Future<int> readCurrentScreen() async {
    return await box.get('screen') ?? 0;
  }

  Future<void> deleteCurrentScreen() async {
    await box.delete('screen');
  }

  Future<void> addTheme(bool theme) async {
    await box.put('theme', theme);
  }

  Future<bool> readTheme() async {
    return await box.get('theme');
  }

  Future<void> deleteTheme() async {
    await box.delete('theme');
  }

  void closeBox() {
    box.close();
  }
}
