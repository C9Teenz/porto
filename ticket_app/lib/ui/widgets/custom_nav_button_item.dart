import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../cubit/cubit_bloc.dart';
import '../../shared/theme.dart';

class NavButtonItem extends StatelessWidget {
  final String imageAsset;
  final int index;

  const NavButtonItem({Key? key, required this.imageAsset, required this.index})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    PageBloc pageBloc = context.read<PageBloc>();
    return GestureDetector(
      onTap: () {
        pageBloc.newPage(index);
      },
      child: BlocBuilder<PageBloc, int>(
        bloc: pageBloc,
        builder: (context, state) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const SizedBox(),
              Image.asset(
                  width: 24,
                  height: 24,
                  imageAsset,
                  color: state == index ? kPrimaryColor : kGreyColor),
              // Container(
              //   width: 24,
              //   height: 24,
              //   decoration: BoxDecoration(
              //     image: DecorationImage(
              //       image: AssetImage(imageAsset),
              //     ),
              //   ),
              // ),
              Container(
                width: 30,
                height: 2,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(18),
                    color: state == index ? kPrimaryColor : kTransparentColor),
              )
            ],
          );
        },
      ),
    );
  }
}
