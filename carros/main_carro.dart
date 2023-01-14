import 'carro.dart';
void main() {
  final carro1 = Car(
      montadora: 'Fiat',
      modelo: 'Palio',
      cor: 'branca',
      motor: 1.0,
      combustivel: 'flex');
  print('Montadora: ${carro1.montadora}');
  print('Modelo: ${carro1.modelo}');
  print('Cor: ${carro1.cor}');
  print('Motor: ${carro1.motor}');
  print('Combustível: ${carro1.combustivel}\n');

  final carro2 = Car(
      montadora: 'Honda',
      modelo: 'Civic',
      cor: 'Cinza',
      motor: 1.8,
      combustivel: 'gasolina');
  print('Montadora: ${carro2.montadora}');
  print('Modelo: ${carro2.modelo}');
  print('Cor: ${carro2.cor}');
  print('Motor: ${carro2.motor}');
  print('Combustível: ${carro2.combustivel}\n');

  final carro3 = Car(
      montadora: 'Hyundai',
      modelo: 'Tucson',
      cor: 'preta',
      motor: 2.4,
      combustivel: 'gasolina');
  print('Montadora: ${carro3.montadora}');
  print('Modelo: ${carro3.modelo}');
  print('Cor: ${carro3.cor}');
  print('Motor: ${carro3.motor}');
  print('Combustível: ${carro3.combustivel}');

  
  

  
  
}