class User {
  final String uid;
  final String email;
  final String name;

  User({
    required this.uid,
    required this.email,
    required this.name,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      email: json['email'],
      uid: json['uid'],
      name: json['name']
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "email": email,
      "uid": uid,
      "name": name,
    };
  }
}
