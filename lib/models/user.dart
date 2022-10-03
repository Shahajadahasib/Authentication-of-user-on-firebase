// class UserModel {
//   String uid;
//   String email;
//   String username;
//   String password;
//   String repassword;

//   String? image;
//   UserModel({
//     required this.uid,
//     required this.email,
//     required this.username,
//     required this.password,
//     required this.repassword,
//   });
// }

class UserModel {
  final String? uid;
  final String? email;
  final String? lastname;
  final String? username;
  final String? password;
  final String? conpassword;
  String? image;

  UserModel({
    this.uid,
    this.email,
    this.username,
    this.password,
    this.conpassword,
    this.lastname,
  });

  Map<String, Object?> toJson() => {
        'uid': uid,
        'email': email,
        'username': username,
        'lastname': lastname,
      };
  // static fromFireStore(Map<String, dynamic> data) {}
}
