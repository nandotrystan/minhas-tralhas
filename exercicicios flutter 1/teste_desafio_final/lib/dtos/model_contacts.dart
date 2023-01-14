class ModelContacts {
  final String email;
  final String phone;
  final String mobilePhone;

  ModelContacts(
      {required this.email, required this.phone, required this.mobilePhone});
  
  factory ModelContacts.fromJson(Map json) {
    return ModelContacts(
        email: json['email'] ?? '',
        phone: json['phone'] ?? '',
        mobilePhone: json['mobilePhone']
        );
  } 
}
