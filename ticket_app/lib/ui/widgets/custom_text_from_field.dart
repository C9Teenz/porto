import 'package:flutter/material.dart';

import '../../shared/theme.dart';

class CustomTextFromField extends StatelessWidget {
  final String title;
  final String hint;
  final bool obscureText;
  final TextEditingController controller;
  const CustomTextFromField(
      {Key? key,
      required this.hint,
      required this.title,
      required this.controller,
      this.obscureText = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: blackTextStyle.copyWith(
              fontWeight: regular,
              fontSize: 14,
            ),
          ),
          const SizedBox(
            height: 6,
          ),
          TextFormField(
            controller: controller,
            obscureText: obscureText,
            cursorColor: kBlackColor,
            decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(defaultRadius),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(defaultRadius),
                  borderSide: BorderSide(color: kPrimaryColor),
                ),
                hintText: hint),
          ),
        ],
      ),
    );
  }
}
