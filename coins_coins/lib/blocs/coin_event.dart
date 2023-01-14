import 'package:coins_coins/repositories/coins.dart';

abstract class CoinEvent {}

class LoadedCoinEvent extends CoinEvent {}

class AddCoinEvent extends CoinEvent {
  Coin coin;
  AddCoinEvent({required this.coin});
}
class RemoveCoinEvent extends CoinEvent {
  Coin coin;
  RemoveCoinEvent({required this.coin});
}
