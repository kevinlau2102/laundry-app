class User {
  String? name;
  String? email;
  String? phone;
  String? address;
  String? city;
  String? province;
  String? postal;

  User({
    this.name,
    this.address,
    this.city,
    this.email,
    this.phone,
    this.postal,
    this.province,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
        name: json['name'],
        email: json['email'],
        phone: json['phone'],
        address: json['address'],
        city: json['city'],
        postal: json['postal'],
        province: json['province'],
      );
}
