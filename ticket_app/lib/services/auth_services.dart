import 'package:firebase_auth/firebase_auth.dart';

import 'package:ticket_app/models/user_models.dart';
import 'package:ticket_app/services/user_services.dart';

class AuthServices {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<UserModels> signUp({
    required String email,
    required String password,
    required String name,
    String hobby = '',
  }) async {
    try {
      UserCredential userCredential = await _auth
          .createUserWithEmailAndPassword(email: email, password: password);
      UserModels user = UserModels(
          id: userCredential.user!.uid,
          email: email,
          name: name,
          hobby: hobby,
          balance: 280000000);
      await UserServices().setUser(user);
      return user;
    } catch (e) {
      rethrow;
    }
  }

  Future<void> signOut() async {
    try {
      await _auth.signOut();
    } catch (e) {
      rethrow;
    }
  }

  Future<UserModels> signIn(
      {required String email, required String password}) async {
    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      UserModels user =
          await UserServices().getUserById(userCredential.user!.uid);
      //mengambil user dari yang ada dari firestore
      return user;
    } catch (e) {
      rethrow;
    }
  }
}
