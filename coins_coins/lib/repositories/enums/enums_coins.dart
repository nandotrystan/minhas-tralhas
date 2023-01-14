import 'package:coins_coins/resources/strings.dart';

enum CoinStatus {
  initial,
  loaded,
  success,
  failure,
}

enum SiglasCoin {
  bRL,
  uSD,
  eUR,
  gBP,
}

class UseEnum {
  static String myCoins(SiglasCoin siglaCoin) {
    switch (siglaCoin) {
      case SiglasCoin.bRL:
        return Strings.real;
      case SiglasCoin.uSD:
        return Strings.dolarUS;
      case SiglasCoin.eUR:
        return Strings.euro;
      case SiglasCoin.gBP:
        return Strings.libra;
    }
  }
}
