import 'package:flutter/material.dart';
import 'package:me_chat_app/core.dart';
import '../controller/login_controller.dart';

class LoginView extends StatefulWidget {
  const LoginView({Key? key}) : super(key: key);

  Widget build(context, LoginController controller) {
    controller.view = this;

    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(10.0),
          child: SafeArea(
            child: Center(
              child: Column(
                children: [
                  ElevatedButton.icon(
                    icon: const Icon(Icons.input),
                    label: const Text("Login"),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blueGrey,
                    ),
                    onPressed: () {
                      controller.doLogin();
                    },
                  ),
                  ElevatedButton.icon(
                    icon: const Icon(Icons.power_off),
                    label: const Text("logout"),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blueGrey,
                    ),
                    onPressed: () {
                      controller.doLogout();
                    },
                  ),
                  ElevatedButton.icon(
                    icon: const Icon(Icons.check),
                    label: const Text("Cek username"),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blueGrey,
                    ),
                    onPressed: () {
                      controller.checkUsername();
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  State<LoginView> createState() => LoginController();
}
