import 'dart:developer';

import 'package:authfor/models/user.dart';
import 'package:authfor/providers/user_provider.dart';
import 'package:authfor/services/auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MyHomePage extends StatefulWidget {
  final String uid;

  const MyHomePage({
    super.key,
    required this.uid,
  });

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

@override
class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    final authService = Provider.of<AuthService>(context);

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
                  child: Text(widget.uid.toString()),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
