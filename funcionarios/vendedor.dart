import 'funcionarios.dart';

class Vendedor extends Funcionario {
  Vendedor(int matricula, String firstName, String lastName, double salario,
      int horasTrabalho)
      : super(matricula, firstName, lastName, salario, horasTrabalho);

  @override
  double calcularSalario() {
    double salario = super.calcularSalario();
    return salario + salario / 0.2;
  }
}
