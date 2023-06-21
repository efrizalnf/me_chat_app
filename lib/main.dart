import 'package:me_chat_app/provider/user_provider.dart';
import 'package:me_chat_app/state_util.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:me_chat_app/core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'config.dart';
import 'module/welcome/welcome_view.dart';

void main() async {
  await init();
  runApp(
    ChangeNotifierProvider<AuthProvider>.value(
      value: AuthProvider(),
      child: const MyApp(),
    ),
  );
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
        primarySwatch: Colors.amber,
      ),
      home: StreamBuilder(
        stream:
            Provider.of<AuthProvider>(context, listen: false).authStateChanges,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const SplashscreenView();
          } else {
            if (snapshot.hasData) {
              return const HomeView();
            }
            return const WelcomeView();
          }
        },
      ),
    );
  }
}
