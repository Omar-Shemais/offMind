// lib/doctor_model.dart
class Doctor {
  final int id;
  final String name;
  final int tel;
  final int rate;
  final String mail;
  final String address;

  Doctor({
    required this.id,
    required this.name,
    required this.tel,
    required this.rate,
    required this.mail,
    required this.address,

  });

  factory Doctor.fromJson(Map<String, dynamic> json) {
    return Doctor(
      id: json['id'],
      name: json['name'],
      tel: json['tel'],
      rate: json['rate'],
      mail: json['mail'],
      address: json['address'],

    );
  }
}