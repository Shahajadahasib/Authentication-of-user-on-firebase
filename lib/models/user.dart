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
  final String? username;
  final String? password;
  final String? repassword;

  String? image;
  UserModel({
    this.uid,
    this.email,
    this.username,
    this.password,
    this.repassword,
  });

  static fromFireStore(Map<String, dynamic> data) {}
}
