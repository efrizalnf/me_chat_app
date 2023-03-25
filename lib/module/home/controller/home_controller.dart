import 'package:flutter/material.dart';
import 'package:me_chat_app/state_util.dart';
import '../view/home_view.dart';

class HomeController extends State<HomeView> implements MvcController {
  static late HomeController instance;
  late HomeView view;
  final TextEditingController controller = TextEditingController();
  bool emojiShowing = false;

  void showEmoji() {
    setState(() {
      emojiShowing = !emojiShowing;
    });
  }

  @override
  void initState() {
    instance = this;
    super.initState();
  }

  @override
  void dispose() => super.dispose();

  @override
  Widget build(BuildContext context) => widget.build(context, this);
}
