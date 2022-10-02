import 'dart:developer';

import 'package:authfor/services/auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Register extends StatefulWidget {
  const Register({
    super.key,
  });

  @override
  State<Register> createState() => _MyHomePageState();
}

final passwordEditingController = new TextEditingController();
final emailEditingController = new TextEditingController();

class _MyHomePageState extends State<Register> {
  @override
  Widget build(BuildContext context) {
    final authService = Provider.of<AuthService>(context);
    return Scaffold(
      body: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
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
              hintText: "Name",
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
          ElevatedButton(
              onPressed: () async {
                // Navigator.pushNamed(context, "/register");
                await authService.createUserWithEmailAndPassword(
                  emailEditingController.text,
                  passwordEditingController.text,
                );
                Navigator.pop(context);
                log(passwordEditingController.text);
                log(emailEditingController.text);
              },
              child: Text("register"))
        ]),
      ),
    );
  }
}
