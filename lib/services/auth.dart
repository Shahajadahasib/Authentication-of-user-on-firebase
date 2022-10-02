// import 'package:authfor/models/user.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:google_sign_in/google_sign_in.dart';

// class Auth {
//   FirebaseAuth _auth = FirebaseAuth.instance;

//   Stream<UserModel> get user {
//     return _auth.authStateChanges.map((FirebaseAuth firebaseAuth) => (firebaseAuth ! = null)? Users(uid: firebaseAuth.uid):null);
//   }

//   Future<Firebaseuser> signInUsesWithGoogle() async {
//     GoogleSignIn _googleSignIn = GoogleSignIn(scopes: [
//       'email',
//       'https://www.googleapis.com/auth/contacts.readonly',
//     ]);
//     try {
//       GoogleSignInAccount? _googleUser = await _googleSignIn.signIn();
//       GoogleSignInAuthentication _googleAuth =
//           await _googleUser!.authentication;
//       final AuthCredential credential = GoogleAuthProvider.credential(
//         idToken: _googleAuth.idToken,
//         accessToken: _googleAuth.accessToken,
//       );
//       await _auth.signInWithCredential(credential);
//     } catch (e) {
//       print(e);
//     }
//   }

//   Future<void> signOutUser() async {
//     try {
//       _auth.signOut();
//     } catch (e) {
//       print(e);
//     }
//   }
// }

import 'package:authfor/models/user.dart';
import 'package:authfor/screen/home/home.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart' as auth;
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AuthService {
  final auth.FirebaseAuth _firebaseAuth = auth.FirebaseAuth.instance;
  String? email, username;
  UserModel? _userFromFirebase(auth.User? user) {
    if (user == null) {
      return null;
    }
    return UserModel(
      email: user.email,
      username: user.uid,
    );
  }

  // UserModel? profileService(auth.User? user) {
  //   (UserModel userModel) {
  //     email = userModel.email;
  //     username = userModel.username;
  //     return profileService;
  //   };
  // }

  Stream<UserModel?>? get user {
    return _firebaseAuth.authStateChanges().map(
          (_userFromFirebase),
        );
  }

  // void inputData() {
  //   final User user = firestoreService.collection();
  //   final uid = user.uid;
  // }

  Future<UserModel?> signInWithEmailAndPassword(
    String email,
    String password,
  ) async {
    final creadential = await _firebaseAuth.signInWithEmailAndPassword(
        email: email, password: password);
  }

  Future<UserModel?> createUserWithEmailAndPassword(
    String email,
    String password,
  ) async {
    final credential = await _firebaseAuth.createUserWithEmailAndPassword(
        email: email, password: password);
    return _userFromFirebase(credential.user);
  }

  Future<void> SignOut() async {
    return await _firebaseAuth.signOut();
  }

  // storenewuser(user, context) async {
  //   var firebase = await FirebaseAuth.instance.currentUser;
  //   FirebaseFirestore.instance
  //       .collection('users')
  //       .doc(firebase?.uid)
  //       .set({'email': user.email, 'uid': user.uid})
  //       .then(
  //         (value) => Navigator.push(context,
  //             MaterialPageRoute(builder: (context) =>  MyHomePage(uid: '',))),
  //       )
  //       .catchError((e) {
  //         print(e);
  //       });
  // }
}
