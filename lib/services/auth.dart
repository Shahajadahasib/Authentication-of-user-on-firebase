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

class AuthService {
  final usersdata = FirebaseFirestore.instance.collection("Users");
  final auth.FirebaseAuth _firebaseAuth = auth.FirebaseAuth.instance;
  String? email, username, password, conpassword, uid;
  UserModel? _userFromFirebase(auth.User? user) {
    if (user == null) {
      return null;
    }
    return UserModel(
      uid: user.uid,
      email: user.email,
    );
  }

  Stream<UserModel?>? get user {
    return _firebaseAuth.authStateChanges().map(
          (_userFromFirebase),
        );
  }

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
      email: email,
      password: password,
    );
    // .then(
    //   (value) => {
    //     FirebaseFirestore.instance.collection("Users").doc(value!.uid).set({
    //       "Email": value.user!.email.toString(),
    //     })
    //   },
    // );

    return _userFromFirebase(credential.user);
  }

  Future<void> SignOut() async {
    return await _firebaseAuth.signOut();
  }

  Future<void> crateValue(
    String username,
    String uid,
    String email,
    // String password,
    // String repassword,
  ) async {
    final usersdata = FirebaseFirestore.instance.collection(
        "Users"); //FirebaseFirestore.instance.collection(_firebaseAuth.currentUser!.uid);
    usersdata.add({
      'displayname': username,
      'uid': _firebaseAuth.currentUser!.uid,
      'email': email
    });
    return;
  }
}
