import 'dart:developer';

import 'package:authfor/models/user.dart';
import 'package:authfor/providers/user_provider.dart';
import 'package:authfor/services/auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

class MyHomePage extends StatefulWidget {
  final String email;
  final String uid;

  const MyHomePage({
    super.key,
    required this.email,
    required this.uid,
  });

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

final usernameController = TextEditingController();

@override
class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    final authService = Provider.of<AuthService>(context);
    final CurrentService = Provider.of<AuthService>(context).uid;

    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Column(
              children: [
                TextButton(
                  onPressed: () {
                    // authService.SignOut();
                  },
                  child: Text(widget.email.toString()),
                ),
                TextButton(
                  onPressed: () {
                    // authService.SignOut();
                  },
                  child: Text(widget.uid.toString()),
                ),
                TextButton(
                  style: ButtonStyle(),
                  onPressed: () {
                    authService.SignOut();
                  },
                  child: Text("Log Out"),
                ),
                TextFormField(
                  controller: usernameController,
                  onSaved: (value) {
                    usernameController.text = value!;
                  },
                  textInputAction: TextInputAction.done,
                ),
                ElevatedButton(
                  onPressed: () async {
                    // Navigator.pushNamed(context, "/register");
                    await authService.crateValue(usernameController.text,
                        authService.uid.toString(), widget.email.toString());

                    // log(passwordEditingController.text);
                    // log(emailEditingController.text);
                  },
                  child: Text("register"),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
