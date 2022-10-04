import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ticket_app/cubit/auth_cubit.dart';
import 'package:ticket_app/cubit/destination_cubit.dart';
import 'package:ticket_app/shared/theme.dart';
import 'package:ticket_app/ui/widgets/destination_card.dart';
import 'package:ticket_app/ui/widgets/destination_tile.dart';

import '../../models/destination_model.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    context.read<DestinationCubit>().fetchDestination();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    DestinationCubit myDestination = context.read<DestinationCubit>();
    Widget header() {
      return BlocBuilder<AuthCubit, AuthState>(
        builder: (context, state) {
          if (state is AuthSuccess) {
            return Container(
              margin: EdgeInsets.only(
                  right: defaultMargin, left: defaultMargin, top: 30),
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Howdy,\n${state.user.name}',
                          style: blackTextStyle.copyWith(
                              fontWeight: semiBold, fontSize: 24),
                          overflow: TextOverflow.ellipsis,
                        ),
                        const SizedBox(
                          height: 6,
                        ),
                        Text(
                          'Where to fly today?',
                          style: greyTextStyle.copyWith(
                              fontWeight: light, fontSize: 16),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: 60,
                    width: 60,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        image: AssetImage('assets/image_profil.png'),
                      ),
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

    Widget popularDestination(List<DestinationModel> destination) {
      return Container(
        margin: const EdgeInsets.only(top: 30),
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: destination.map((DestinationModel destination) {
              return DestinationCard(destination);
            }).toList(),
          ),
        ),
      );
    }

    Widget newDestination(List<DestinationModel> destination) {
      return Container(
        margin: EdgeInsets.only(
            top: 30, left: defaultMargin, right: defaultMargin, bottom: 140),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'New This Year',
              style:
                  blackTextStyle.copyWith(fontWeight: semiBold, fontSize: 18),
            ),
            Column(
              children: destination.map((DestinationModel destination) {
                return DestinationTile(destination);
              }).toList(),
            )
          ],
        ),
      );
    }

    return BlocConsumer<DestinationCubit, DestinationState>(
      bloc: myDestination,
      listener: (context, state) {
        if (state is DestinationFailed) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.error),
            ),
          );
        }
      },
      builder: (context, state) {
        if (state is DestinationSuccess) {
          return ListView(
            children: [
              header(),
              popularDestination(state.destination),
              newDestination(state.destination)
            ],
          );
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
