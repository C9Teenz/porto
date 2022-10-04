import 'package:flutter/material.dart';
import 'package:ticket_app/shared/theme.dart';

class BookingDetailItem extends StatelessWidget {
  final String data;
  final String detail;
  final TextStyle textStyle;

  const BookingDetailItem({
    Key? key,
    required this.data,
    required this.detail,
    required this.textStyle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 16),
      child: Row(
        children: [
          Container(
            height: 16,
            width: 16,
            margin: const EdgeInsets.only(right: 6),
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/icon_checklist.png'),
              ),
            ),
          ),
          Text(
            data,
            style: blackTextStyle,
          ),
          const Spacer(),
          Text(
            detail,
            style: textStyle.copyWith(
              fontWeight: semiBold,
            ),
          ),
        ],
      ),
    );
  }
}
