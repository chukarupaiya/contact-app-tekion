class user {
  String name;
  String email;
  int id;
  String address;
  String phone;
  String website;
  String company;

  user(
      {required this.id,
      required this.name,
      required this.email,
      required this.address,
      required this.phone,
      required this.website,
      required this.company});

  factory user.fromJson(Map<String, dynamic> json) {
    return user(
      id: json['id'],
      name: json['name'],
      email: json['email'],
      address: json['address']['street'] +
          " " +
          json['address']['suite'] +
          " " +
          json['address']['city'] +
          " " +
          json['address']['zipcode'],
      phone: json['phone'],
      website: json['website'],
      company: json['company']['name'],
    );
  }
}
