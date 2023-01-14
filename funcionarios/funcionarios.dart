
abstract class Funcionario {
int matricula;
String firstName;
String lastName;
double salario;
int horasTrabalho;

Funcionario(this.matricula, this.firstName, this.lastName, this.salario, this.horasTrabalho);

double calcularSalario() {
if (this.horasTrabalho > 220) {

int numHorasExtras = this.horasTrabalho - 220;
double valorHora = this.salario / 220;
double valorHoraExtra = valorHora * 0.5 + valorHora;
double totalHorasExtras = valorHoraExtra * numHorasExtras;

return this.salario + totalHorasExtras;
}
return this.salario;
}
}