class User {
  String? firstName;
  String? lastName;
  String? email;
  String? phone;
  String? address;
  String? city;
  String? province;
  String? postal;

  User({
    this.firstName,
    this.lastName,
    this.address,
    this.city,
    this.email,
    this.phone,
    this.postal,
    this.province,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
        firstName: json['first_name'],
        lastName: json['last_name'],
        email: json['email'],
        phone: json['phone'],
        address: json['address'],
        city: json['city'],
        postal: json['postal'],
        province: json['province'],
      );
}
