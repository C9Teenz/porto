import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ticket_app/cubit/auth_cubit.dart';
import 'package:ticket_app/shared/theme.dart';
import 'package:ticket_app/ui/widgets/custom_button.dart';
import 'package:ticket_app/ui/widgets/custom_text_from_field.dart';

class SignUpPage extends StatelessWidget {
  SignUpPage({Key? key}) : super(key: key);
  final TextEditingController emailCon = TextEditingController();
  final TextEditingController passwordCon = TextEditingController();
  final TextEditingController nameCon = TextEditingController();
  final TextEditingController hobbyCon = TextEditingController();
  @override
  Widget build(BuildContext context) {
    AuthCubit myCubit = context.read<AuthCubit>();
    Widget title() {
      return Container(
        margin: const EdgeInsets.only(top: 30),
        child: Text(
          'Join us and get\nyour next journey',
          style: blackTextStyle.copyWith(fontSize: 24, fontWeight: semiBold),
        ),
      );
    }

    Widget inputSection() {
      Widget nameInput() {
        return CustomTextFromField(
          hint: 'Full Name',
          title: 'Full Name',
          controller: nameCon,
        );
      }

      Widget emailInput() {
        return CustomTextFromField(
          hint: 'Email Address',
          title: 'Email Address',
          controller: emailCon,
        );
      }

      Widget passwordInput() {
        return CustomTextFromField(
          hint: 'Password',
          title: 'Password',
          controller: passwordCon,
          obscureText: true,
        );
      }

      Widget hobbyInput() {
        return CustomTextFromField(
          hint: 'Hobby',
          title: 'Hobby',
          controller: hobbyCon,
        );
      }

      Widget submit() {
        return BlocConsumer<AuthCubit, AuthState>(
          bloc: myCubit,
          listener: (context, state) {
            if (state is AuthSuccess) {
              Navigator.pushNamedAndRemoveUntil(
                  context, '/bonus', (route) => false);
            } else if (state is AuthFailed) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(state.error),
                ),
              );
            }
          },
          builder: (context, state) {
            if (state is AuthLoading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            return CustomButton(
              title: 'Get Started',
              onPressed: () {
                myCubit.signUp(
                    email: emailCon.text,
                    name: nameCon.text,
                    password: passwordCon.text,
                    hobby: hobbyCon.text);
              },
            );
          },
        );
      }

      return Container(
        margin: const EdgeInsets.only(top: 30),
        decoration: BoxDecoration(
          color: kWhiteColor,
          borderRadius: BorderRadius.circular(defaultRadius),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
        child: Column(
          children: [
            nameInput(),
            emailInput(),
            passwordInput(),
            hobbyInput(),
            submit()
          ],
        ),
      );
    }

    Widget terCon() {
      return GestureDetector(
        onTap: () {
          Navigator.pushNamed(context, '/sign-in');
        },
        child: Container(
          alignment: Alignment.center,
          margin: const EdgeInsets.only(top: 20, bottom: 73),
          child: Text(
            'Have an Account, Sign In',
            style: greyTextStyle.copyWith(fontSize: 16, fontWeight: light),
          ),
        ),
      );
    }

    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: SafeArea(
          child: ListView(
              padding: EdgeInsets.symmetric(horizontal: defaultMargin),
              children: [title(), inputSection(), terCon()])),
    );
  }
}
