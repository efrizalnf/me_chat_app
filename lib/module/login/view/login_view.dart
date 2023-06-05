import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:me_chat_app/core.dart';
import '../../../shared/widget/image_picker.dart';
import '../controller/login_controller.dart';

class LoginView extends StatefulWidget {
  const LoginView({Key? key}) : super(key: key);

  Widget build(context, LoginController controller) {
    controller.view = this;

    return Scaffold(
      backgroundColor: const Color(0xFFFFCB45),
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
              width: 150,
              child: Image.asset('assets/images/logo.png'),
            ),
            Card(
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(20)),
              ),
              margin: const EdgeInsets.all(20),
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Form(
                    key: controller.form,
                    child: Column(
                      children: [
                        if (!controller.isLogin)
                          ImagePickerWidget(
                            getImage: controller.imagePicker,
                            foreGroundImage: controller.imagePicked != null
                                ? FileImage(controller.imagePicked!)
                                : null,
                          ),

                        TextFormField(
                          decoration: const InputDecoration(
                            labelText: 'Email address',
                          ),
                          keyboardType: TextInputType.emailAddress,
                          autocorrect: false,
                          textCapitalization: TextCapitalization.none,
                          validator: (value) {
                            if (value == null ||
                                value.trim().isEmpty ||
                                !value.contains('@')) {
                              return 'This input must be an email';
                            }
                            return null;
                          },
                          onSaved: (value) {
                            controller.email = value!;
                          },
                        ),
                        if (!controller.isLogin)
                          TextFormField(
                            decoration: const InputDecoration(
                              labelText: 'Username',
                            ),
                            validator: (value) {
                              if (value == null || value.trim().length < 4) {
                                return 'Username must be up to 4 character';
                              }
                              return null;
                            },
                            onSaved: (value) {
                              controller.username = value!;
                            },
                          ),
                        TextFormField(
                          decoration: const InputDecoration(
                            labelText: 'Passsword',
                          ),
                          obscureText: true,
                          validator: (value) {
                            if (value == null || value.trim().length > 6) {
                              return 'Password must be min 6 character';
                            }
                            return null;
                          },
                          onSaved: (value) {
                            controller.password = value!;
                          },
                        ),
                        const SizedBox(height: 25),
                        if (controller.isLoading)
                          const CircularProgressIndicator(),
                        if (!controller.isLoading)
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                            ),
                            onPressed: controller.submit,
                            child: Text(
                              controller.isLogin ? 'Sign In' : 'Sign Up',
                            ),
                          ),
                        // if (!controller.isLoading)
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
