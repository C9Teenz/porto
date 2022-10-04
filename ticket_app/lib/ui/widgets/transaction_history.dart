import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:ticket_app/models/transaction_model.dart';

import '../../shared/theme.dart';
import 'booking_detail_item.dart';

class TransactionHistory extends StatelessWidget {
  final TransactionModel transaction;
  const TransactionHistory(this.transaction, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
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
}
