abstract class IUserCase {
  String? cep;
  String? state;
  String? city;
  String? neighborhood;
  String? street;
  String? service;

  IUserCase.fromJson(Map<String, dynamic> json);
}
