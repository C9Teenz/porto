import 'package:flutter/material.dart';

class BubleChat extends StatelessWidget {
  BubleChat({Key? key, required this.Massage, required this.isMe})
      : super(key: key);
  String Massage;
  bool isMe;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: isMe ? MainAxisAlignment.end : MainAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 15),
          margin: const EdgeInsets.all(10),
          width: 150,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: isMe ? Colors.blue : Colors.grey),
          child: Text(
            Massage,
            style: TextStyle(color: isMe ? Colors.white : Colors.black),
          ),
        ),
      ],
    );
  }
}
