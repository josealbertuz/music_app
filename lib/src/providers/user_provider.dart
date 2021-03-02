import 'dart:convert';

import 'package:music_app/src/models/user_model.dart';
import 'package:http/http.dart' as http;

class UserProvider {
  final _endPoint = 'https://my-api-music-app.herokuapp.com/index.php/user';

  Future<bool> insert(User user) async {
    final response =
        await http.put('$_endPoint/create', body: user.toJsonInsert());

    return jsonDecode(response.body)['err'];
  }

  Future<User> read(String email, String password) async {
    final response = await http
        .post('$_endPoint/read', body: {"email": email, "password": password});

    final json = jsonDecode(response.body);

    return json['err']
        ? null
        : User.fromJson(jsonDecode(response.body)['user']);
  }

  Future<bool> update(User user) async {
    final response = await http.post('$_endPoint/update',
        body: user.toJsonUpdate(), headers: {'X-API-KEY': user.apiKey});

    final json = jsonDecode(response.body);

    return json['err'];
  }

  Future<bool> delete(User user) async {
    final response = await http.get('$_endPoint/delete/${user.id}',
        headers: {'X-API-KEY': user.apiKey});

    return jsonDecode(response.body)['err'];
  }
}
