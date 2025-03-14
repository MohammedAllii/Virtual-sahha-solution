class User {
  String? id;
  String? name;
  String? last_name;
  String? email;
  String? password;
  String? phone;
  String? role;
  String? status;
  String? image;
  String? qrcode;

  User({  this.id, this.name,  this.last_name,  this.email,   this.password,  this.phone, this.role, this.status, this.image,this.qrcode});

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'].toString(),
      name: json['name'],
      last_name: json['last_name'],
      email: json['email'],
      password: json['password'],
      phone: json['phone'],
      role: json['role'],
      status: json['status'],
      image: json['image'],
      qrcode: json['qrcode'],
    );
  }

  Map<String, dynamic> toJson() => {
    'id': id,
    'name': name,
    'last_name': last_name,
    'email': email,
    'password': password,
    'phone': phone,
    'role': role,
    'status': status,
    'image': image,
    'qrcode': qrcode,
  };
  
}