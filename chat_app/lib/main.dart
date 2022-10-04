import 'package:chat_app/provider/auth.dart';
import 'package:chat_app/provider/chat_cloud.dart';

import 'package:chat_app/wrapper.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MultiProvider(providers: [
        ChangeNotifierProvider(
          create: (context) => ChatCloud(),
        ),
        ChangeNotifierProvider(
          create: (context) => Auth(),
        )
      ], child: Wrapper()),
    );
  }
}
