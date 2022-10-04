import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:ticket_app/cubit/auth_cubit.dart';
import 'package:ticket_app/cubit/transaction_cubit.dart';
import 'package:ticket_app/models/transaction_model.dart';
import 'package:ticket_app/shared/theme.dart';

import 'package:ticket_app/ui/widgets/booking_detail_item.dart';
import 'package:ticket_app/ui/widgets/custom_button.dart';

class CheckOutPage extends StatelessWidget {
  final TransactionModel transaction;
  const CheckOutPage(this.transaction, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget route() {
      return Container(
        margin: const EdgeInsets.only(top: 30),
        child: Column(
          children: [
            Container(
              height: 132,
              width: double.infinity,
              margin: const EdgeInsets.symmetric(horizontal: 19),
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/icon_chekout.png'),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'CGK',
                      style: blackTextStyle.copyWith(
                          fontWeight: semiBold, fontSize: 24),
                    ),
                    Text(
                      'Tangerang',
                      style: greyTextStyle.copyWith(fontWeight: light),
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      'TLC',
                      style: blackTextStyle.copyWith(
                          fontWeight: semiBold, fontSize: 24),
                    ),
                    Text(
                      'Ciliwung',
                      style: greyTextStyle.copyWith(fontWeight: light),
                    ),
                  ],
                ),
              ],
            )
          ],
        ),
      );
    }

    Widget bookingDetail() {
      return Container(
        width: double.infinity,
        margin: const EdgeInsets.only(top: 30),
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
        decoration: BoxDecoration(
            color: kWhiteColor, borderRadius: BorderRadius.circular(18)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  height: 70,
                  width: 70,
                  margin: const EdgeInsets.only(right: 16),
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: NetworkImage(transaction.destination.imageUrl),
                    ),
                    borderRadius: BorderRadius.circular(18),
                  ),
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        transaction.destination.name,
                        style: blackTextStyle.copyWith(
                            fontWeight: medium, fontSize: 18),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Text(
                        transaction.destination.city,
                        style: greyTextStyle.copyWith(fontWeight: light),
                      ),
                    ],
                  ),
                ),
                Row(
                  children: [
                    Container(
                      width: 20,
                      height: 20,
                      margin: const EdgeInsets.only(left: 2),
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage('assets/icon_star.png'),
                        ),
                      ),
                    ),
                    Text(
                      transaction.destination.rating.toString(),
                      style: blackTextStyle.copyWith(
                        fontWeight: medium,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Container(
              margin: const EdgeInsets.only(top: 20),
              child: Text(
                'Booking Details',
                style:
                    blackTextStyle.copyWith(fontWeight: semiBold, fontSize: 16),
              ),
            ),
            BookingDetailItem(
              data: 'Treveler',
              detail: '${transaction.traveler} Person',
              textStyle: blackTextStyle,
            ),
            BookingDetailItem(
              data: 'Seat',
              detail: transaction.seat,
              textStyle: blackTextStyle,
            ),
            BookingDetailItem(
              data: 'Insurance',
              detail: transaction.insurance ? 'YES' : 'No',
              textStyle: transaction.insurance ? greenTextStyle : redTextStyle,
            ),
            BookingDetailItem(
              data: 'Refundable',
              detail: transaction.refundable ? 'YES' : 'NO',
              textStyle: transaction.refundable ? greenTextStyle : redTextStyle,
            ),
            BookingDetailItem(
              data: 'VAT',
              detail: '${(transaction.vat * 100).toStringAsFixed(0)}%',
              textStyle: blackTextStyle,
            ),
            BookingDetailItem(
              data: 'Price',
              detail: NumberFormat.currency(
                      locale: 'id', symbol: 'IDR ', decimalDigits: 0)
                  .format(transaction.price),
              textStyle: blackTextStyle,
            ),
            BookingDetailItem(
              data: 'Grand Total',
              detail: NumberFormat.currency(
                      locale: 'id', symbol: 'IDR ', decimalDigits: 0)
                  .format(transaction.grandTotal),
              textStyle: purpleTextStyle,
            ),
          ],
        ),
      );
    }

    Widget paymentDetail() {
      return BlocBuilder<AuthCubit, AuthState>(
        builder: (context, state) {
          if (state is AuthSuccess) {
            return Container(
              margin: const EdgeInsets.symmetric(
                vertical: 30,
              ),
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
              decoration: BoxDecoration(
                color: kWhiteColor,
                borderRadius: BorderRadius.circular(18),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Payment Detail',
                    style: blackTextStyle.copyWith(
                        fontWeight: semiBold, fontSize: 16),
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 16),
                    child: Row(
                      children: [
                        Container(
                          width: 100,
                          height: 70,
                          margin: const EdgeInsets.only(right: 16),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(18),
                              color: kPrimaryColor),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
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
                                    fontWeight: medium, fontSize: 16),
                              )
                            ],
                          ),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              NumberFormat.currency(
                                      locale: 'id',
                                      symbol: 'IDR ',
                                      decimalDigits: 0)
                                  .format(state.user.balance),
                              style: blackTextStyle.copyWith(
                                  fontWeight: medium, fontSize: 18),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            Text('Current Balance',
                                style: greyTextStyle.copyWith(
                                  fontWeight: light,
                                )),
                          ],
                        )
                      ],
                    ),
                  )
                ],
              ),
            );
          } else {
            return const SizedBox();
          }
        },
      );
    }

    Widget button() {
      return BlocConsumer<TransactionCubit, TransactionState>(
        listener: (context, state) {
          if (state is TransactionSuccess) {
            Navigator.pushNamedAndRemoveUntil(
                context, '/success', (route) => false);
          } else if (state is TransactionFailed) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(state.error),
              ),
            );
          }
        },
        builder: (context, state) {
          if (state is TransactionLoading) {
            return Container(
              alignment: Alignment.center,
              child: const CircularProgressIndicator(),
            );
          } else {
            return CustomButton(
              title: 'Pay Now',
              onPressed: () {
                context.read<TransactionCubit>().createTransaction(transaction);
              },
            );
          }
        },
      );
    }

    Widget termCon() {
      return Center(
        child: Container(
          margin: const EdgeInsets.symmetric(vertical: 30),
          child: Text(
            'Term and Condition',
            style: greyTextStyle.copyWith(fontWeight: light, fontSize: 16),
          ),
        ),
      );
    }

    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: SafeArea(
          child: ListView(
        padding: EdgeInsets.symmetric(horizontal: defaultMargin),
        children: [
          route(),
          bookingDetail(),
          paymentDetail(),
          button(),
          termCon()
        ],
      )),
    );
  }
}
