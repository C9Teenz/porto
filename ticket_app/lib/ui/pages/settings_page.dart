import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ticket_app/cubit/auth_cubit.dart';
import 'package:ticket_app/cubit/cubit_bloc.dart';
import 'package:ticket_app/ui/widgets/custom_button.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is AuthInitial) {
          context.read<PageBloc>().newPage(0);
          Navigator.pushNamedAndRemoveUntil(
              context, '/sign-up', (route) => false);
        } else if (state is AuthFailed) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.error),
            ),
          );
        }
      },
      builder: (context, state) {
        return Center(
          child: CustomButton(
            title: 'SignOut',
            onPressed: () {
              context.read<AuthCubit>().signOut();
            },
            width: 180,
          ),
        );
      },
    );
  }
}
