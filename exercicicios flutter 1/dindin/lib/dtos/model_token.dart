class Token {
  String? token;

  Token({this.token});

  factory Token.fromJson(Map json) {
    return Token(token: 'token');
  }
}
