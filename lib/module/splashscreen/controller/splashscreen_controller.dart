import 'package:flutter/material.dart';
import 'package:me_chat_app/state_util.dart';
import '../view/splashscreen_view.dart';

class SplashscreenController extends State<SplashscreenView> implements MvcController {
  static late SplashscreenController instance;
  late SplashscreenView view;

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