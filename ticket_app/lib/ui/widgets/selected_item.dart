import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ticket_app/cubit/seat_cubit.dart';
import 'package:ticket_app/shared/theme.dart';

class SelectedItem extends StatelessWidget {
  //NOTE: 0. AVAILABLE 1. SELECTED 3. UNAVAILABLE
  final bool isAvailable;
  final String id;
  const SelectedItem({Key? key, this.isAvailable = true, required this.id})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool isSelected = context.watch<SeatCubit>().isSelected(id);
    backgroundColor() {
      if (!isAvailable) {
        return kUnvailableColor;
      } else {
        if (isSelected) {
          return kPrimaryColor;
        } else {
          return kAvailableColor;
        }
      }
    }

    borderColor() {
      if (!isAvailable) {
        return kUnvailableColor;
      } else {
        if (isSelected) {
          return kPrimaryColor;
        } else {
          return kPrimaryColor;
        }
      }
    }

    child() {
      if (isSelected) {
        return Center(
          child: Text(
            'You',
            style: whiteTextStyle.copyWith(
              fontWeight: semiBold,
            ),
          ),
        );
      } else {
        return const SizedBox();
      }
    }

    return GestureDetector(
      onTap: () {
        if (isAvailable) {
          context.read<SeatCubit>().selectSeat(id);
        }
      },
      child: BlocBuilder<SeatCubit, List<String>>(
        builder: (context, state) {
          return Container(
            height: 48,
            width: 48,
            decoration: BoxDecoration(
              color: backgroundColor(),
              borderRadius: BorderRadius.circular(18),
              border: Border.all(color: borderColor()),
            ),
            child: child(),
          );
        },
      ),
    );
  }
}
