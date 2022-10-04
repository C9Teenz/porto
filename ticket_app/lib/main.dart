import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ticket_app/cubit/auth_cubit.dart';
import 'package:ticket_app/cubit/destination_cubit.dart';
import 'package:ticket_app/cubit/seat_cubit.dart';
import 'package:ticket_app/cubit/transaction_cubit.dart';
import 'package:ticket_app/firebase_options.dart';
import 'package:ticket_app/ui/pages/bonus_page.dart';
import 'package:ticket_app/ui/pages/get_started.dart';
import 'package:ticket_app/ui/pages/main_page.dart';
import 'package:ticket_app/ui/pages/signin_page.dart';
import 'package:ticket_app/ui/pages/signup_page.dart';

import 'package:ticket_app/ui/pages/splash_page.dart';
import 'package:ticket_app/ui/pages/success_checkout_page.dart';

import 'cubit/cubit_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => PageBloc(),
        ),
        BlocProvider(
          create: (context) => AuthCubit(),
        ),
        BlocProvider(
          create: (context) => DestinationCubit(),
        ),
        BlocProvider(
          create: (context) => SeatCubit(),
        ),
        BlocProvider(
          create: (context) => TransactionCubit(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: {
          '/': (context) => const SplashScreen(),
          '/get-started': (context) => const GetStarted(),
          '/sign-up': (context) => SignUpPage(),
          '/sign-in': (context) => SignInPage(),
          '/bonus': (context) => const BonusPage(),
          '/main': (context) => const MainPage(),
          '/success': (context) => const SuccessCheckOut(),
        },
      ),
    );
  }
}
