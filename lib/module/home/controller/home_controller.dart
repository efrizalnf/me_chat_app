import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:me_chat_app/core.dart';
import 'package:me_chat_app/helper/constant.dart';

import '../../../services/auth_service/firebase_chat_service.dart';
import '../widget/chat_bubble_msg.dart';
import '../widget/chat_input_msg.dart';

class HomeController extends State<HomeView> implements MvcController {
  static late HomeController instance;
  late HomeView view;
  TextEditingController chatController = TextEditingController();
  bool isShowEmoji = true;
  MenuBarItem? selectedMenuBar;

  final authUser = FirebaseChatServices.fireBaseAuth;
  @override
  void dispose() {
    chatController.dispose();
    super.dispose();
  }

  void doLogout() {
    FirebaseChatServices.doLogout();
  }

  void showEmoji() {
    setState(() {
      isShowEmoji = !isShowEmoji;
    });
  }

  sendMessage(String text) {
    final chatMessage = chatController.text;
    setState(() {
      chatMessage;
    });
    if (chatMessage.trim().isEmpty) {
      return;
    }
    FocusScope.of(context).unfocus();
    chatController.clear();
    FirebaseChatServices.sendChatMessage(chatMessage);
  }

  Stream<dynamic> getMessageList() {
    return FirebaseChatServices.getMessageList();
  }

  SliverList getSlivers() {
    return SliverList(
      delegate: SliverChildListDelegate(
        [
          StreamBuilder(
            stream: getMessageList(),
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
                behavior:
                    ScrollConfiguration.of(context).copyWith(dragDevices: {
                  PointerDeviceKind.touch,
                  PointerDeviceKind.mouse,
                }),
                child: Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 16, right: 16),
                    child: ListView.builder(
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      controller: controller,
                      reverse: true,
                      itemCount: messages.length,
                      itemBuilder: (ctx, index) {
                        final chatMessage = messages[index].data();
                        final nextChatMessage = index + 1 < messages.length
                            ? messages[index + 1].data()
                            : null;
                        final currentMessageUserId = chatMessage['uid'];
                        final nextMessageUserId = nextChatMessage != null
                            ? nextChatMessage['uid']
                            : null;
                        final nextUserIsSame =
                            nextMessageUserId == currentMessageUserId;
                        if (nextUserIsSame) {
                          return MessageBubble.next(
                              message: chatMessage['message'],
                              isMe: authUser!.uid == currentMessageUserId);
                        } else {
                          return MessageBubble.first(
                              userImage: chatMessage['photo'],
                              username: chatMessage['username'],
                              message: chatMessage['message'],
                              isMe: authUser!.uid == currentMessageUserId);
                        }
                      },
                    ),
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }

  @override
  void initState() {
    instance = this;
    super.initState();
  }

  @override
  Widget build(BuildContext context) => widget.build(context, this);
}
