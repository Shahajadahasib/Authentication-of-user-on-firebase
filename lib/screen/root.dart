// import 'package:authfor/models/user.dart';
// import 'package:authfor/screen/home/home.dart';
// import 'package:authfor/screen/login/login.dart';
// import 'package:flutter/material.dart';

// class MyWidget extends StatelessWidget {
//   const MyWidget({super.key});

//   @override
//   Widget build(BuildContext context) {
//     UserModel _user;
//     return (_user != null) ?  MyHomePage() : const SignIn();
//   }
// }

import 'dart:developer';

import 'package:authfor/models/user.dart';
import 'package:authfor/screen/home/home.dart';
import 'package:authfor/screen/login/login.dart';
import 'package:authfor/services/auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Wrapper extends StatelessWidget {
  const Wrapper({super.key});

  @override
  Widget build(BuildContext context) {
    final authService = Provider.of<AuthService>(context);

    return StreamBuilder<UserModel?>(
      stream: authService.user,
      builder: (_, AsyncSnapshot<UserModel?> snapshot) {
        if (snapshot.connectionState == ConnectionState.active) {
          final UserModel? user = snapshot.data;
          // log(user!.uid.toString());
          return user == null
              ? SignIn()
              : MyHomePage(
                  email: user.email.toString(),
                  uid: user.uid.toString(),
                );
        } else {
          return const Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
        }
      },
    );
  }
}
