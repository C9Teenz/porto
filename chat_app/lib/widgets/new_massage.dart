import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/chat_cloud.dart';

class NewMassage extends StatefulWidget {
  const NewMassage({Key? key}) : super(key: key);

  @override
  State<NewMassage> createState() => _NewMassageState();
}

class _NewMassageState extends State<NewMassage> {
  @override
  Widget build(BuildContext context) {
    ChatCloud chat = Provider.of<ChatCloud>(context);
    return Container(
        padding: const EdgeInsets.all(20),
        child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
          Expanded(
            child: TextField(
              controller: chat.chatC,
            ),
          ),
          IconButton(
              onPressed: () {
                chat.addData();
              },
              icon: Icon(Icons.send))
        ]));
  }
}
