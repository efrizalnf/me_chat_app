import 'package:me_chat_app/state_util.dart';
import 'package:flutter/material.dart';

import 'config.dart';
import 'module/home/view/home_view.dart';
import 'module/login/view/login_view.dart';

void main() async {
  await init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Me Chat',
      navigatorKey: Get.navigatorKey,
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: const HomeView(),
    );
  }
}
