import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ticket_app/cubit/auth_cubit.dart';
import 'package:ticket_app/shared/theme.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Timer(const Duration(seconds: 3), () {
      //shared preference
      User? user = FirebaseAuth.instance.currentUser;
      if (user == null) {
        Navigator.pushNamedAndRemoveUntil(
            context, '/get-started', (route) => false);
      } else {
        context.read<AuthCubit>().getUserById(user.uid);
        Navigator.pushNamedAndRemoveUntil(context, '/main', (route) => false);
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryColor,
      body: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Container(
            margin: const EdgeInsets.only(bottom: 50),
            width: 100,
            height: 100,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/logo_plane.png'),
              ),
            ),
          ),
          Text(
            'AIRPLANE',
            style: whiteTextStyle.copyWith(
                fontSize: 32, fontWeight: medium, letterSpacing: 10),
          )
        ]),
      ),
    );
  }
}
