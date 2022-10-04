import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

import '../../cubit/auth_cubit.dart';
import '../../shared/theme.dart';

class WalletPage extends StatelessWidget {
  const WalletPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: BlocBuilder<AuthCubit, AuthState>(
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
      ),
    );
  }
}
