import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:me_chat_app/services/auth_service/auth_service.dart';
import 'package:me_chat_app/state_util.dart';
import '../view/login_view.dart';

class LoginController extends State<LoginView> implements MvcController {
  static late LoginController instance;
  late LoginView view;
  var isLogin = true;
  var isLoading = false;
  var username = '';
  var password = '';
  final form = GlobalKey<FormState>();
  File? imagePicked;
  // Function(File pickedImage)? onPickedImage;

  checkIsLogin() {
    setState(() {
      isLogin = !isLogin;
    });
  }

  doLogin() {
    AuthServices.authDoLogin();
  }

  // checkUsername() {
  //   if (doLogin() == true) {
  //     var name = FirebaseAuth.instance.currentUser!.displayName;
  //     var email = FirebaseAuth.instance.currentUser!.email;
  //     log('$name and $email');
  //   } else {
  //     return false;
  //   }
  // }

  /* Signup Section */
  void imagePicker() async {
    final imagePicker = await ImagePicker().pickImage(
      source: ImageSource.camera,
      imageQuality: 40,
      maxWidth: 150,
      maxHeight: 150,
    );

    if (imagePicker == null) {
      return;
    }

    setState(() {
      imagePicked = File(imagePicker.path);
    });

    // onPickedImage!(imagePicked!);
  }

  void submit() {
    try {
      setState(() {
        isLoading = true;
      });
      final isValid = form.currentState!.validate();
      if (!isValid || isLogin && imagePicked == null) {
        return;
      }
      form.currentState!.save();

      if (isLogin) {
        AuthServices.authSignInWithEmailAndPassword(username, password);
      } else if (imagePicked != null) {
        AuthServices.authSignUpWithEmailAndPassword(
            username, password, imagePicked!);
        return;
      }
    } on FirebaseAuthException catch (e) {
      ScaffoldMessenger.of(context).clearSnackBars();
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(e.message ?? 'User already')));
    }
    setState(() {
      isLoading = false;
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
