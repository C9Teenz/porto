import 'package:chat_app/widgets/buble_chat.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import '../provider/chat_cloud.dart';

class Massage extends StatelessWidget {
  const Massage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ChatCloud chat = Provider.of<ChatCloud>(context);
    return StreamBuilder<QuerySnapshot<Object?>>(
        stream: chat.streamData(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final chatList = snapshot.data!.docs;
            return ListView.builder(
                reverse: true,
                itemCount: chatList.length,
                itemBuilder: (context, index) {
                  final chat = chatList[index];
                  return BubleChat(
                    Massage: chat['text'],
                    isMe: chat['userId'] ==
                        FirebaseAuth.instance.currentUser!.uid,
                  );
                });
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        });
  }
}
