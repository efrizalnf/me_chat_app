// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class ChatBubbleWithCard extends StatelessWidget {
  const ChatBubbleWithCard({
    Key? key,
    required this.userImage,
    required this.message,
  }) : super(key: key);
  final String userImage;
  final String message;
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(5),
      child: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Row(
          children: [
            CircleAvatar(
              backgroundImage: NetworkImage(
                userImage,
              ),
            ),
            const SizedBox(
              width: 10.0,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    message,
                    style: const TextStyle(
                      color: Colors.black,
                    ),
                    textAlign: TextAlign.left,
                  ),
                  // Text(
                  //   "${dateChat(messages[index].data()['createdAt'])}",
                  //   style: const TextStyle(
                  //     fontSize: 10.0,
                  //   ),
                  //   textAlign: TextAlign.right,
                  // ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
