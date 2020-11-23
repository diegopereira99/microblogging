class UserModel {
  int id;
  String name;
  String email;

  UserModel({this.id, this.name, this.email});

  UserModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['email'] = this.email;
    return data;
  }

  copyWith ({id, name, email}) {
    this.id = id ?? this.id;
    this.name = name ?? this.name;
    this.email = email ?? this.email;
  }
}
