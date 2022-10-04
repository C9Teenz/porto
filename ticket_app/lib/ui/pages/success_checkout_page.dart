import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ticket_app/cubit/cubit_bloc.dart';
import 'package:ticket_app/shared/theme.dart';
import 'package:ticket_app/ui/widgets/custom_button.dart';

class SuccessCheckOut extends StatelessWidget {
  const SuccessCheckOut({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 300,
              height: 150,
              margin: const EdgeInsets.only(bottom: 80),
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/icon_success.png'),
                ),
              ),
            ),
            Text(
              'Well Booked 😍',
              style:
                  blackTextStyle.copyWith(fontWeight: semiBold, fontSize: 32),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              'Are you ready to explore the new\nworld of experiences?',
              style: greyTextStyle.copyWith(fontWeight: light, fontSize: 16),
              textAlign: TextAlign.center,
            ),
            CustomButton(
              title: 'My Bookings',
              onPressed: () {
                context.read<PageBloc>().newPage(1);
                Navigator.pushNamedAndRemoveUntil(
                    context, '/main', (route) => false);
              },
              margin: const EdgeInsets.only(top: 50, right: 78, left: 78),
            )
          ],
        ),
      ),
    );
  }
}
