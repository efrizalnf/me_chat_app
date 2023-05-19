import 'package:flutter/material.dart';
import 'package:me_chat_app/core.dart';

import '../../../services/auth_service/firebase_chat_service.dart';

class HomeController extends State<HomeView> implements MvcController {
  static late HomeController instance;
  late HomeView view;
  TextEditingController chatController = TextEditingController();
  bool isShowEmoji = false;

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

  void sendMessage() async {
    final chatMessage = chatController.text;
    if (chatMessage.trim().isEmpty) {
      return;
    }
    chatController.clear();
    FocusScope.of(context).unfocus();
    await FirebaseChatServices.sendChatMessage(chatMessage);
  }

  @override
  void initState() {
    instance = this;
    super.initState();
  }

  @override
  Widget build(BuildContext context) => widget.build(context, this);
}
