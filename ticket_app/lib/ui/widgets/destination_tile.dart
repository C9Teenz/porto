import 'package:flutter/material.dart';
import 'package:ticket_app/models/destination_model.dart';
import 'package:ticket_app/shared/theme.dart';

class DestinationTile extends StatelessWidget {
  final DestinationModel destination;
  const DestinationTile(
    this.destination, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(top: 16),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: kWhiteColor,
        borderRadius: BorderRadius.circular(18),
      ),
      child: Row(
        children: [
          Container(
            height: 70,
            width: 70,
            margin: const EdgeInsets.only(right: 16),
            decoration: BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.cover,
                image: NetworkImage(destination.imageUrl),
              ),
              borderRadius: BorderRadius.circular(18),
            ),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  destination.name,
                  style:
                      blackTextStyle.copyWith(fontWeight: medium, fontSize: 18),
                ),
                const SizedBox(
                  height: 5,
                ),
                Text(
                  destination.city,
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
                destination.rating.toString(),
                style: blackTextStyle.copyWith(
                  fontWeight: medium,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
