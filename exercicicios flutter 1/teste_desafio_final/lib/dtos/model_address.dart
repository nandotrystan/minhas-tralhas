class ModelAdress {
  final String cep;
  final String street;
  final String number;
  final String complement;
  final String district;
  final String city;
  final String state;

  ModelAdress(
      {required this.cep,
      required this.street,
      required this.number,
      required this.complement,
      required this.district,
      required this.city,
      required this.state});

 factory ModelAdress.fromJson(Map json) {
    return ModelAdress(
        cep: json['cep'] ?? '',
        street: json['street'] ?? '',
        number: json['number'] ?? '',
        complement: json['complement'] ?? '',
        district: json['district'] ?? '',
        city: json['city'],
        state: json['state'] ?? '', 
        
        );
  } 
}
