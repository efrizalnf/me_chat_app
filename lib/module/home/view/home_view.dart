import 'package:flutter/material.dart';
import 'package:me_chat_app/core.dart';
import 'package:me_chat_app/module/home/widget/chat_list_msg.dart';
import '../controller/home_controller.dart';

import '../widget/chat_input_msg.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  Widget build(context, HomeController controller) {
    controller.view = this;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Me Chat"),
        actions: [
          IconButton(
            onPressed: controller.doLogout,
            icon: const Icon(
              Icons.exit_to_app,
            ),
          )
        ],
      ),
      body: Column(
        children: [
          const ChatListMsg(),
          ChatInputMsg(
            chatController: controller.chatController,
            isShowEmoji: !controller.isShowEmoji,
            showEmoji: controller.showEmoji,
            onSendMessage: controller.sendMessage,
          ),
        ],
      ),
    );
  }

  @override
  State<HomeView> createState() => HomeController();
}
