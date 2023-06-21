import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:me_chat_app/core.dart';
import 'package:me_chat_app/provider/user_provider.dart';
import 'package:me_chat_app/state_util.dart';
import 'package:provider/provider.dart';
import '../../../services/auth_service/firebase_chat_service.dart';
import '../view/login_view.dart';

class LoginController extends State<LoginView> implements MvcController {
  static late LoginController instance;
  late LoginView view;
  var isLogin = true;
  var isLoading = false;
  var email = '';
  var password = '';
  var username = '';
  final form = GlobalKey<FormState>();
  File? imagePicked;
  // final authProvider = Get.currentContext.watch<AuthProvider>();
  // Function(File pickedImage)? onPickedImage;

  checkIsLogin() {
    setState(() {
      isLogin = !isLogin;
    });
  }

  doLogin() {
    FirebaseChatServices.authDoLogin();
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
      source: ImageSource.gallery,
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
  }

  void submit() async {
    final isValid = form.currentState!.validate();
    if (!isValid) {
      setState(() {
        isLoading = false;
      });
      return;
    }
    try {
      form.currentState!.save();

      setState(() {
        isLoading = true;
      });
      if (isLogin) {
        await FirebaseChatServices.authSignInWithEmailAndPassword(
            email, password);
      } else if (imagePicked != null) {
        await FirebaseChatServices.authSignUpWithEmailAndPassword(
            email, password, username, imagePicked!);
        return;
      }
    } on FirebaseAuthException catch (e) {
      ScaffoldMessenger.of(context).clearSnackBars();
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(e.message ?? 'User already')));
      setState(() {
        isLoading = false;
      });
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
