import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Auth with ChangeNotifier {
  var auth = FirebaseAuth.instance;
  bool isloginScreen = false;

  void submit(String email, String password, String username) async {
    try {
      if (isloginScreen) {
        final result = await auth.createUserWithEmailAndPassword(
            email: email, password: password);
        FirebaseFirestore.instance
            .collection('users')
            .doc(result.user!.uid)
            .set({'username': username, 'email': email});
      } else {
        await auth.signInWithEmailAndPassword(email: email, password: password);
      }
    } on FirebaseAuthException catch (e) {
      print(e);
      //biasa menggunakan toast untuk mengetahui errornya
    }
    //metod login
  }

  void changeScreen() {
    isloginScreen = !isloginScreen;
  }

  Stream<User?> changeState() {
    return auth.authStateChanges();
  }

  void logOut() {
    auth.signOut();
  }
}
