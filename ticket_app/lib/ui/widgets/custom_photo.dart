import 'package:flutter/material.dart';

class CustomPhoto extends StatelessWidget {
  final String imgUrl;
  const CustomPhoto({Key? key, required this.imgUrl}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      width: 70,
      margin: const EdgeInsets.only(right: 16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(18),
        image: DecorationImage(
          fit: BoxFit.cover,
          image: AssetImage(imgUrl),
        ),
      ),
    );
  }
}
