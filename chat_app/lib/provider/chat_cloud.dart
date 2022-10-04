import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ChatCloud with ChangeNotifier {
  final chat = FirebaseFirestore.instance;
  TextEditingController chatC = TextEditingController();
  Stream<QuerySnapshot<Object?>> streamData() {
    Stream<QuerySnapshot<Map<String, dynamic>>> users = chat
        .collection('chats')
        .orderBy('createAt', descending: true)
        .snapshots();
    return users;

    //fungsi stream
  }

  void addData() async {
    final userId = await FirebaseAuth.instance.currentUser;
    CollectionReference users = chat.collection('chats');
    //collection reference

    if (chatC.text.isNotEmpty) {
      users.add({
        'text': chatC.text,
        'createAt': Timestamp.now(),
        'userId': userId!.uid
      });
    } else {
      print('data kosong');
    }
    chatC.clear();
  }
}
