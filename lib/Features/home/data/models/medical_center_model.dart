class MedicalCenter {
  final int id;
  final String name;
  final String tel;
  final int rate;
  final String mail;
  final String address;

  MedicalCenter({
    required this.id,
    required this.name,
    required this.tel,
    required this.rate,
    required this.mail,
    required this.address,
  });

  factory MedicalCenter.fromJson(Map<String, dynamic> json) {
    return MedicalCenter(
      id: json['id'],
      name: json['name'],
      tel: json['tel'],
      rate: json['rate'],
      mail: json['mail'],
      address: json['address'],
    );
  }
}