class UserModel {
  int id;
  String name;
  String email;
  int phone;

  UserModel(this.id, this.name, this.email, this.phone);
  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        json["id"],
        json["name"],
        json["email"],
        json["phone"],
      );

  Map<String, dynamic> toJson() =>
      {"id": id, "name": name, "email": email, "phone": phone};
}
