import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/auth.dart';
import '../widgets/widget_auth.dart';

class AuthScreen extends StatelessWidget {
  const AuthScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Auth auth = Provider.of<Auth>(context);
    return Scaffold(
      backgroundColor: Colors.lightBlue,
      body: ChangeNotifierProvider(
          create: (context) => Auth(), child: WidgetAuth()),
    );
  }
}
