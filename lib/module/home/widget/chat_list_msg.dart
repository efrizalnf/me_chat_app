import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:me_chat_app/services/auth_service/firebase_chat_service.dart';

class ChatListMsg extends StatelessWidget {
  final Stream<dynamic> stream;
  const ChatListMsg({
    super.key,
    required this.stream,
  });

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: stream,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }

        if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
          return const Center(
            child: Text('No Message Found'),
          );
        }
        if (snapshot.hasError) {
          return const Center(
            child: Text('Something wrong'),
          );
        }
        final messages = snapshot.data!.docs;
        return ListView.builder(
          itemCount: messages.length,
          itemBuilder: (ctx, index) => Text(
            messages[index].data()['message'],
            style: const TextStyle(
              color: Colors.black,
            ),
          ),
        );
      },
    );
  }
}
