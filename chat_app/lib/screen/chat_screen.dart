import 'package:chat_app/provider/chat_cloud.dart';
import 'package:chat_app/widgets/massage.dart';
import 'package:chat_app/widgets/new_massage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/auth.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ChatCloud chat = Provider.of<ChatCloud>(context);
    Auth auth = Provider.of<Auth>(context);
    return Scaffold(
        // bottomNavigationBar: BottomAppBar(
        //   child: Row(
        //     children: [
        //       Container(
        //           width: MediaQuery.of(context).size.width * 0.8,
        //           child: TextField(
        //             controller: chat.chatC,
        //           )),
        //       const Spacer(),
        //       IconButton(
        //           onPressed: () {
        //             chat.addData();
        //           },
        //           icon: Icon(Icons.send))
        //     ],
        //   ),
        // ),
        appBar: AppBar(
          title: const Text('Chat'),
          actions: [
            IconButton(
                onPressed: () {
                  auth.logOut();
                },
                icon: const Icon(Icons.logout))
          ],
        ),
        body: Container(
          child: Column(
            children: [
              Expanded(child: Massage()),
              NewMassage(),
            ],
          ),
        ));
  }
}
