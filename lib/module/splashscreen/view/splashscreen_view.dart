import 'package:flutter/material.dart';
import 'package:me_chat_app/core.dart';
import '../controller/splashscreen_controller.dart';

class SplashscreenView extends StatefulWidget {
  const SplashscreenView({Key? key}) : super(key: key);

  Widget build(context, SplashscreenController controller) {
    controller.view = this;

    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [const Text('Loading....')],
          ),
        ),
      ),
    );
  }

  @override
  State<SplashscreenView> createState() => SplashscreenController();
}
