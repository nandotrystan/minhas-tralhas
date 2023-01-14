import 'caixa.dart';
import 'funcionarios.dart';
import 'vendedor.dart';
import 'gerente.dart';

void main() {
  Caixa caixa = Caixa(1579, 'Ana', 'Oliveira', 1212, 230);
  Vendedor vendedor = Vendedor(1601, 'João', 'Silva', 1212, 230);
  Gerente gerente = Gerente(1579, 'Maria', 'Souza', 1212, 230);

  print('Matrícula: ${caixa.matricula}');
  print('Nome: ${caixa.firstName} ${caixa.lastName}');
  print('Horas trabalhadas no mês: ${caixa.horasTrabalho}');
  print('Salário: ${caixa.calcularSalario().toStringAsFixed(2)}\n');

  print('Matrícula: ${vendedor.matricula}');
  print('Nome: ${vendedor.firstName} ${vendedor.lastName}');
  print('Horas trabalhadas no mês: ${vendedor.horasTrabalho}');
  print('Salário: ${vendedor.calcularSalario().toStringAsFixed(2)}\n');

  print('Matrícula: ${gerente.matricula}');
  print('Nome: ${gerente.firstName} ${gerente.lastName}');
  print('Horas trabalhadas no mês: ${gerente.horasTrabalho}');
  print('Salário: ${gerente.calcularSalario().toStringAsFixed(2)}');

}