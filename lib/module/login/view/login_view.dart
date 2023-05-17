import 'package:flutter/material.dart';
import 'package:me_chat_app/core.dart';
import '../controller/login_controller.dart';

class LoginView extends StatefulWidget {
  const LoginView({Key? key}) : super(key: key);

  Widget build(context, LoginController controller) {
    controller.view = this;

    return Scaffold(
      backgroundColor: Colors.green[200],
      body: Center(
        child: SingleChildScrollView(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              margin: const EdgeInsets.only(
                top: 30,
                bottom: 20,
                left: 20,
                right: 20,
              ),
              width: 200,
              child: Image.asset('assets/images/logo.png'),
            ),
            Card(
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadiusDirectional.only(
                  bottomStart: Radius.circular(95),
                  topEnd: Radius.circular(95),
                ),
              ),
              margin: const EdgeInsets.all(20),
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Form(
                    child: Column(
                      children: [
                        TextFormField(
                          decoration: const InputDecoration(
                            labelText: 'Email address',
                          ),
                          keyboardType: TextInputType.emailAddress,
                          autocorrect: false,
                          textCapitalization: TextCapitalization.none,
                        ),
                        TextFormField(
                          decoration: const InputDecoration(
                            labelText: 'Passsword',
                          ),
                          obscureText: true,
                        ),
                        const SizedBox(height: 15),
                        ElevatedButton(
                          onPressed: () {},
                          child: Text(
                            controller.isLogin ? 'Sign Up' : 'Sign In',
                          ),
                        ),
                        TextButton(
                          onPressed: () {
                            controller.checkIsLogin();
                          },
                          child: Text(
                            controller.isLogin
                                ? 'Create an account'
                                : 'I have allready an account',
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            )
          ],
        )),
      ),
    );
  }

  @override
  State<LoginView> createState() => LoginController();
}
