/// Model untuk data User dari endpoint `/users`
class User {
  final int id;
  final String username;

  User({
    required this.id,
    required this.username,
  });

  /// Parsing dari JSON ke objek User
  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      username: json['username'],
    );
  }
}