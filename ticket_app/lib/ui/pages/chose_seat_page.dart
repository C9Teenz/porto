import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

import 'package:ticket_app/cubit/seat_cubit.dart';
import 'package:ticket_app/models/destination_model.dart';
import 'package:ticket_app/models/transaction_model.dart';
import 'package:ticket_app/shared/theme.dart';
import 'package:ticket_app/ui/pages/checkout_page.dart';
import 'package:ticket_app/ui/widgets/custom_button.dart';

import 'package:ticket_app/ui/widgets/selected_item.dart';

class ChooseSeatPage extends StatelessWidget {
  final DestinationModel destination;
  const ChooseSeatPage(this.destination, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget title() {
      return Container(
        margin: const EdgeInsets.only(top: 30),
        child: Text(
          'Select Your\nFavorite Seat',
          style: blackTextStyle.copyWith(fontWeight: semiBold, fontSize: 24),
        ),
      );
    }

    Widget seatStatus() {
      return Container(
        margin: const EdgeInsets.only(top: 30),
        child: Row(
          children: [
            //NOTE : SEAT STATUS AVAILBALE
            Container(
              margin: const EdgeInsets.only(right: 10),
              child: Row(
                children: [
                  Container(
                    height: 16,
                    width: 16,
                    margin: const EdgeInsets.only(right: 6),
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('assets/icon_available.png'),
                      ),
                    ),
                  ),
                  Text(
                    'Available',
                    style: blackTextStyle.copyWith(fontWeight: regular),
                  ),
                ],
              ),
            ),
            //NOTE : SEAT STATUS SELECTED
            Container(
              margin: const EdgeInsets.only(right: 10),
              child: Row(
                children: [
                  Container(
                    height: 16,
                    width: 16,
                    margin: const EdgeInsets.only(right: 6),
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('assets/icon_selected.png'),
                      ),
                    ),
                  ),
                  Text(
                    'Selected',
                    style: blackTextStyle.copyWith(fontWeight: regular),
                  ),
                ],
              ),
            ),
            //NOTE : SEAT STATUS UNAVAILBALE
            Container(
              margin: const EdgeInsets.only(right: 10),
              child: Row(
                children: [
                  Container(
                    height: 16,
                    width: 16,
                    margin: const EdgeInsets.only(right: 6),
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('assets/icon_unavailable.png'),
                      ),
                    ),
                  ),
                  Text(
                    'Unavailable',
                    style: blackTextStyle.copyWith(fontWeight: regular),
                  ),
                ],
              ),
            ),
          ],
        ),
      );
    }

    Widget selectSeat() {
      return BlocBuilder<SeatCubit, List<String>>(
        builder: (context, state) {
          return Container(
            width: double.infinity,
            margin: const EdgeInsets.only(top: 30, bottom: 30),
            padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 30),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(18), color: kWhiteColor),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                      height: 48,
                      width: 48,
                      color: kTransparentColor,
                      child: Center(
                        child: Text(
                          'A',
                          style: blackTextStyle.copyWith(
                              fontWeight: regular, fontSize: 16),
                        ),
                      ),
                    ),
                    Container(
                      height: 48,
                      width: 48,
                      color: kTransparentColor,
                      child: Center(
                        child: Text(
                          'B',
                          style: blackTextStyle.copyWith(
                              fontWeight: regular, fontSize: 16),
                        ),
                      ),
                    ),
                    Container(
                      height: 48,
                      width: 48,
                      color: kTransparentColor,
                      child: Center(
                        child: Text(
                          '',
                          style: blackTextStyle.copyWith(
                              fontWeight: regular, fontSize: 16),
                        ),
                      ),
                    ),
                    Container(
                      height: 48,
                      width: 48,
                      color: kTransparentColor,
                      child: Center(
                        child: Text(
                          'C',
                          style: blackTextStyle.copyWith(
                              fontWeight: regular, fontSize: 16),
                        ),
                      ),
                    ),
                    Container(
                      height: 48,
                      width: 48,
                      color: kTransparentColor,
                      child: Center(
                        child: Text(
                          'D',
                          style: blackTextStyle.copyWith(
                              fontWeight: regular, fontSize: 16),
                        ),
                      ),
                    ),
                  ],
                ),
                Container(
                  margin: const EdgeInsets.only(top: 30),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      const SelectedItem(isAvailable: false, id: 'A1'),
                      const SelectedItem(isAvailable: false, id: 'B1'),
                      Container(
                        height: 48,
                        width: 48,
                        color: kTransparentColor,
                        child: Center(
                          child: Text(
                            '1',
                            style: blackTextStyle.copyWith(
                                fontWeight: regular, fontSize: 16),
                          ),
                        ),
                      ),
                      const SelectedItem(isAvailable: true, id: 'C1'),
                      const SelectedItem(isAvailable: true, id: 'D1'),
                    ],
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 30),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      const SelectedItem(isAvailable: true, id: 'A2'),
                      const SelectedItem(isAvailable: true, id: 'B2'),
                      Container(
                        height: 48,
                        width: 48,
                        color: kTransparentColor,
                        child: Center(
                          child: Text(
                            '2',
                            style: blackTextStyle.copyWith(
                                fontWeight: regular, fontSize: 16),
                          ),
                        ),
                      ),
                      const SelectedItem(isAvailable: true, id: 'C2'),
                      const SelectedItem(isAvailable: true, id: 'D2'),
                    ],
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 30),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      const SelectedItem(isAvailable: true, id: 'A3'),
                      const SelectedItem(isAvailable: true, id: 'B3'),
                      Container(
                        height: 48,
                        width: 48,
                        color: kTransparentColor,
                        child: Center(
                          child: Text(
                            '3',
                            style: blackTextStyle.copyWith(
                                fontWeight: regular, fontSize: 16),
                          ),
                        ),
                      ),
                      const SelectedItem(isAvailable: true, id: 'C3'),
                      const SelectedItem(isAvailable: true, id: 'D3'),
                    ],
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 30),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      const SelectedItem(isAvailable: true, id: 'A4'),
                      const SelectedItem(isAvailable: true, id: 'B4'),
                      Container(
                        height: 48,
                        width: 48,
                        color: kTransparentColor,
                        child: Center(
                          child: Text(
                            '4',
                            style: blackTextStyle.copyWith(
                                fontWeight: regular, fontSize: 16),
                          ),
                        ),
                      ),
                      const SelectedItem(isAvailable: true, id: 'C4'),
                      const SelectedItem(isAvailable: true, id: 'D4'),
                    ],
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 30),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      const SelectedItem(isAvailable: true, id: 'A5'),
                      const SelectedItem(isAvailable: true, id: 'B5'),
                      Container(
                        height: 48,
                        width: 48,
                        color: kTransparentColor,
                        child: Center(
                          child: Text(
                            '5',
                            style: blackTextStyle.copyWith(
                                fontWeight: regular, fontSize: 16),
                          ),
                        ),
                      ),
                      const SelectedItem(isAvailable: true, id: 'C5'),
                      const SelectedItem(isAvailable: true, id: 'D5'),
                    ],
                  ),
                ),
                //NOTE: YOUR SEAT
                Container(
                  margin: const EdgeInsets.only(top: 30),
                  child: Row(
                    children: [
                      Expanded(
                        child: Text(
                          'Your seat',
                          style: greyTextStyle.copyWith(fontWeight: light),
                        ),
                      ),
                      Text(
                        state.join(', '),
                        style: blackTextStyle.copyWith(
                            fontWeight: medium, fontSize: 16),
                      ),
                    ],
                  ),
                ),

                Container(
                  margin: const EdgeInsets.only(top: 30),
                  child: Row(
                    children: [
                      Expanded(
                        child: Text(
                          'Total',
                          style: greyTextStyle.copyWith(fontWeight: light),
                        ),
                      ),
                      Text(
                        NumberFormat.currency(
                                locale: 'id', symbol: 'IDR ', decimalDigits: 0)
                            .format(state.length * destination.price),
                        style: purpleTextStyle.copyWith(
                            fontWeight: semiBold, fontSize: 16),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      );
    }

    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: SafeArea(
        child: ListView(
          padding: EdgeInsets.symmetric(horizontal: defaultMargin),
          children: [
            title(),
            seatStatus(),
            selectSeat(),
            BlocBuilder<SeatCubit, List<String>>(
              builder: (context, state) {
                return CustomButton(
                  title: 'Continue to Checkout',
                  onPressed: () {
                    int price = state.length * destination.price;
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => CheckOutPage(TransactionModel(
                          destination: destination,
                          traveler: state.length,
                          seat: state.join(', '),
                          insurance: true,
                          refundable: true,
                          price: price,
                          vat: 0.45,
                          grandTotal: price + (price * 0.45).toInt(),
                        )),
                      ),
                    );
                  },
                  margin: const EdgeInsets.only(bottom: 46),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
