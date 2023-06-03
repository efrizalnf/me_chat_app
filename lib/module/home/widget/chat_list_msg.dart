// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:developer';
import 'dart:ui';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'chat_bubble_msg.dart';

class ChatListMsg extends StatelessWidget {
  final Stream<dynamic> stream;
  final User userId;
  const ChatListMsg({
    Key? key,
    required this.stream,
    required this.userId,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // String dateChat(dynamic value) {
    //   Timestamp ts = value;
    //   DateTime tsdate = DateTime.fromMillisecondsSinceEpoch(ts);
    //   String fdatetime = DateFormat('dd-MMM-yyy').format(tsdate);
    //   return fdatetime;
    // }

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
        final ScrollController controller = ScrollController();
        final messages = snapshot.data!.docs;
        return ScrollConfiguration(
          behavior: ScrollConfiguration.of(context).copyWith(dragDevices: {
            PointerDeviceKind.touch,
            PointerDeviceKind.mouse,
          }),
          child: ListView.builder(
            controller: controller,
            // scrollDirection: Axis.vertical,
            // reverse: true,
            itemCount: messages.length,
            itemBuilder: (ctx, index) {
              final chatMessage = messages[index].data();
              final nextChatMessage = index + 1 < messages.length
                  ? messages[index + 1].data()
                  : null;
              final currentMessageUserId = chatMessage['uid'];
              // log("userid" + userId.uid);
              final nextMessageUserId =
                  nextChatMessage != null ? nextChatMessage['uid'] : null;
              final nextUserIsSame = nextMessageUserId == currentMessageUserId;
              if (nextUserIsSame) {
                return MessageBubble.next(
                    message: chatMessage['message'],
                    isMe: userId.uid == currentMessageUserId);
              } else {
                print(chatMessage['photo']);
                return MessageBubble.first(
                    userImage: chatMessage['photo'],
                    username: chatMessage['username'],
                    message: chatMessage['message'],
                    isMe: userId.uid == currentMessageUserId);
              }
            },
          ),
        );
      },
    );
  }
}
