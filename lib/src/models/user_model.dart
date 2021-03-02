import 'package:hive/hive.dart';

part 'user_model.g.dart';

@HiveType(typeId: 0)
class User {
  @HiveField(0)
  int id;
  @HiveField(1)
  String email;
  @HiveField(2)
  String username;
  @HiveField(3)
  String password;
  @HiveField(4)
  String description;
  @HiveField(5)
  String apiKey;

  User.signUp(this.email, this.username, this.password);

  User(
      {this.id,
      this.email,
      this.username,
      this.password,
      this.description,
      this.apiKey});

  User.clone(User user)
      : this(
            id: user.id,
            email: user.email,
            password: user.password,
            description: user.description,
            apiKey: user.apiKey);

  User.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        email = json['email'],
        username = json['username'],
        password = json['password'],
        description = json['description'],
        apiKey = json['api_key'];

  Map<String, dynamic> toJsonUpdate() {
    return {
      "id": id.toString(),
      "email": email,
      "username": username,
      "password": password,
      "description": description,
    };
  }

  Map<String, dynamic> toJsonInsert() {
    return {
      "email": email,
      "username": username,
      "password": password,
    };
  }
}
