import 'dart:developer';

import 'package:authfor/screen/root.dart';
import 'package:authfor/services/auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Register extends StatefulWidget {
  const Register({
    super.key,
  });

  @override
  State<Register> createState() => _MyHomePageState();
}

final emailEditingController = TextEditingController();
final usernameEditingController = TextEditingController();

final passwordEditingController = TextEditingController();
final repasswordEditingController = new TextEditingController();

class _MyHomePageState extends State<Register> {
  @override
  Widget build(BuildContext context) {
    final authService = Provider.of<AuthService>(context);
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextFormField(
              autofocus: false,
              controller: usernameEditingController,
              keyboardType: TextInputType.emailAddress,
              // validator: (value) {
              //   RegExp regex = new RegExp(r'^.{3,}$');
              //   if (value!.isEmpty) {
              //     return ("First Name cannot be Empty");
              //   }
              //   if (!regex.hasMatch(value)) {
              //     return ("Enter Valid name(Min. 3 Character)");
              //   }
              //   return null;
              // },
              onSaved: (value) {
                emailEditingController.text = value!;
              },
              textInputAction: TextInputAction.next,
              decoration: InputDecoration(
                prefixIcon: const Icon(Icons.account_circle),
                contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
                hintText: "Username",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            TextFormField(
              autofocus: false,
              controller: emailEditingController,
              keyboardType: TextInputType.emailAddress,
              // validator: (value) {
              //   RegExp regex = new RegExp(r'^.{3,}$');
              //   if (value!.isEmpty) {
              //     return ("First Name cannot be Empty");
              //   }
              //   if (!regex.hasMatch(value)) {
              //     return ("Enter Valid name(Min. 3 Character)");
              //   }
              //   return null;
              // },
              onSaved: (value) {
                emailEditingController.text = value!;
              },
              textInputAction: TextInputAction.next,
              decoration: InputDecoration(
                prefixIcon: const Icon(Icons.account_circle),
                contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
                hintText: "Email",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            TextFormField(
              autofocus: false,
              controller: passwordEditingController,
              keyboardType: TextInputType.name,
              // validator: (value) {
              //   RegExp regex = new RegExp(r'^.{3,}$');
              //   if (value!.isEmpty) {
              //     return ("First Name cannot be Empty");
              //   }
              //   if (!regex.hasMatch(value)) {
              //     return ("Enter Valid name(Min. 3 Character)");
              //   }
              //   return null;
              // },
              onSaved: (value) {
                passwordEditingController.text = value!;
              },
              textInputAction: TextInputAction.next,
              decoration: InputDecoration(
                prefixIcon: const Icon(Icons.account_circle),
                contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
                hintText: "password",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            TextFormField(
              autofocus: false,
              controller: repasswordEditingController,
              obscureText: true,
              validator: (value) {
                if (repasswordEditingController.text !=
                    passwordEditingController.text) {
                  return "Password don't match";
                }
                return null;
              },
              onSaved: (value) {
                repasswordEditingController.text = value!;
              },
              textInputAction: TextInputAction.done,
              decoration: InputDecoration(
                prefixIcon: const Icon(Icons.vpn_key),
                contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
                hintText: "Confirm Password",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () async {
                // Navigator.pushNamed(context, "/register");
                authService
                    .createUserWithEmailAndPassword(
                      emailEditingController.text,
                      passwordEditingController.text,
                    )
                    .then(
                      (value) => {
                        FirebaseFirestore.instance
                            .collection("Users")
                            .doc(value!.uid)
                            .set({
                          "Email": value.email.toString(),
                        })
                      },
                    );
                Navigator.pop(
                  context,
                );
                // log(passwordEditingController.text);
                // log(emailEditingController.text);
              },
              child: Text("register"),
            ),
          ],
        ),
      ),
    );
  }
}
