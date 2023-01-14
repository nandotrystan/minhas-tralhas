import 'package:exerc_solid/exec2/i_usercase.dart';

class Cep implements IUserCase {
  @override
  String? cep;
  @override
  String? state;
  @override
  String? city;
  @override
  String? neighborhood;
  @override
  String? street;
  @override
  String? service;

  Cep(
      {this.cep,
      this.state,
      this.city,
      this.neighborhood,
      this.street,
      this.service});

  Cep.fromJson(Map<String, dynamic> json) {
    cep = json['cep'];
    state = json['state'];
    city = json['city'];
    neighborhood = json['neighborhood'];
    street = json['street'];
    service = json['service'];
  }
}