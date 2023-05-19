import 'package:flutter/material.dart';

class ChatListMsg extends StatelessWidget {
  const ChatListMsg({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SingleChildScrollView(
        controller: ScrollController(),
        child: Column(
          children: const [Text('No message....')],
        ),
      ),
    );
  }
}
