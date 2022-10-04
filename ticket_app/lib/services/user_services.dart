import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ticket_app/models/user_models.dart';

class UserServices {
  final CollectionReference _userReference =
      FirebaseFirestore.instance.collection('users');

  Future<void> setUser(UserModels user) async {
    try {
      _userReference.doc(user.id).set({
        'email': user.email,
        'nama': user.name,
        'hobby': user.hobby,
        'balance': user.balance
      });
    } catch (e) {
      rethrow;
    }
  }

  Future<UserModels> getUserById(String id) async {
    try {
      DocumentSnapshot snapshot = await _userReference.doc(id).get();
      return UserModels(
          id: id,
          email: snapshot['email'],
          name: snapshot['nama'],
          hobby: snapshot['hobby'],
          balance: snapshot['balance']);
    } catch (e) {
      rethrow;
    }
  }
}
