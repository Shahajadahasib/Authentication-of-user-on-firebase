import 'dart:developer';

import 'package:authfor/screen/login/register.dart';
import 'package:authfor/services/auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SignIn extends StatefulWidget {
  const SignIn({
    super.key,
  });

  @override
  State<SignIn> createState() => _MyHomePageState();
}

final passwordEditingController = new TextEditingController();
final emailEditingController = new TextEditingController();

class _MyHomePageState extends State<SignIn> {
  @override
  Widget build(BuildContext context) {
    final authService = Provider.of<AuthService>(context);

    return Scaffold(
      body: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          TextFormField(
            autofocus: false,
            controller: emailEditingController,
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
              emailEditingController.text = value!;
            },
            textInputAction: TextInputAction.next,
            decoration: InputDecoration(
              prefixIcon: const Icon(Icons.account_circle),
              contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
              hintText: "Name",
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
          TextFormField(
            autofocus: false,
            controller: passwordEditingController,
            keyboardType: TextInputType.name,
            validator: (value) {
              RegExp regex = new RegExp(r'^.{3,}$');
              if (value!.isEmpty) {
                return ("First Name cannot be Empty");
              }
              if (!regex.hasMatch(value)) {
                return ("Enter Valid name(Min. 3 Character)");
              }
              return null;
            },
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
          ElevatedButton(
              onPressed: () {
                // Navigator.pushNamed(context, "/register");
                authService.signInWithEmailAndPassword(
                    emailEditingController.text,
                    passwordEditingController.text);
                // log(passwordEditingController.text);
                // log(emailEditingController.text);
              },
              child: Text("Login")),
          ElevatedButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const Register()));
              },
              child: Text("register"))
        ]),
      ),
    );
  }
}
