import 'package:flutter/material.dart';
import 'package:me_chat_app/state_util.dart';
import '../view/welcome_view.dart';

class WelcomeController extends State<WelcomeView> implements MvcController {
  static late WelcomeController instance;
  late WelcomeView view;

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