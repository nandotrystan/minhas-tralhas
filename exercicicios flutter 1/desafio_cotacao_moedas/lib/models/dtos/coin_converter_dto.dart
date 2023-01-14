class CoinListDto {
  USDBRL? uSDBRL;
  USDBRL? eURBRL;
  USDBRL? gBPBRL;
  USDBRL? jPYBRL;
  USDBRL? aRSBRL;
  USDBRL? cADBRL;
  USDBRL? bRLUSD;
  USDBRL? eURUSD;
  USDBRL? gBPUSD;
  USDBRL? jPYUSD;
  USDBRL? aRSUSD;
  USDBRL? cADUSD;
  USDBRL? bRLEUR;
  USDBRL? uSDEUR;
  USDBRL? gBPEUR;
  USDBRL? jPYEUR;
  USDBRL? aRSEUR;
  USDBRL? cADEUR;
  USDBRL? bRLGBP;
  USDBRL? eURGBP;
  USDBRL? uSDGBP;

  CoinListDto(
      {this.uSDBRL,
      this.eURBRL,
      this.gBPBRL,
      this.jPYBRL,
      this.aRSBRL,
      this.cADBRL,
      this.bRLUSD,
      this.eURUSD,
      this.gBPUSD,
      this.jPYUSD,
      this.aRSUSD,
      this.cADUSD,
      this.bRLEUR,
      this.uSDEUR,
      this.gBPEUR,
      this.jPYEUR,
      this.aRSEUR,
      this.cADEUR,
      this.bRLGBP,
      this.eURGBP,
      this.uSDGBP});

  CoinListDto.fromJson(Map<String, dynamic> json) {
    uSDBRL =
        json['USDBRL'] != null ?  USDBRL.fromJson(json['USDBRL']) : null;
    eURBRL =
        json['EURBRL'] != null ?  USDBRL.fromJson(json['EURBRL']) : null;
    gBPBRL =
        json['GBPBRL'] != null ?  USDBRL.fromJson(json['GBPBRL']) : null;
    jPYBRL =
        json['JPYBRL'] != null ?  USDBRL.fromJson(json['JPYBRL']) : null;
    aRSBRL =
        json['ARSBRL'] != null ?  USDBRL.fromJson(json['ARSBRL']) : null;
    cADBRL =
        json['CADBRL'] != null ?  USDBRL.fromJson(json['CADBRL']) : null;
    bRLUSD =
        json['BRLUSD'] != null ?  USDBRL.fromJson(json['BRLUSD']) : null;
    eURUSD =
        json['EURUSD'] != null ?  USDBRL.fromJson(json['EURUSD']) : null;
    gBPUSD =
        json['GBPUSD'] != null ?  USDBRL.fromJson(json['GBPUSD']) : null;
    jPYUSD =
        json['JPYUSD'] != null ?  USDBRL.fromJson(json['JPYUSD']) : null;
    aRSUSD =
        json['ARSUSD'] != null ?  USDBRL.fromJson(json['ARSUSD']) : null;
    cADUSD =
        json['CADUSD'] != null ?  USDBRL.fromJson(json['CADUSD']) : null;
    bRLEUR =
        json['BRLEUR'] != null ?  USDBRL.fromJson(json['BRLEUR']) : null;
    uSDEUR =
        json['USDEUR'] != null ?  USDBRL.fromJson(json['USDEUR']) : null;
    gBPEUR =
        json['GBPEUR'] != null ?  USDBRL.fromJson(json['GBPEUR']) : null;
    jPYEUR =
        json['JPYEUR'] != null ?  USDBRL.fromJson(json['JPYEUR']) : null;
    aRSEUR =
        json['ARSEUR'] != null ?  USDBRL.fromJson(json['ARSEUR']) : null;
    cADEUR =
        json['CADEUR'] != null ?  USDBRL.fromJson(json['CADEUR']) : null;
    bRLGBP =
        json['BRLGBP'] != null ?  USDBRL.fromJson(json['BRLGBP']) : null;
    eURGBP =
        json['EURGBP'] != null ?  USDBRL.fromJson(json['EURGBP']) : null;
    uSDGBP =
        json['USDGBP'] != null ?  USDBRL.fromJson(json['USDGBP']) : null;
  }
}

class USDBRL {
  String? code;
  String? codein;
  String? name;
  String? high;
  String? low;
  String? varBid;
  String? pctChange;
  String? bid;
  String? ask;
  String? timestamp;
  String? createDate;

  USDBRL(
      {this.code,
      this.codein,
      this.name,
      this.high,
      this.low,
      this.varBid,
      this.pctChange,
      this.bid,
      this.ask,
      this.timestamp,
      this.createDate});

  USDBRL.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    codein = json['codein'];
    name = json['name'];
    high = json['high'];
    low = json['low'];
    varBid = json['varBid'];
    pctChange = json['pctChange'];
    bid = json['bid'];
    ask = json['ask'];
    timestamp = json['timestamp'];
    createDate = json['create_date'];
  }
}
