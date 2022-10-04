import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:ticket_app/cubit/auth_cubit.dart';
import 'package:ticket_app/shared/theme.dart';
import 'package:ticket_app/ui/widgets/custom_button.dart';

class BonusPage extends StatelessWidget {
  const BonusPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget bonusCard() {
      return BlocBuilder<AuthCubit, AuthState>(
        builder: (context, state) {
          if (state is AuthSuccess) {
            return Container(
              width: double.infinity,
              height: 211,
              margin: EdgeInsets.symmetric(horizontal: defaultMargin),
              padding: EdgeInsets.all(defaultMargin),
              decoration: BoxDecoration(
                image: const DecorationImage(
                  image: AssetImage('assets/card.png'),
                ),
                boxShadow: [
                  BoxShadow(
                      offset: const Offset(0, 10),
                      color: kPrimaryColor.withOpacity(0.5),
                      blurRadius: 25),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Name',
                              style: whiteTextStyle.copyWith(
                                  fontWeight: light, fontSize: 14),
                            ),
                            Text(
                              state.user.name,
                              style: whiteTextStyle.copyWith(
                                  fontWeight: medium, fontSize: 20),
                            ),
                          ],
                        ),
                      ),
                      Row(
                        children: [
                          Container(
                            width: 24,
                            height: 24,
                            margin: const EdgeInsets.only(right: 6),
                            decoration: const BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage('assets/logo_plane.png'),
                              ),
                            ),
                          ),
                          Text(
                            'Pay',
                            style: whiteTextStyle.copyWith(
                                fontSize: 16, fontWeight: medium),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 41,
                  ),
                  Text(
                    'Balance',
                    style: whiteTextStyle.copyWith(
                      fontWeight: light,
                      fontSize: 14,
                    ),
                  ),
                  Text(
                    NumberFormat.currency(
                            locale: 'id', symbol: 'IDR ', decimalDigits: 0)
                        .format(state.user.balance),
                    style: whiteTextStyle.copyWith(
                        fontWeight: medium, fontSize: 26),
                  ),
                ],
              ),
            );
          } else {
            return const SizedBox();
          }
        },
      );
    }

    Widget title() {
      return Container(
        margin: const EdgeInsets.only(top: 80),
        child: Text(
          'Big Bonus 🎉',
          style: blackTextStyle.copyWith(fontWeight: semiBold, fontSize: 32),
        ),
      );
    }

    Widget subtitle() {
      return Container(
        margin: const EdgeInsets.only(top: 10),
        child: Text(
          'We give you early credit so that\nyou can buy a flight ticket',
          style: greyTextStyle.copyWith(fontWeight: light, fontSize: 16),
          textAlign: TextAlign.center,
        ),
      );
    }

    Widget startfly() {
      return CustomButton(
        title: 'Start Fly Now',
        width: 220,
        margin: const EdgeInsets.only(top: 64),
        onPressed: () {
          Navigator.pushNamed(context, '/main');
        },
      );
    }

    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [bonusCard(), title(), subtitle(), startfly()],
        ),
      ),
    );
  }
}
