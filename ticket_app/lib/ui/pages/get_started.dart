import 'package:flutter/material.dart';
import 'package:ticket_app/shared/theme.dart';
import 'package:ticket_app/ui/widgets/custom_button.dart';

class GetStarted extends StatelessWidget {
  const GetStarted({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        Container(
          width: double.infinity,
          height: double.infinity,
          decoration: const BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.cover,
              image: AssetImage(
                'assets/gambar_pesawat.png',
              ),
            ),
          ),
        ),
        Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                'Fly Like a Bird',
                style:
                    whiteTextStyle.copyWith(fontSize: 32, fontWeight: medium),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                'Explore new world with us and let\nyourself get an amazing experiences',
                style: greyTextStyle.copyWith(fontSize: 16, fontWeight: light),
                textAlign: TextAlign.center,
              ),
              CustomButton(
                title: 'Get Started',
                width: 220,
                margin: const EdgeInsets.only(top: 50, bottom: 80),
                onPressed: () {
                  Navigator.pushNamed(context, '/sign-up');
                },
              ),
            ],
          ),
        )
      ]),
    );
  }
}
