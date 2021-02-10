class User {
  String name;
  String email;
  String contact;
  String password;
  String address;
  String type;
  String id;

  User(
      {this.name,
      this.email,
      this.password,
      this.contact,
      this.address,
      this.type,
      this.id});

  User.fromJson(Map<String, dynamic> json)
      : this(
            name: json['name'],
            email: json['email'],
            password: json['password'],
            contact: json['contact'],
            address: json['address'],
            type: json['type'],
            id: json['id'].toString());

  Map<String, dynamic> toJson() => {
        'name': name,
        'email': email,
        'password': password,
        'contact': contact,
        'address': address,
        'type': type,
        'id': id
      };
}
