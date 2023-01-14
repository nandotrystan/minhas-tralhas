import 'funcionarios.dart';

class Gerente extends Funcionario {
  Gerente(int matricula, 
  String firstName, 
  String lastName, 
  double salario, 
  int horasTrabalho
  ) : super(matricula, firstName, lastName, salario, horasTrabalho);



  
@override
  double calcularSalario() {
    double salario = super.calcularSalario();
    return salario + salario * 0.35;
  }
}
