import 'package:flutter/material.dart';

import 'package:intl/intl.dart';

import 'package:ticket_app/models/destination_model.dart';
import 'package:ticket_app/shared/theme.dart';
import 'package:ticket_app/ui/pages/chose_seat_page.dart';
import 'package:ticket_app/ui/widgets/custom_button.dart';
import 'package:ticket_app/ui/widgets/custom_photo.dart';
import 'package:ticket_app/ui/widgets/interests_item.dart';

class DetailPage extends StatelessWidget {
  final DestinationModel destination;
  const DetailPage(this.destination, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget backgroundImage() {
      return Container(
        width: double.infinity,
        height: 450,
        decoration: BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.cover,
            image: NetworkImage(destination.imageUrl),
          ),
        ),
      );
    }

    Widget customShadow() {
      return Container(
        width: double.infinity,
        height: 214,
        margin: const EdgeInsets.only(top: 236),
        decoration: BoxDecoration(
          gradient: LinearGradient(colors: [
            kWhiteColor.withOpacity(0),
            kBlackColor.withOpacity(0.95)
          ], begin: Alignment.topCenter, end: Alignment.bottomCenter),
        ),
      );
    }

    Widget content() {
      return Container(
        width: double.infinity,
        margin: EdgeInsets.symmetric(horizontal: defaultMargin),
        child: Column(
          children: [
            //NOTE: LOGO
            Container(
              height: 24,
              width: 108,
              margin: const EdgeInsets.only(top: 30),
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/icon_emblem.png'),
                ),
              ),
            ),
            //NOTE: NAME DESTINATION
            Container(
              width: double.infinity,
              margin: const EdgeInsets.only(top: 256),
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          destination.name,
                          style: whiteTextStyle.copyWith(
                              fontSize: 24, fontWeight: semiBold),
                        ),
                        Text(
                          destination.city,
                          style: whiteTextStyle.copyWith(
                              fontSize: 16, fontWeight: light),
                        ),
                      ],
                    ),
                  ),
                  Row(
                    children: [
                      Container(
                        width: 20,
                        height: 20,
                        margin: const EdgeInsets.only(right: 2),
                        decoration: const BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage('assets/icon_star.png'),
                          ),
                        ),
                      ),
                      Text(
                        destination.rating.toString(),
                        style: whiteTextStyle.copyWith(fontWeight: medium),
                      )
                    ],
                  ),
                ],
              ),
            ),
            //NOTE: ABOUT
            Container(
              width: double.infinity,
              height: 446,
              margin: const EdgeInsets.only(top: 30),
              padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 20),
              decoration: BoxDecoration(
                color: kWhiteColor,
                borderRadius: BorderRadius.circular(18),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'About',
                    style: blackTextStyle.copyWith(
                        fontWeight: semiBold, fontSize: 16),
                  ),
                  const SizedBox(
                    height: 6,
                  ),
                  Text(
                    'Berada di jalur jalan provinsi yang menghubungkan Denpasar Singaraja serta letaknya yang dekat dengan Kebun Raya Eka Karya menjadikan tempat Bali.',
                    style: blackTextStyle.copyWith(
                        fontWeight: regular, height: 1.9),
                    textAlign: TextAlign.justify,
                  ),
                  //NOTE: PHOTOS
                  Container(
                    margin: const EdgeInsets.only(top: 30),
                    width: double.infinity,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Photos',
                          style: blackTextStyle.copyWith(
                            fontSize: 16,
                            fontWeight: semiBold,
                          ),
                        ),
                        const SizedBox(
                          height: 6,
                        ),
                        Row(
                          children: const [
                            CustomPhoto(imgUrl: 'assets/photo 1.png'),
                            CustomPhoto(imgUrl: 'assets/photo 2.png'),
                            CustomPhoto(imgUrl: 'assets/photo 3.png'),
                          ],
                        )
                      ],
                    ),
                  ),
                  //NOTE: INTERESTS
                  Container(
                    width: double.infinity,
                    margin: const EdgeInsets.only(top: 30),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Interests',
                          style: blackTextStyle.copyWith(
                              fontSize: 16, fontWeight: semiBold),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: const [
                            InterestItem(interest: 'Kids Park'),
                            InterestItem(interest: 'Honor Bridge'),
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: const [
                            InterestItem(interest: 'City Museum'),
                            InterestItem(interest: 'Central Mall'),
                          ],
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
            //NOTE: BOOK KNOW
            Container(
              alignment: Alignment.bottomCenter,
              margin: const EdgeInsets.symmetric(vertical: 30),
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          NumberFormat.currency(
                                  locale: 'id',
                                  symbol: 'IDR ',
                                  decimalDigits: 0)
                              .format(destination.price),
                          style: blackTextStyle.copyWith(
                              fontWeight: medium, fontSize: 18),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Text(
                          'per orang',
                          style: greyTextStyle.copyWith(fontWeight: light),
                        )
                      ],
                    ),
                  ),
                  CustomButton(
                      title: 'Book Now',
                      width: 170,
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ChooseSeatPage(destination),
                          ),
                        );
                      }),
                ],
              ),
            )
          ],
        ),
      );
    }

    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: SafeArea(
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Stack(
            children: [
              backgroundImage(),
              customShadow(),
              content(),
            ],
          ),
        ),
      ),
    );
  }
}
