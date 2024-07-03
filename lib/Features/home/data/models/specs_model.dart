class Specs {
  final int id;
  final String name;
  final String tel;
  final int rate;
  final String mail;
  final String address;
  final String title;

  Specs({
    required this.id,
    required this.name,
    required this.tel,
    required this.rate,
    required this.mail,
    required this.address,
    required this.title,
  });

  factory Specs.fromJson(Map<String, dynamic> json) {
    return Specs(
      id: json['id'],
      name: json['name'],
      tel: json['tel'],
      rate: json['rate'] is double ? (json['rate'] as double).toInt() : json['rate'],
      mail: json['mail'],
      address: json['address'],
      title: json['title'],
    );
  }
}