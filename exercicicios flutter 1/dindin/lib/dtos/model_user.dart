class User {
  final String email;
  final String name;
  final int ballance;

  User({required this.email, required this.name, required this.ballance});

  factory User.fromJson(Map json) {
    final ballance = json['data']['bill']['ballance'];
    final user = json['data']['user'];
    return User(
      email: user['email'] ?? '',
      name: user['name'] ?? '',
      ballance: ballance,
    );
  }
}
