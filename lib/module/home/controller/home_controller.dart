import 'package:flutter/material.dart';
import 'package:me_chat_app/core.dart';

import '../../../services/auth_service/firebase_chat_service.dart';

class HomeController extends State<HomeView> implements MvcController {
  static late HomeController instance;
  late HomeView view;
  TextEditingController chatController = TextEditingController();
  bool isShowEmoji = false;
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

  @override
  void initState() {
    instance = this;
    super.initState();
  }

  @override
  Widget build(BuildContext context) => widget.build(context, this);
}
