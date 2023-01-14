class CoinDto {
  USDBRL? uSDBRL;

  CoinDto({this.uSDBRL});

  CoinDto.fromJson(Map<String, dynamic> json) {
    uSDBRL =
        json['USDBRL'] != null ?  USDBRL.fromJson(json['USDBRL']) : null;
  }
}

class USDBRL {
  String? code;
  String? codein;
  String? bid;

  USDBRL({this.code, this.codein, this.bid});

  USDBRL.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    codein = json['codein'];
    bid = json['bid'];
  }
}