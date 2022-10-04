import 'package:flutter/material.dart';

import 'package:ticket_app/models/destination_model.dart';
import 'package:ticket_app/ui/pages/detail_page.dart';

import '../../shared/theme.dart';

class DestinationCard extends StatelessWidget {
  final DestinationModel destination;
  const DestinationCard(
    this.destination, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DetailPage(destination),
          ),
        );
      },
      child: Container(
        height: 323,
        width: 200,
        margin: EdgeInsets.only(
          left: defaultMargin,
        ),
        decoration: BoxDecoration(
            color: kWhiteColor, borderRadius: BorderRadius.circular(18)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 220,
              width: 180,
              margin: const EdgeInsets.only(top: 10, left: 10),
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(destination.imageUrl),
                ),
                borderRadius: BorderRadius.circular(18),
              ),
              child: Align(
                alignment: Alignment.topRight,
                child: Container(
                  height: 30,
                  width: 55,
                  decoration: BoxDecoration(
                    color: kWhiteColor,
                    borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(18),
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        height: 20,
                        width: 20,
                        decoration: const BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage('assets/icon_star.png'),
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 2,
                      ),
                      Text(
                        destination.rating.toString(),
                        style: blackTextStyle.copyWith(fontWeight: medium),
                      )
                    ],
                  ),
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(left: 20, top: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    destination.name,
                    style: blackTextStyle.copyWith(
                        fontSize: 18, fontWeight: medium),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Text(
                    destination.city,
                    style: greyTextStyle.copyWith(
                      fontWeight: light,
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
