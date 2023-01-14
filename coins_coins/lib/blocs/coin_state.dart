import 'package:coins_coins/repositories/coins.dart';
import 'package:coins_coins/repositories/enums/enums_coins.dart';

abstract class CoinState {}

class CoinInitialState extends CoinState {
  final siglasCoin = SiglasCoin.values;
}

class CoinLoadedState extends CoinState {}

class CoinSuccessState extends CoinState {}

class CoinErrorState extends CoinState {}
