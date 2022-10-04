import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ticket_app/shared/theme.dart';
import 'package:ticket_app/ui/pages/home_page.dart';
import 'package:ticket_app/ui/pages/settings_page.dart';
import 'package:ticket_app/ui/pages/transaction_page.dart';
import 'package:ticket_app/ui/pages/wallet_page.dart';
import 'package:ticket_app/ui/widgets/custom_nav_button_item.dart';

import '../../cubit/cubit_bloc.dart';

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget buildContent(int newCurrentPage) {
      switch (newCurrentPage) {
        case 0:
          return const HomePage();
        case 1:
          return const TransactionPage();
        case 2:
          return const WalletPage();
        case 3:
          return const SettingsPage();

        default:
          return const HomePage();
      }
    }

    Widget customButtonNav() {
      return Align(
        alignment: Alignment.bottomCenter,
        child: Container(
          width: double.infinity,
          height: 60,
          margin: EdgeInsets.only(
              left: defaultMargin, right: defaultMargin, bottom: 30),
          decoration: BoxDecoration(
            color: kWhiteColor,
            borderRadius: BorderRadius.circular(18),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: const [
              NavButtonItem(
                imageAsset: 'assets/icon_home.png',
                index: 0,
              ),
              NavButtonItem(
                imageAsset: 'assets/icon_book.png',
                index: 1,
              ),
              NavButtonItem(
                imageAsset: 'assets/icon_card.png',
                index: 2,
              ),
              NavButtonItem(
                imageAsset: 'assets/icon_settings.png',
                index: 3,
              ),
            ],
          ),
        ),
      );
    }

    return BlocBuilder<PageBloc, int>(
      builder: (context, state) {
        return Scaffold(
          backgroundColor: kBackgroundColor,
          body: Stack(
            children: [buildContent(state), customButtonNav()],
          ),
        );
      },
    );
  }
}
