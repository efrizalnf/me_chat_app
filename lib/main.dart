import 'package:me_chat_app/state_util.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:me_chat_app/core.dart';
import 'package:flutter/material.dart';

import 'config.dart';
import 'module/home/widget/chat_appbar.dart';
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
      home: StreamBuilder(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const SplashscreenView();
            }
            if (snapshot.hasData) {
              return const HomeView();
            }
            return const WelcomeView();
          }),
    );
  }
}
