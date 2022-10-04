import 'package:chat_app/screen/auth_screen.dart';
import 'package:chat_app/screen/chat_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'provider/auth.dart';

class Wrapper extends StatelessWidget {
  const Wrapper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Auth auth = Provider.of<Auth>(context);
    return StreamBuilder<User?>(
        stream: auth.changeState(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ChatScreen();
          } else {
            return AuthScreen();
          }
        });
  }
}
