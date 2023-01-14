class User {
  int id;
  final String fullName;
  final String rg;
  final String cpf;
  final String profilePictureUrl;
  final String birthDate;
  final String createdAt;
  final String cep;
  final String street;
  int number;
  final String complement;
  final String district;
  final String state;
  final String email;
  final String phone;
  final String mobilePhone;

  User( 
      {
      required this.id,
      required this.fullName,
      required this.rg,
      required this.cpf,
      required this.profilePictureUrl,
      required this.birthDate,
      required this.createdAt,
      required this.cep,
      required this.street,
      required this.number,
      required this.complement,
      required this.district,
      required this.state,
      required this.email, 
      required this.phone, 
      required this.mobilePhone, 
      });

  factory User.fromJson(Map json) {
    return User(
        id: json['id'] ?? '',
        fullName: json['fullName'] ?? '',
        rg: json['rg'] ?? '',
        cpf: json['cpf'] ?? '',
        profilePictureUrl: json['profilePictureUrl'] ?? '',
        birthDate: json['birthDate'] ?? '',
        createdAt: json['createdAt'] ?? '',
        cep: json['address']['cep'] ?? '',
        street: json['address']['street'] ?? '',
        number: json['address']['number'] ?? '',
        complement: json['address']['complement'] ?? '',
        district: json['address']['district'] ?? '',
        state: json['address']['state'] ?? '', 
        email: json['contacts']['email'] ?? '', 
        phone: json['contacts']['phone'] ?? '',
        mobilePhone: json['contacts']['phone'] ?? '', 
        );
  }
}
