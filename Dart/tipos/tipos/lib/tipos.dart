void main(List<String> args) {
  //* definição com var
  var x = 1;
  var y = 4.34245;
  var z = 'palavra';

  //* definição com tipo
  int x1 = 2;
  double y1 = 2.34;
  String z1 = 'qualquer';

  //? mudança de tipo e diferença(flutter)
  double x2 = 2.5;

  //! dynamic
  dynamic danger = 2;
  print(danger);
  
  //* final X const
  final num = 1;
  const num2 = 2;
  
  //? tipos na imutabilidade
  final String word = 'fixa';
  const word2 = 'fixa2';

  //* diferença
  final now = DateTime.now();
  print(now);
}
